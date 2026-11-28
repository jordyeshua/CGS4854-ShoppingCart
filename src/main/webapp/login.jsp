

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <title>Login Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
    <main class="container narrow">
        <h1>Login</h1>

        <c:if test="${not empty errorMessage}">
            <p class="error-msg"><c:out value="${errorMessage}" /></p>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post" class="form-card">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required
                   value="<c:out value='${param.email}' />">

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <button type="submit" class="btn">Log In</button>
        </form>
        <p>New here? <a href="${pageContext.request.contextPath}/register">Create an account</a></p>
    </main>
    </body>
</html>
