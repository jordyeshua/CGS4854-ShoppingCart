
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="en_US" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Track Order</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />
    <main class="container narrow">
        <h1>Track Your Order</h1>

        <form action="${pageContext.request.contextPath}/tracking" method="get" class="form-card">
            <label for="trackingNumber">Tracking Number</label>
            <input type="text" id="trackingNumber" name="trackingNumber" maxlength="30" required
                   value="<c:out value='${param.trackingNumber}' />">
            <button type="submit" class="btn">Look Up</button>
        </form>

        <c:if test="${not empty errorMessage}">
            <p class="error-msg"><c:out value="${errorMessage}" /></p>
        </c:if>

        <c:if test="${not empty param.trackingNumber and empty order and empty errorMessage}">
            <p class="notice">No order was found for that tracking number.</p>
        </c:if>

        <c:if test="${not empty order}">
            <div class="detail-card">
                <dl>
                    <dt>Tracking Number</dt>
                    <dd><c:out value="${order.trackingNumber}" /></dd>

                    <dt>Status</dt>
                    <dd><span class="status-badge"><c:out value="${order.orderStatus}" /></span></dd>

                    <dt>Order ID</dt>
                    <dd>#<c:out value="${order.orderID}" /></dd>

                    <dt>Ship To</dt>
                    <dd><c:out value="${order.shippingAddress}" /></dd>

                    <dt>Total</dt>
                    <dd><fmt:formatNumber value="${order.totalAmount}" type="currency" /></dd>
                </dl>
            </div>
        </c:if>
    </main>
    </body>
</html>
