<%--
  Created by IntelliJ IDEA.
  User: AD
  Date: 11/17/2023
  Time: 4:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../assets/head.jsp"></jsp:include>
</head>
<body>

<h1>Thêm mới khách hàng</h1>

<form action="<%=request.getContextPath()%>/CustomerController" method="post">
    <div class="mb-3">
        <label for="id" class="form-label">ID</label>
        <input type="number" min="1" class="form-control" id="id" name="id">
    </div>
    <div class="mb-3">
        <label for="name" class="form-label">Name</label>
        <input type="text" class="form-control" id="name" name="name">
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">Email address</label>
        <input type="email" class="form-control" id="email" placeholder="name@example.com" name="email">
    </div>
    <div class="mb-3">
        <label for="phone" class="form-label">Phone Number</label>
        <input type="text" class="form-control" id="phone" placeholder="0987654321" name="phone">
    </div>
    <div class="mb-3">
        <label for="gen" class="form-label">Gender</label>
        <select class="form-select" id="gen" name="gen">
            <option value="true">Nam</option>
            <option value="false">Nữ</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="birth" class="form-label">Birthday</label>
        <input type="date" name="birthday" id="birth">
    </div>
    <div class="mb-3">
        <label for="bios" class="form-label">Bios</label>
        <textarea class="form-control" id="bios" rows="3" name="bios"></textarea>
    </div>
    <div class="mb-3">
        <label for="avatar" class="form-label">Avatar</label>
        <textarea class="form-control" id="avatar" rows="3" name="avatar"></textarea>
    </div>

    <input class="btn btn-success"  type="submit" value="ADD" name="action">
</form>
<jsp:include page="../assets/foot.jsp"></jsp:include>
</body>
</html>