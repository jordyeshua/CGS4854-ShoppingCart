
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="en_US" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Confirmation</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />
    <main class="container narrow">
        <c:choose>
            <c:when test="${empty order}">
                <h1>Order Confirmation</h1>
                <p class="notice">We could not find a recent order to show.</p>
                <a class="btn" href="${pageContext.request.contextPath}/catalog">Back to Products</a>
            </c:when>
            <c:otherwise>
                <h1>Thank you for your order!</h1>
                <p class="success-msg">
                    Your order has been placed. A confirmation email was sent to
                    <strong><c:out value="${order.customerEmail}" /></strong>.
                </p>

                <div class="detail-card">
                    <dl>
                        <dt>Order ID</dt>
                        <dd>#<c:out value="${order.orderID}" /></dd>

                        <dt>Tracking Number</dt>
                        <dd><strong><c:out value="${order.trackingNumber}" /></strong></dd>

                        <dt>Status</dt>
                        <dd><c:out value="${order.orderStatus}" /></dd>

                        <dt>Name</dt>
                        <dd><c:out value="${order.customerName}" /></dd>

                        <dt>Ship To</dt>
                        <dd><c:out value="${order.shippingAddress}" /></dd>

                        <dt>Total</dt>
                        <dd><fmt:formatNumber value="${order.totalAmount}" type="currency" /></dd>
                    </dl>
                </div>

                <div class="actions">
                    <a class="btn btn-secondary"
                       href="${pageContext.request.contextPath}/tracking?trackingNumber=<c:out value='${order.trackingNumber}' />">Track This Order</a>
                    <a class="btn" href="${pageContext.request.contextPath}/catalog">Continue Shopping</a>
                </div>
            </c:otherwise>
        </c:choose>
    </main>
    </body>
</html>
