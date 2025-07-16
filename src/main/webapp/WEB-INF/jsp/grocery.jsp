<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Grocery Shop</title>
  <style>
    body { font-family: Arial, sans-serif; text-align: center; background: #f9f9f9; margin: 0; padding: 20px; }
    .products {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
      gap: 20px;
      margin-bottom: 30px;
    }
    .product {
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 6px;
      padding: 15px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .product h4 { margin: 0 0 10px; font-size: 1.1em; color: #333; }
    .product p { margin: 6px 0; font-weight: bold; color: #555; }
    .product input[type=number] {
      width: 60px;
      padding: 4px;
      margin-bottom: 8px;
      text-align: center;
    }
    .product button {
      width: 100%;
      padding: 8px;
      background: purple;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background 0.2s;
    }
    .product button:hover { background: darkmagenta; }
    table {
      width: 80%;
      margin: auto;
      border-collapse: collapse;
    }
    th, td { padding: 8px; border: 1px solid #ccc; }
    .proceed { margin-top: 20px; }
  </style>
</head>
<body>
  <h2>Select Grocery Items</h2>

  <div class="products">
    <!-- Static product list with default prices -->
    <c:set var="products" value="${
[
       {'name':'Milk','price':45.0},
       {'name':'Oil','price':120.0},
       {'name':'Wheat','price':60.0},
       {'name':'Sugar','price':50.0},
       {'name':'Tea','price':200.0},
       {'name':'Coffee','price':250.0},
       {'name':'Bread','price':30.0},
       {'name':'Salt','price':20.0},
       {'name':'cheese','price':50.0},
       {'name':'butter','price':200.0},
       {'name':'rice','price':250.0},
       {'name':'curd','price':30.0}
       
    ]
    }" />

    <c:forEach var="prod" items="${products}">
      <div class="product">
        <h4>${prod.name}</h4>
        <p>Price: ₹${prod.price}</p>
        <form action="addItem" method="post">
          <input type="hidden" name="name" value="${prod.name}" />
          <input type="hidden" name="price" value="${prod.price}" />
          <input type="number" name="qty" value="1" min="1" max="10" />
          
        </form>
      </div>
    </c:forEach>
  </div>

  <c:if test="${not empty items}">
    <h3>Your Cart</h3>
    <table>
      <thead>
        <tr>
          <th>Item</th><th>Qty</th><th>Price</th><th>Tax Rate</th><th>Total</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="i" items="${items}">
          <tr>
            <td>${i.name}</td>
            <td>${i.qty}</td>
            <td>₹${i.price}</td>
            <td>${i.taxRate * 100}%</td>
            <td>₹${i.total}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <a href="clear">🗑️ Clear All Items</a>
    
    <div class="proceed">
      <a href="/customer"><button>Proceed to Customer</button></a>
    </div> 
  </c:if>
</body>
</html>
