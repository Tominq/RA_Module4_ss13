<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
  Created by IntelliJ IDEA.
  User: AD
  Date: 11/17/2023
  Time: 11:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../assets/head.jsp" />
</head>
<body>
<h1>Danh sách khách hàng</h1>
<a class="btn btn-primary" href="<%= request.getContextPath() %>/CustomerController?action=ADD">Thêm mới khách hàng</a>

<table class="table">
    <thead>
    <tr class="text-center">
        <th scope="col">STT</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Avatar</th>
        <th scope="col">Gen</th>
        <th scope="col" colspan="3">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="c" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${c.name}</td>
            <td>${c.email}</td>
            <td><img width="100" height="100" style="object-fit: cover" src="${c.avt}" alt="${c.name}" /></td>
            <td>${c.gender ? "Nam" : "Nữ"}</td>
            <td><a href="<%= request.getContextPath() %>/CustomerController?action=DETAIL&id=${c.id}" class="btn btn-info">Detail</a></td>
            <td><a href="<%= request.getContextPath() %>/CustomerController?action=EDIT&id=${c.id}" class="btn btn-warning">Edit</a></td>
            <td><a href="<%= request.getContextPath() %>/CustomerController?action=DELETE&id=${c.id}" onclick="return confirm('Bạn có chắc muốn xóa không?')" class="btn btn-danger">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="../assets/foot.jsp" />
</body>
</html>