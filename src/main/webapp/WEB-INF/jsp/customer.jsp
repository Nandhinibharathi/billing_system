<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Customer</title>
  <style>
    body { font-family: Arial; text-align: center; }
    .field { margin: 10px 0; }
    label { display: inline-block; width: 80px; text-align: right; margin-right: 10px; }
    input { padding: 5px; width: 200px; }
    button { padding: 6px 12px; background: purple; color: white; border: none; border-radius: 4px; }
    button:hover { background: darkmagenta; }
  </style>
</head>
<body>
  <h2>Enter Customer Details</h2>

  <form:form method="post" modelAttribute="customer" action="${pageContext.request.contextPath}/customer">
    <div class="field">
      <label for="name">Name:</label>
      <form:input path="name" id="name" required="true"/>
    </div>
    <div class="field">
      <label for="phone">Phone:</label>
      <form:input path="phone" id="phone" required="true"/>
    </div>
    <div class="field">
      <label for="place">Place:</label>
      <form:input path="place" id="place" required="true"/>
    </div>
    <div style="margin-top: 20px;">
      <button type="submit">Proceed to Bill</button>
    </div>
  </form:form>
</body>
</html>
