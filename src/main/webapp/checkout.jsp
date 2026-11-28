
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="en_US" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
         <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />
    <main class="container">
        <h1>Checkout</h1>

        <c:if test="${not empty errorMessage}">
            <p class="error-msg"><c:out value="${errorMessage}" /></p>
        </c:if>
        <c:if test="${not empty errors}">
            <div class="error-msg">
                <strong>Please fix the following:</strong>
                <ul>
                    <c:forEach var="err" items="${errors}">
                        <li><c:out value="${err}" /></li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <c:choose>
            <c:when test="${empty sessionScope.cart or empty sessionScope.cart.items}">
                <p class="notice">Your cart is empty, so there is nothing to check out.</p>
                <a class="btn" href="${pageContext.request.contextPath}/catalog">Browse Products</a>
            </c:when>
            <c:when test="${empty sessionScope.user}">
                <p class="notice">Please log in before placing your order.</p>
                <a class="btn" href="${pageContext.request.contextPath}/login">Log In</a>
            </c:when>
            <c:otherwise>
                <div class="checkout-layout">
                    <form action="${pageContext.request.contextPath}/checkout" method="post" class="form-card">
                        <label for="fullName">Full Name</label>
                        <input type="text" id="fullName" name="fullName" maxlength="100" required
                               value="<c:out value='${empty param.fullName ? sessionScope.user.fullName : param.fullName}' />">

                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" maxlength="100" required
                               value="<c:out value='${empty param.email ? sessionScope.user.email : param.email}' />">

                        <label for="shippingAddress">Shipping Address</label>
                        <textarea id="shippingAddress" name="shippingAddress" rows="3" maxlength="255"
                                  required><c:out value="${param.shippingAddress}" /></textarea>

                        <button type="submit" class="btn">Place Order</button>
                    </form>

                    <aside class="summary-card">
                        <h2>Order Summary</h2>
                        <ul class="summary-list">
                            <c:forEach var="item" items="${sessionScope.cart.items}">
                                <li>
                                    <span><c:out value="${item.product.name}" /> &times; ${item.quantity}</span>
                                    <span><fmt:formatNumber value="${item.subtotal}" type="currency" /></span>
                                </li>
                            </c:forEach>
                        </ul>
                        <p class="summary-total">
                            Total: <fmt:formatNumber value="${sessionScope.cart.total}" type="currency" />
                        </p>
                        <a href="${pageContext.request.contextPath}/cart">Edit cart</a>
                    </aside>
                </div>
            </c:otherwise>
        </c:choose>
    </main>
    </body>
</html>
