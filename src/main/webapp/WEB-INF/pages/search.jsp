<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
</head>

<body>
<div id="header"><h1>CRUD</h1></div>
<div id="sidebar">
    <p><a href="/users">Show all users</a></p>
    <p><a href="/addUser">Add new user</a></p>
    <form method="get" action="/search" target="_self" id="searchForm"/>
    <br>
    <h3>Search:</h3>
    <table>
        <tr>
            <td>
                <input name="name" form="searchForm" placeholder="User name">
                <input name="page" form="searchForm" hidden value="0"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type=submit form="searchForm" value="Search">
            </td>
        </tr>
    </table>
</div>
<div id="content">
    <h2>Results:</h2>


    <c:if test="${!empty resultPages.pageList}">
    <table class="tg">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Age</th>
            <th>Is Admin</th>
            <th>Created date</th>
            <th>Edit</th>
            <th>Remove</th>
        </tr>
        <c:forEach items="${resultPages.pageList}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.age}</td>
                <td>
                    <c:if test="${user.admin}">
                        YES
                    </c:if>
                    <c:if test="${!user.admin}">
                        NO
                    </c:if>

                </td>
                <td><fmt:formatDate value="${user.createdDate}" pattern="dd-MM-yyyy HH:mm:ss"/></td>
                <td><a href="/edit=${user.id}">edit</a></td>
                <td><a href="/remove=${user.id}">remove</a></td>
            </tr>
        </c:forEach>

        <tr>
            <td style="border-style:hidden"><a <c:if test="${resultPages.firstPage}">hidden</c:if>  href="/search${prevPageRequest}">Prev</a></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"></td>
            <td style="border-style:hidden"><a <c:if test="${resultPages.lastPage}">hidden</c:if>  href="/search${nextPageRequest}">Next</a></td>
        </tr>
        </c:if>
        <c:if test="${empty resultPages.pageList}">
            No matches.
        </c:if>

    </table>
</div>
</body>
</html>