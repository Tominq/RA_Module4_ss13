<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: AD
  Date: 11/17/2023
  Time: 4:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../assets/head.jsp" />
</head>
<body>
<%!
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
%>
<c:set var="f" value='<%= new SimpleDateFormat("yyyy-MM-dd") %>' scope="page"></c:set>
<h1>Thêm mới khách hàng</h1>

<form action="<%= request.getContextPath() %>/CustomerController" method="post">
    <div class="mb-3">
        <label for="id" class="form-label">ID</label>
        <input type="number" min="1" readonly class="form-control" id="id" name="id" value="${customer.id}" />
    </div>
    <div class="mb-3">
        <label for="name" class="form-label">Name</label>
        <input type="text" value="${customer.name}" class="form-control" id="name" name="name" />
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">Email address</label>
        <input type="email" class="form-control" value="${customer.email}" id="email" placeholder="name@example.com"
               name="email" />
    </div>
    <div class="mb-3">
        <label for="phone" class="form-label">Phone Number</label>
        <input type="text" class="form-control" value="${customer.phone}" id="phone" placeholder="0987654321"
               name="phone" />
    </div>
    <div class="mb-3">
        <label for="gender" class="form-label">Gender</label>
        <select class="form-select" id="gender" name="gender">
            <option value="true" ${customer.gender ? "selected" : ""}>Nam</option>
            <option value="false" ${!customer.gender ? "selected" : ""}>Nữ</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="dob" class="form-label">Birthday</label>
        <input type="date" name="dob" value="${f.format(customer.dob)}" id="dob" />
    </div>
    <div class="mb-3">
        <label for="bio" class="form-label">Bio</label>
        <textarea class="form-control" id="bio" rows="3" name="bio">${customer.bio}</textarea>
    </div>
    <div class="mb-3">
        <label for="avt" class="form-label">Avatar</label>
        <div>
            <img width="200" height="200" style="object-fit: cover" src="${customer.avt}" alt="#" />
        </div>
        <textarea class="form-control" id="avt" rows="3" name="avt">${customer.avt}</textarea>
    </div>

    <input class="btn btn-success" type="submit" value="UPDATE" name="action" />
</form>
<jsp:include page="../assets/foot.jsp" />
</body>
</html>