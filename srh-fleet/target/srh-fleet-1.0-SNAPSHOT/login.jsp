<html>
  <head>
    <title>Login</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/static/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
  </head>

  <body class="login-page">
    <div class="login-box">
      <div class="login-logo">
        <b>SRH Fleet</b>
      </div>
      <div class="login-box-body">
        <p class="login-box-msg">Sign in</p>
        <form action="/login" method="post">
          <div class="form-group has-feedback">
            <input name="employeeId" class="form-control" placeholder="Employee Id" />
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input name="password" class="form-control" placeholder="Password" />
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-4">
              <button align="center" type="submit" class="btn btn-primary btn-block btn-flat">Sign in</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>