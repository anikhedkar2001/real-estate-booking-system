<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css" rel="stylesheet">
</head>
<body>
<form id="registerForm" action="LoginForm" method="post">
<section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Login</p>
                <% if (request.getParameter("error") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        Invalid email or password!
                    </div>
                <% } else if (request.getParameter("success") != null) { %>
                    <div class="alert alert-success" role="alert">
                        Login successful!
                    </div>
                <% } %>
                <div class="mx-1 mx-md-4">
                <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user-check fa-lg me-3 fa-fw"></i>
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="userType" id="adminRadio" value="admin" required>
                      <label class="form-check-label" for="adminRadio">Admin</label>
                    </div>
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="userType" id="userRadio" value="user" required checked>
                      <label class="form-check-label" for="userRadio">User</label>
                    </div>
                  </div>
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div data-mdb-input-init class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example1c" class="form-control" name="email2" required/>
                      <label class="form-label" for="form3Example1c">Email address</label>
                    </div>
                  </div>
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div data-mdb-input-init class="form-outline flex-fill mb-0">
                      <input type="password" id="form3Example4c" class="form-control" name="pass2" required/>
                      <label class="form-label" for="form3Example4c">Password</label>
                    </div>
                  </div>
                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button type="submit" value="login" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg">Login</button>
                  </div>
                </div>
              </div>
              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                  class="img-fluid" alt="Sample image">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</form>
<script>
window.onload = function() {
    document.getElementById("loginForm").reset();
};
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.js"></script>
</body>
</html>
