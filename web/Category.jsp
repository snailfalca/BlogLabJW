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
        <jsp:useBean id="ab" class="com.bean.ArticleBean"/>
        <jstl:set var="recents" scope="request" value="${ab.recentArticles}"/>
        <jstl:set var="articles" value="${ab.getArticlesByCategoryId(param.ID)}"/>
        <header>
            <jsp:include page="Header.jsp"/>
        </header>
        <article>
            <section>
                <jstl:if test="${articles.size() == 0}">
                    <p>There's no article in this category!</p>
                </jstl:if>
                <jstl:forEach var="post" items="${articles}">
                    <h3>${post.name}</h3>
                    <p><fmt:formatDate type="date" dateStyle="long" value="${post.postedDate}"/> - <b>Full Article</b></p>
                    <p>
                        <img class="blogImage" src="${post.imagePath}"/>
                        ${post.content}
                    </p>
                    <br>
                </jstl:forEach>
            </section>
            <aside>
                <jsp:include page="Aside.jsp"/>
            </aside>
        </article>
        <footer>
            <hr/>
            <jstl:forEach var="article" items="${recents}">
                <p>
                    <a href="Article.jsp?ID=${article.id}"><b>${article.name}</b> Posted on <fmt:formatDate type="date" dateStyle="long" value="${article.postedDate}"/></a>
                </p>
            </jstl:forEach>
        </footer>
    </body>
</html>
