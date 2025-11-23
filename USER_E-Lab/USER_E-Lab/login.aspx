<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="E_Lab.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" oncontextmenu="return false" oncopy="return false" onpaste="return false" onselect="return false">
<head runat="server">
    <title>SRKI E-Lab</title>
    <link rel="icon" href="User_login_css/SRKI.png" />
    <link rel="stylesheet" href="User_login_css/login.css" />
    <link rel="stylesheet" href="User_login_css/Label_SRKI.css" />
    <link rel="stylesheet" href="User_login_css/Sweetalert.css" />
    <script src="Master_JS/s2.js"></script>
     <script>
      function validateform() {
        var name = document.getElementById("TextBox1").value;
        if (name == null || name == "") {
            swal("", "Please enter your Enrollment number", "error");
          return false;
        }
      }
     </script>
    <script>
        let alert = false;
        const interval = setInterval(() => {
            document.title = alert
                ? 'SRKI E-Lab' : 'Welcome, Students';
            alert = !alert;
        }, 2000);
    </script>
      <script type="text/javascript">
          function preventBack() { window.history.forward(); }
          setTimeout("preventBack()", 0);
          window.onunload = function () { null };
      </script>
    </head>
<body>
    <asp:Label ID="starttime" runat="server" Style="Display: none;"></asp:Label>
    <asp:Label ID="endtime" runat="server" Style="Display: none;"></asp:Label>
    <asp:Label ID="class1" runat="server" Style="Display: none;" ></asp:Label>
    <asp:Label ID="div1" runat="server" Style="Display: none;" ></asp:Label>
    <div>
<!--Navbar Start-->
      <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/User_login_css/SRKI.png" ImageAlign="Left"  Height="150px"/>
            <asp:Label ID="Label3" runat="server" Font-Size="XX-Large" Text="Shree Ramkrishna Institute of Computer Education and Applied Sciences" CssClass="lab" Font-Bold="True" style="margin-left:-70px;"></asp:Label>
            <br />
            <div class="animate-charcter">
                <asp:Label ID="Label6" runat="server" Font-Size="XX-Large" Text="E-Lab System"  Font-Bold="True"></asp:Label>
            </div>
            <br />
            <br />
            <br />
            <br />
        </nav>
      </div>
<!--Navbar End-->
 

              
                       



         <!--Enrollment form Start-->
<center>
    <asp:Label ID="Label4" runat="server" Text="Label" style="display: none;"></asp:Label>
    <asp:Image ID="Image2" runat="server" CssClass="centerimg" ImageUrl="~/user_login_css/desktop.png" Width="190px" Height="200px" />
    <div class="wrapper">
      <div class="title title1">.</div>
      <form id="form1" runat="server" name="myform"  onsubmit="return validateform()">
        <div class="field">
            <asp:Label ID="time" runat="server" Style="Display: none;" ></asp:Label>
            <asp:Label ID="nolab" runat="server" Font-Size="X-Large" Style="text-align:center; font-weight:bold;"></asp:Label>
            <br />
            <asp:Label ID="enrollment" runat="server" Text=": Enrollment number :" Font-Size="X-Large" Class="field16"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="TextBox1" CssClass="TextBox" name="num" runat="server" Height="30px" Width="300px" BackColor="White" Font-Bold="True" Font-Size="Medium"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Size="Large" style="font-weight:bold;"></asp:Label>
            <br />
            </div>
            <br />
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Label" style="display: none;"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Login" type="submit" OnClick="Button1_Click"/>
          <asp:Label ID="Timer" runat="server" style="display: none;"></asp:Label>
        </form>
    </div>
</center>
<!--Enrollment form end-->


        
<!--Footer Start-->
            <div class="footer">
                <asp:Label ID="Label2" runat="server" Text=" ©  2023 Develop By : Priyam  Dave" Font-Bold="True" Font-Size="X-Large" style="margin-top: 20px;"></asp:Label>  &nbsp;
            </div>
<!--Footer End-->
</div>
</body>
</html>

