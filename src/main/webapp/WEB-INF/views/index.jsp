<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>Strona główna</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            flex-direction: row;
        }

        .header {
            background-color: lightgray;
            padding: 10px;
            text-align: center;
        }

        .options {
            background-color: lightgray;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .line {
            width: 100%;
            height: 1px;
            background-color: black;
            margin-top: 10px;
        }

        .sidebar {
            background-color: lightgray;
            padding: 10px;
        }

        .content {
            flex: 4;
            padding: 10px;
        }

        .sidebar a {
            display: block;
            margin-bottom: 10px;
            color: black;
            text-decoration: none;
        }

        .sidebar a:hover {
            color: blue;
        }

        .dashboard {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="sidebar">
        <sec:authorize access="hasRole('ADMIN')">
        <h4> <a href="/categories"> Edycja produktów</a> </h4>
        </sec:authorize>
        <h3> Kategorie Produktów</h3>
        <div class="categories">
            <c:forEach items="${categories}" var="category">
                <a href="/categories/${category.id}">${category.name}</a>
            </c:forEach>
        </div>
    </div>
    <div class="content">
        <div class="header">
            <h1>Mania Zszywania</h1>
        </div>
        <div class="line"></div>
        <div class="options">
            <a href="/order">Zamówienie</a>
            <a href="/info">O Nas</a>
            <a href="/statute">Regulamin</a>
            <a href="/contact">Kontakt</a>
            <sec:authorize access="!isAuthenticated()">
                <a href="${pageContext.request.contextPath}/login">Zaloguj się</a>
            </sec:authorize>
        </div>
        <div class="dashboard">
            <h2>Witaj na stronie głównej!</h2>
        </div>
        <p>Funkcje ktore trzeba poprawic w projekcie:</p>
        <p>-wysylanie maili przez przegladarke</p>

        <img src="Pepe-hands.png" alt="Pepe hands">
    </div>
</div>
</body>
</html>