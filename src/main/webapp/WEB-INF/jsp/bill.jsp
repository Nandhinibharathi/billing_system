<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Grocery Shop</title>
<style>
  body {
    font-family: Arial;
    text-align: center;
    background: #f9f9f9;
  }

  .products {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    padding: 20px;
  }

  .product {
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    width: 180px;
    padding: 10px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  }

  .product img {
    width: 100%;
    height: 120px;
    object-fit: cover;
    border-radius: 5px;
  }

  .product h4 {
    margin: 10px 0 5px;
    font-size: 1rem;
    color: #333;
  }

  .product p {
    margin: 0 0 10px;
    color: #666;
    font-size: 0.9rem;
  }

  .product form {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .product input[type="number"] {
    width: 60px;
    padding: 4px;
    margin-bottom: 8px;
    text-align: center;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  .product button {
    padding: 6px 12px;
    background: purple;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background 0.2s;
  }

  .product button:hover {
    background: darkmagenta;
  }

  table {
    margin: auto;
    width: 80%;
    border-collapse: collapse;
    margin-top: 20px;
  }

  th, td {
    padding: 8px;
    border: 1px solid #ccc;
  }

  .total-summary {
    margin-top: 20px;
    font-size: 1.2rem;
    font-weight: bold;
  }
</style>

</head>
<body>

  <div class="products">
    <c:forEach var="prod" items="${products}">
      <div class="product">
        <img src="${prod.imageUrl}" alt="${prod.name}" />
        <h4>${prod.name}</h4>
        <p>₹${prod.price}</p>
        <form action="addItem" method="post">
          <input type="hidden" name="name" value="${prod.name}"/>
          <input type="hidden" name="price" value="${prod.price}"/>
          <input type="number" name="qty" value="1" min="1"/>
          <button type="submit">Add to Cart</button>
        </form>
      </div>
    </c:forEach>
  </div>

  <c:if test="${not empty items}">
    <!-- initialize the running total -->
    <c:set var="grandTotal" value="0.0" scope="page"/>

    <h1>Cart Overview</h1>
<h2>Bill for ${customer.name}</h2>
<p>Name: ${customer.name}<br/>
Phone: ${customer.phone}<br/>
   Place: ${customer.place}</p>

<c:if test="${not empty items}">
  <!-- cart details here -->
</c:if>

    <table>
      <tr><th>Item</th><th>Qty</th><th>Price</th><th>Tax (5%)</th></tr>
      <c:forEach var="i" items="${items}">
        <tr>
          <td>${i.name}</td>
          <td>${i.qty}</td>
          <td>Rs.<fmt:formatNumber value="${i.price * i.qty}" type="number" maxFractionDigits="2" minFractionDigits="2"/></td>
          <td>
            Rs.<fmt:formatNumber value="${i.price * i.qty * i.taxRate}" type="number" maxFractionDigits="2" minFractionDigits="2"/>
          </td>
        </tr>

        <!-- add to grand total -->
        <c:set var="grandTotal"
               value="${grandTotal + (i.price * i.qty) + (i.price * i.qty * i.taxRate)}"
               scope="page"/>
      </c:forEach>
    </table>

    <!-- display grand total -->
    <div class="total-summary">
      Grand Total: Rs.<fmt:formatNumber value="${grandTotal}" type="number" maxFractionDigits="2" minFractionDigits="2"/>
    </div>

    <hr/>
    <a href="clear">Clear All Items</a>
    <a href="/"><button onclick="alert('Bill Generated!')">generate bill</button></a>
  </c:if>

</body>
</html>
