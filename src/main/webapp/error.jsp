<%-- error.jsp: shown when something fails (for example, the database is down) --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TechShop - Error</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <main class="container">
        <h1>Something went wrong</h1>
        <p class="error-msg">
            <c:out value="${empty errorMessage ? 'An unexpected error occurred.' : errorMessage}" />
        </p>
        <a class="btn" href="${pageContext.request.contextPath}/catalog">Back to Products</a>
    </main>
</body>
</html>