package com.example.productmodel.controller;

import com.example.productmodel.entity.Product;
import com.example.productmodel.model.MySqlProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class CreateProductServlet extends HttpServlet {
    private MySqlProductModel mySqlProductModel;

    @Override
    public void init() throws ServletException {
        mySqlProductModel = new MySqlProductModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/product/create.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; chartset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String detail = req.getParameter("detail");
        Double price = 0.0;
        if(req.getParameter("price") != null && req.getParameter("price") != "") {
            price = Double.parseDouble(req.getParameter("price"));
        }
        String thumbnail = req.getParameter("thumbnail");
        String manufactureEmail = req.getParameter("manufactureEmail");
        String manufacturePhone = req.getParameter("manufacturePhone");
        Product product = new Product(name, description,detail, price,  thumbnail, manufactureEmail, manufacturePhone);
        if(product.isValid()) {
            mySqlProductModel.save(product);
            resp.sendRedirect("/list");
        }else {
            req.setAttribute("errors", product.getErrors());
            req.setAttribute("product", product); // set lai product de luu ga tri
            req.getRequestDispatcher("/product/create.jsp").forward(req,resp);
        }
    }
}
