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
        <style>
            #contactNav{
                color: white;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="ab" class="com.bean.ArticleBean"/>
        <jsp:useBean id="cb" class="com.bean.CategoryBean"/>
        <jstl:set var="newest" scope="request" value="${ab.newestArticle}"/>
        <jstl:set var="categories" scope="request" value="${cb.allCategories}"/>

        <header>
            <jsp:include page="Header.jsp"/>
        </header>
        <article>
            <section class="inputSection">
                <div class="inputBox">
                    <div id="warningText">All fields are required</div>
                    <form action="SendContactServlet" method="POST">
                        <p>
                            <span class="inputLabel">Name: </span>
                            <input class="inputField" name="name" type="text"/>
                        </p>
                        <p>
                            <span class="inputLabel">Email: </span>
                            <input class="inputField" name="email" type="email"/>
                        </p>
                        <p>
                            <span class="inputLabel">Phone: </span>
                            <input class="inputField" name="phone" type="tel"/>
                        </p>
                        <p>
                            <span class="inputLabel">Company: </span>
                            <input class="inputField" name="company" type="text"/>
                        </p>
                        <p>
                            <span class="inputLabel">Message: </span>
                            <textarea id="inputArea" rows="5" name="message"></textarea>
                        </p>
                        <p class="inputLine">
                            <input id="sendBtn" type="submit" value="Send"/>
                        </p>
                    </form>
                </div>
            </section>
            <aside>
                <jsp:include page="Aside.jsp"/>
            </aside>
        </article>
    </body>
</html>
