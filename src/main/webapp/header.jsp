<%-- header.jsp: navigation bar included on every page --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<header class="site-header">
    <a class="brand" href="${pageContext.request.contextPath}/catalog">TechShop</a>
    <nav>
        <a href="${pageContext.request.contextPath}/catalog">Products</a>
        <a href="${pageContext.request.contextPath}/cart">Cart
            (<c:out value="${empty sessionScope.cart ? 0 : sessionScope.cart.itemCount}" />)</a>
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <span>Hi, <c:out value="${sessionScope.user.fullName}" /></span>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/login">Login</a>
            </c:otherwise>
        </c:choose>
    </nav>
</header>