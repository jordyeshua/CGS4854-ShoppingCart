<%-- catalog.jsp: product list loaded from MySQL by CatalogServlet --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="en_US" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TechShop - Products</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <main class="container">
        <h1>Products</h1>
        <c:if test="${empty products}">
            <p class="notice">No products are available right now.</p>
        </c:if>
        <div class="grid">
            <c:forEach var="p" items="${products}">
                <div class="product-card">
                    <img src="${pageContext.request.contextPath}/${p.image}"
                         alt="<c:out value='${p.name}' />">
                    <h3><c:out value="${p.name}" /></h3>
                    <p class="desc"><c:out value="${p.description}" /></p>
                    <p class="price"><fmt:formatNumber value="${p.price}" type="currency" /></p>
                    <form action="${pageContext.request.contextPath}/cart" method="post" class="add-form">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="productId" value="${p.productID}">
                        <input type="number" name="quantity" value="1" min="1" max="99" required>
                        <button type="submit" class="btn">Add to Cart</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </main>
</body>
</html>