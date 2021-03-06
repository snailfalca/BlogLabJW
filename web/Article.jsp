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
        <jsp:useBean id="cb" class="com.bean.CategoryBean"/>
        <jstl:set var="post" scope="request" value="${ab.getArticleById(param.ID)}"/>
        <jstl:set var="recents" scope="request" value="${ab.recentArticles}"/>

        <header>
            <jsp:include page="Header.jsp"/>
        </header>
        <article>
            <section>                
                <h3>${post.name}</h3>
                <p><fmt:formatDate type="date" dateStyle="long" value="${post.postedDate}"/> - <b>Full Article</b></p>
                <p>
                    <jstl:if test="${post.imagePath.length()==0}">
                        <img class="blogImage" src="images/img04 - Copy.jpg"/>
                    </jstl:if>
                    ${post.content}
                </p>
                <br>
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
