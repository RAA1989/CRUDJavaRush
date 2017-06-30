<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add user</title>

</head>
<body>
<div id="header"><h1>CRUD</h1></div>
<div id="sidebar">
    <p><a href="/users">Show all users</a></p>
    <p><a href="/addUser">Add new user</a></p>

    <br>
</div>
<div id="content">
    <h2>Add new user </h2>


    <c:url var="addAction" value="/add"/>

    <form:form action="${addAction}" commandName="user">
        <table>
            <tr>
                <td>
                    <form:label path="name">
                        <spring:message text="Name"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="name"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="age">
                        <spring:message text="Age"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="age"/>
                </td>
            </tr>
            <tr>
                <td>
                    <spring:message text="Is admin"/>
                </td>
                <td>
                    <form:checkbox path="admin" id="admin"/>
                </td>
            </tr>
            <tr>
            <tr>
                <td colspan="2">

                    <input type="submit"
                           value="<spring:message text="Add User"/>"/>

                </td>
            </tr>
        </table>
    </form:form>
    <c:if test="${isInvalidArguments}">
        User field can't be empty and age value must be more than 0. Please try again.
    </c:if>
</div>
</body>
</html>