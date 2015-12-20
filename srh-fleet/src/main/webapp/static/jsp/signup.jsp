<html>
  <head>
    <title>Sign Up</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/static/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
  </head>

  <body class="login-page">
    <div class="login-box">
      <div class="login-logo">
        <b>SRH Fleet</b>
      </div>
      <div class="login-box-body">
        <p class="login-box-msg">Sign Up</p>
        <form action="/signup" method="post">
          <div class="form-group has-feedback">
            <input name="firstName" class="form-control" placeholder="Firstname" />
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input name="lastName" class="form-control" placeholder="Lastname" />
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>

          <div class="form-group has-feedback">
            <input name="employeeId" class="form-control" placeholder="Employee Id" />
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>

          <div class="form-group has-feedback">
            <input name="password" class="form-control" placeholder="Password" />
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>

          <div class="form-group has-feedback">
            <input name="phoneNumber" class="form-control" placeholder="Phone Number" />
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>

          <div class="form-group has-feedback">
            <input name="loginTime" class="form-control" placeholder="Login time (hh/mm)" />
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>

          <div class="form-group has-feedback">
            <input name="logoutTime" class="form-control" placeholder="Logout Time" />
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>

          <div class="form-group has-feedback">
            <input name="employeeClass" class="form-control" placeholder="Employee class" />
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
            
          <div class="row">
            <div class="col-xs-4">
              <button align="center" type="submit" class="btn btn-primary btn-block btn-flat">Sign Up</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>