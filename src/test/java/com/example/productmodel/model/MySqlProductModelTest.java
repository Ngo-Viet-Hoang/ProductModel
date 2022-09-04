package com.example.productmodel.model;

import com.example.productmodel.entity.Product;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class MySqlProductModelTest {
    private ProductModel productModel;

        @BeforeEach
        void setUp() {
          productModel = new MySqlProductModel();
        }

    @Test
    void save() {
        Product product = new Product("Product 3335552", "description", "detail", 10000,"src/image/product.png","admin@gmail.com", "0123456789" );
        assertEquals(true, productModel.save(product));
    }

    @Test
    void update() {
        List<Product>  products = productModel.findAll();
        assertNotEquals(0, products.size());
        Product product = products.get(0);
        assertNotEquals(null, product);
        product.setName("Product 13333333333333");
        productModel.update(product.getId(), product);
        Product productUpdated = productModel.findById(product.getId());
        assertEquals("Product 13333333333333", productUpdated.getName());
    }

    @Test
    void delete() {
        List<Product>  products = productModel.findAll();
        assertNotEquals(0, products.size());
        Product product = products.get(0);
        assertEquals(true, productModel.delete(product.getId()));
    }

    @Test
    void findById() {
        Product product = productModel.findById(1);
        assertNotEquals(null, product);
    }

    @Test
    void findAll() {
        List<Product> products = productModel.findAll();
        assertNotEquals(0, products.size());
    }
}