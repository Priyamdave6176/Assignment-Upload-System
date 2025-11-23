<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ADMIN_E_Lab.login" %>

<!DOCTYPE html>
<html lang="en" oncontextmenu="return false" oncopy="return false" onpaste="return false">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="Admin-image/logo.png" />
    <title>SRKI E-Lab-Admin</title>
    <!--     Fonts and icons     -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
      rel="stylesheet"
    />
    <!-- Nucleo Icons -->
    <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
    <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
     <link
      id="pagestyle"
      href="assets/css/soft-ui-dashboard.css?v=1.0.3"
      rel="stylesheet"
    />
    <!-- Font Awesome Icons -->
    <script
      src="https://kit.fontawesome.com/42d5adcbca.js"
      crossorigin="anonymous"
    ></script>
    <!-- CSS Files -->
    <script src="Admin-JS/s2.js"></script>
    <style>
      body {
        background-image: url("Admin-image/Srki Background.jpg");
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
      }
    </style>
    <link rel="stylesheet" href="Admin-css1/Sweetalert.css" />
    <script>
      function validateform() {
        var name = document.getElementById("TextBox1").value;
        var password = document.getElementById("TextBox2").value;
        if (name == null || name == "") {
          swal("", "Please enter the Username", "error");
          return false;
        }
        if ((password = null || password == "")) {
          swal("", "Please enter the password", "error");
          return false;
        }
      }
    </script>
     <script>
         let alert = false;
         const interval = setInterval(() => {
             document.title = alert
                 ? 'SRKI E-Lab-Admin' : 'Welcome, Admin';
             alert = !alert;
         }, 2000);
     </script>
      <script>
          var typed = new Typed('.element', {
              strings: ["First sentence.", "Second sentence."],
              typeSpeed: 30
          });
      </script>
      <script type="text/javascript">
          function preventBack() { window.history.forward(); }
          setTimeout("preventBack()", 0);
          window.onunload = function () { null };
      </script>
  </head>
  <body class="g-sidenav-show bg-gray-100">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-5 text-center mx-auto">
          <h1 class="text-dark mb-3 mt-5" style="color: black"></h1>
          <p class="text-lead text-white"></p>
        </div>
      </div>
    </div>
    <div class="container" style="margin-top: 210px">
      <div class="row mt-lg-n10 mt-md-n11 mt-n10">
        <div class="col-xl-4 col-lg-5 col-md-7 mx-auto">
          <div class="card z-index-0">
            <div class="card-header text-center pt-4">
              <img src="Admin-image/logo.png" width="150" height="150" />
              <h4><b>E-Lab Admin</b></h4>
              <asp:Label
                ID="Label4"
                runat="server"
                style="font-size: 15px; text-align: center"
              ></asp:Label>
            </div>
            <form
              role="form"
              runat="server"
              name="myform"
              onsubmit="return validateform()"
            >
              <div class="card-body" style="margin-top: -40px">
                <div class="mb-3">
                  <b style="color: black"
                    ><asp:Label
                      ID="Label1"
                      name="username"
                      runat="server"
                      Text="Username"
                      style="font-size: 15px"
                    ></asp:Label
                  ></b>
                      <span id="element"></span>
                  <asp:TextBox
                    ID="TextBox1"
                    class="form-control"
                    runat="server"
                    placeholder="Please enter the Username"
                    aria-label="Name"
                    autocomplete="off"
                  ></asp:TextBox>
                </div>
                <div class="mb-3">
                  <b style="color: black"
                    ><asp:Label
                      ID="Label2"
                      name="password"
                      runat="server"
                      Text="Password"
                      style="font-size: 15px"
                    ></asp:Label
                  ></b>
                  <asp:TextBox
                    ID="TextBox2"
                    class="form-control"
                    runat="server"
                    placeholder="Please enter the Password"
                    aria-label="Name"
                    autocomplete="off"
                    TextMode="Password"></asp:TextBox>
                </div>
                <div class="text-center">
                  <asp:Button
                    ID="Btnlogin"
                    class="btn bg-gradient-primary w-100 my-4 mb-2"
                    runat="server"
                    Text="Login"
                    OnClick="Btnlogin_Click"
                  />
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- -------- START FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
    <footer class="footer-fixed py-5">
      <div class="container">
        <div class="row">
          <div
            class="col-10 mx-auto text-center mt-1"
            style="margin-top: -150px"
          >
            <p class="mb-0 text-secondary text-white">
              <b style="font-size: 20px">
                ©
                <script>
                  document.write(new Date().getFullYear());
                </script>
                Develop by Priyam Dave
              </b>
            </p>
          </div>
        </div>
      </div>
    </footer>
    <!-- -------- END FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
    <!--   Core JS Files   -->
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>
    <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script>
      var win = navigator.platform.indexOf("Win") > -1;
      if (win && document.querySelector("#sidenav-scrollbar")) {
        var options = {
          damping: "0.5",
        };
        Scrollbar.init(document.querySelector("#sidenav-scrollbar"), options);
      }
    </script>
    <!-- Github buttons -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="assets/js/soft-ui-dashboard.min.js?v=1.0.3"></script>
  </body>
</html>

