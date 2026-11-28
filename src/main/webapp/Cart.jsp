
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="en_US" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <title>Your - Cart </title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
    <main class="container">
        <h1>Your Shopping Cart</h1>

        <c:if test="${not empty errorMessage}">
            <p class="error-msg"><c:out value="${errorMessage}" /></p>
        </c:if>

        <c:choose>
            <c:when test="${empty sessionScope.cart or empty sessionScope.cart.items}">
                <p class="notice">Your cart is empty.</p>
                <a class="btn" href="${pageContext.request.contextPath}/catalog">Browse Products</a>
            </c:when>
            <c:otherwise>
                <div class="table-wrap">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${sessionScope.cart.items}">
                            <tr>
                                <td class="product-cell">
                                    <img src="${pageContext.request.contextPath}/${item.product.image}"
                                         alt="<c:out value='${item.product.name}' />">
                                    <span><c:out value="${item.product.name}" /></span>
                                </td>
                                <td><fmt:formatNumber value="${item.product.price}" type="currency" /></td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/cart" method="post" class="add-form">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="productId" value="${item.product.productID}">
                                        <input type="number" name="quantity" value="${item.quantity}"
                                               min="1" max="99" required>
                                        <button type="submit" class="btn btn-secondary">Update</button>
                                    </form>
                                </td>
                                <td><fmt:formatNumber value="${item.subtotal}" type="currency" /></td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/cart" method="post">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="productId" value="${item.product.productID}">
                                        <button type="submit" class="btn btn-danger">Remove</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3" class="total-label">Total</td>
                            <td colspan="2" class="total-value">
                                <fmt:formatNumber value="${sessionScope.cart.total}" type="currency" />
                            </td>
                        </tr>
                    </tfoot>
                </table>
                </div>

                <div class="actions">
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/catalog">Continue Shopping</a>
                    <a class="btn" href="${pageContext.request.contextPath}/checkout">Proceed to Checkout</a>
                </div>
            </c:otherwise>
        </c:choose>
    </main>
    </body>
</html>
