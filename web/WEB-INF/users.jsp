<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!--Color Palette: https://colorhunt.co/palette/117601-->
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Users</title>
    <link 
      rel="stylesheet" 
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
      crossorigin="anonymous"
      />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
      crossorigin="anonymous"
      />
    <link href="/css/users.css" rel="stylesheet">
  </head>
  <body>
    <div class="page">
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="/">Inventory Management</a>

        <ul class="navbar-nav ml-auto">
          <a class="nav-link" href="/">Home</a>
        </ul>
      </nav>

      <div class="user-add-form">
        <h2 class="text-center">Add User</h2>
        <form action="users" method="post">
          <input 
            class="input-dark" 
            type="email" 
            name="email" 
            placeholder="Email"
            required
            />
          <input 
            class="input-dark"
            type="text" 
            name="fname" 
            placeholder="First Name"
            required
            />
          <input 
            class="input-dark"
            type="text" 
            name="lname" 
            placeholder="Last Name" 
            required
            />
          <input 
            class="input-dark"
            type="password" 
            name="password" 
            placeholder="Password"
            required
            />
          <select class="input-dark" name="urole">
             <c:forEach items="${roles}" var="role"> 
              <option value="${role.roleID}">${role.roleName}</option>
             </c:forEach> 
          </select>
          <input type="hidden" name="action" value="add" />
          <input class="input-primary" type="submit" value="Save"/>
        </form>
      </div>

      <div class="main">
        <h2 class="text-center">Manage Users</h2>
        <table class="table table-dark">
          <thead>
            <tr>
              <th>Email</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Role Name</th>
              <th class="text-center">Edit</th>
              <th class="text-center">Delete</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${users}" var="user">
              <tr>
                <td>${user.email}</td>
                <td>${user.fname}</td>
                <td>${user.lname}</td>
                <td>${user.role.roleName}</td>
                <td class="text-center">
                  <a href="/users?action=edit&email=${user.email}" 
                     class="row-btn">
                    <i class="text-secondary fas fa-pencil-alt"></i>
                  </a>
                </td>
                <td class="text-center">
                  <a href="/users?action=delete&email=${user.email}" 
                     <i class="text-danger fas fa-times" ></i>
                  </a>
                </td>
              </tr>
            </c:forEach>
            <tr>
              <c:if test="${empty users}">
                <td class="text-center" colspan="5">
                  <h5>No Users Found</h5>
                </td>
              </c:if>
            </tr>
          </tbody>
        </table>
      </div>

      <c:if test="${edit eq true}">
        <div class="user-edit-form">
          <h2 class="text-center">Edit User</h2>
          <form action="users" method="post">
            <input 
              class="input-dark" 
              type="email" 
              name="email" 
              value="${user.email}"
              placeholder="Email"
              readonly
              />
            <input 
              class="input-dark"
              type="text" 
              name="fname" 
              value="${user.fname}"
              placeholder="First Name"
              />
            <input 
              class="input-dark"
              type="text" 
              name="lname" 
              value="${user.lname}"
              placeholder="Last Name"
              />
          <input 
            class="input-dark"
            type="password" 
            name="password" 
            value="${user.password}"
            placeholder="Password"
            />
          <select class="input-dark" name="urole">
             <c:forEach items="${roles}" var="role"> 
                    <c:if test="${user.role.roleID == role.roleID}">
                        <option value="${role.roleID}">${role.roleName}</option>
                    </c:if>
             </c:forEach>            
          </select>
            <input type="hidden" name="action" value="edit" />
            <input class="mb-0 input-primary" type="submit" value="Save"/>
            <a href="/users?action=clearEdit">
              <input class="mb-0 input-secondary" type="button" value="Cancel" >
            </a>
          </form>
        </div>
      </c:if>
    </div>
    <c:if test="${error ne null}">
      <div class="error-message">
        <span>${error}</span>
      </div>
    </c:if>
  </body>
</html>
