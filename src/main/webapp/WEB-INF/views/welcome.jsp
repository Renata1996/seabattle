<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">

        <form id="logoutForm" method="POST" action="${contextPath}/logout">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>
            Welcome ${pageContext.request.userPrincipal.name} | <a
                onclick="document.forms['logoutForm'].submit()">Logout</a>
        </h2>

        <h1>Logged-in Users</h1>
        <table>
            <tr>
                <td width="100">Username</td>
                <td width="150">Authorities</td>
                <td width="170">IsAccountNonExpired</td>
                <td width="190">IsCredentialsNonExpired</td>

            </tr>

            <c:forEach items="${users}" var="user">

                <form id="play" method="post" action="play"> 
                    <input type="hidden" name="username" value="<c:out value="${user.username}"/>"/>  
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
                <tr>
                    <td><c:out value="${user.username}"/></td>
                    <td><c:out value="${user.authorities}"/></td>
                    <td><c:out value="${user.accountNonExpired}"/></td>
                    <td><c:out value="${user.credentialsNonExpired}"/></td>
                    <td><a onclick="document.forms['play'].submit()">Play</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>