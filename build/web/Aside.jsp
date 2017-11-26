<%-- 
    Document   : Home
    Created on : Nov 26, 2017, 2:10:46 PM
    Author     : rat
--%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="General.css">
    </head>
    <body>
        <jsp:useBean id="cb" class="com.bean.CategoryBean"/>
        <jstl:set var="categories" scope="request" value="${cb.allCategories}"/>
        
        <h4>Categories</h4>
        <hr/>
        <jstl:forEach var="category" items="${categories}">   
            <p>
                <img src="images/img01.jpg"> <a href="Category.jsp?ID=${category.id}">${category.name}</a>
            </p>
        </jstl:forEach>
    </body>
</html>
