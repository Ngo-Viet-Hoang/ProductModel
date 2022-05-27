<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.productmodel.entity.Product" %>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/27/2022
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .invalid-feedback {
            color: red;
        }
    </style>
</head>
<body>
<%
    HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");
    if(errors == null) {
        errors = new HashMap<>();
    }
    Product product = (Product) request.getAttribute("product");
    if(product == null) {
        product = new Product();
    }
%>
<form class="form-horizontal"  action="/create" method="post">
    <fieldset>

        <!-- Form Name -->
        <legend>PRODUCTS</legend>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="name">Name</label>
            <div class="col-md-4">
                <input id="name" name="name" placeholder="NAME" class="form-control input-md" value="<%= product.getName() %>" type="text">
                <%
                    if(errors.containsKey("name"))   {
                %>
                <div class="invalid-feedback">
                    <%= errors.get("name")%>
                </div>
                <% } %>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="description">Description</label>
            <div class="col-md-4">
                <input id="description" name="description" placeholder="DESCRIPTION" value="<%= product.getDescription() %>" class="form-control input-md" type="text">
            </div>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="detail">Detail</label>
            <div class="col-md-4">
                <textarea id="detail" name="detail" placeholder="DETAILS" class="form-control input-md">
                    <%= product.getDetail() %>
                </textarea>

            </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="price">Price</label>
            <div class="col-md-4">
                <input id="price" name="price" class="form-control"  type="number" value="<%= product.getPrice() %>"/>
                <%
                    if(errors.containsKey("price"))   {
                %>
                <div class="invalid-feedback">
                    <%= errors.get("price")%>
                </div>
                <% } %>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="manufactureEmail"> Manufacture Email</label>
            <div class="col-md-4">
                <input id="manufactureEmail" name="manufactureEmail" placeholder="MANUFACTURE EMAIL" class="form-control input-md" value="<%= product.getManufactureEmail() %>"  type="text">
                <%
                    if(errors.containsKey("manufactureEmail"))   {
                %>
                <div class="invalid-feedback">
                    <%= errors.get("manufactureEmail")%>
                </div>
                <% } %>

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="manufactureEmail"> Manufacture Phone</label>
            <div class="col-md-4">
                <input id="manufacturePhone" name="manufacturePhone" placeholder="MANUFACTURE PHONE" class="form-control input-md" value="<%= product.getManufacturePhone() %>"  type="text">
                <%
                    if(errors.containsKey("manufacturePhone"))   {
                %>
                <div class="invalid-feedback">
                    <%= errors.get("manufacturePhone")%>
                </div>
                <% } %>

            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="thumbnail"> Thumbnail</label>
            <div class="col-md-4">
                <input id="thumbnail" name="thumbnail" placeholder="THUMBNAIL" class="form-control input-md" value="<%= product.getThumbnail() %>"  type="text">
                <%
                    if(errors.containsKey("thumbnail"))   {
                %>
                <div class="invalid-feedback">
                    <%= errors.get("thumbnail")%>
                </div>
                <% } %>

            </div>
        </div>

                <!-- File Button -->
<%--                <div class="form-group">--%>
<%--                    <label class="col-md-4 control-label" for="filebutton">auxiliary_images</label>--%>
<%--                    <div class="col-md-4">--%>
<%--                        <input id="" name="filebutton" class="input-file" type="file">--%>
<%--                    </div>--%>
<%--                </div>--%>

                <!-- Button -->
                <div class="form-group">
                    <label class="col-md-4 control-label" ></label>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-primary btn-lg">Submit</button>
                    </div>
                </div>

            </div>
        </div>
    </fieldset>
</form>


</body>
</html>
