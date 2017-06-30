<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CRUD</title>

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
    <h2>CRUD Application </h2>
    <p>JavaRush Test Application</p>

</div>




</body>
</html>