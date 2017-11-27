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
                background-image: url("images/img02.jpg");
                background-position: center;
                background-position-y: 24px;
                background-repeat: no-repeat;
            }
            
            #contactNav a{
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
                    <form id="contactForm" action="SendContactServlet" method="POST">
                        <p>
                            <span class="inputLabel">Name: </span>
                            <input class="inputField" name="name" type="text"/>
                        </p>
                        <p>
                            <span class="inputLabel">Email: </span>
                            <input id="email" class="inputField" name="email" type="email" required=""/>
                        </p>
                        <p>
                            <span class="inputLabel">Phone: </span>
                            <input id="phoneNumber" class="inputField" name="phone" type="tel"/>
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
                            <input id="sendBtn" type="button" onclick="validateForm();" value="Send"/>
                        </p>
                    </form>
                </div>
            </section>
            <aside>
                <jsp:include page="Aside.jsp"/>
            </aside>
        </article>
    </body>
    <script>
        function validateForm() {
            var inputFields = Array.from(document.getElementsByClassName("inputField"));
            var inputArea = document.getElementById("inputArea");
            var phoneNumber = document.getElementById("phoneNumber");
            var email = document.getElementById("email");
            var contactForm = document.getElementById("contactForm");

//          Check if any fields is null
            for (var i = 0, max = 4; i < max; i++) {
                if (inputFields[i].value.length === 0) {
                    inputFields[i].focus();
                    document.getElementById("warningText").setAttribute("style", "display: block;");
                    return;
                }
            }

//          check if input area is null
            if (inputArea.value.length === 0) {
                inputArea.focus();
                document.getElementById("warningText").setAttribute("style", "display: block;");
                return;
            }

//          check of phone number is valid
            if (isNaN(parseInt(phoneNumber.value))) {
                phoneNumber.focus();
                document.getElementById("warningText").innerHTML = "Invalid phone number";
                document.getElementById("warningText").setAttribute("style", "display: block;");
                return;
            }

//          validate email
            if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email.value))){
                email.focus();
                document.getElementById("warningText").innerHTML = "Invalid email";
                document.getElementById("warningText").setAttribute("style", "display: block;");
                return;
            }

//          data validated, submit
            contactForm.submit();
            return;

        }
    </script>
</html>
