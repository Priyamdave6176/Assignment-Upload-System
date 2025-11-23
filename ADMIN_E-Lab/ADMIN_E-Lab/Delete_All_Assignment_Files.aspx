<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN.Master" AutoEventWireup="true" CodeBehind="Delete_All_Assignment_Files.aspx.cs" Inherits="ADMIN_E_Lab.Delete_All_Assignment_Files" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-dark"></h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
          <center>
              <script type="text/javascript">
                  function confirm() {
                      swal({
                          title: "Are you sure you want to Change the Students Class then click on OK!",
                          text: "Don't want to Change then canceled it!",
                          icon: "warning",
                          buttons: true,
                          dangerMode: true
                      }).then(function (isConfirm) {
                          if (isConfirm) {
                              window.location.href = "Change_Students_class.aspx";

                          }
                      });
                      return false;
                  }
              </script>
                  
               <h5 style="color:red;"><asp:LinkButton ID="lnkdiscard" runat="server"  OnClientClick="return confirm()" CssClass="btn btn-warning text-dark">Click :- Change the Student Class</asp:LinkButton></h5>
              <br />
              <br />
              <br />
        <h4 class="m-0 font-weight-bold text-primary">Delete All Assignments : FY , SY AND TY</h4></center>
      </div>
      <div class="card-body" style="color: black">
        <div class="table-responsive">
          <center>
              <h2>FY Students Assignment Data</h2>
              <h3>
              <asp:Button ID="Button3" runat="server" Text="Delete All  FY Students Assignment Data" class="btn btn-danger" OnClick="Button3_Click"/></h3>
              <br />
              <hr />
              <br />
              <h2>SY Students Assignment Data</h2>
              <br />
              <h3>
              <asp:Button ID="Button4" runat="server" Text="Delete All SY Students Assignment Data" class="btn btn-danger" OnClick="Button4_Click"/></h3>
              <br />
              <hr />
              <br />
              <h2>TY Students Assignment Data</h2>
              <br />
              <h3>
              <asp:Button ID="Button5" runat="server" Text="Delete All TY Students Assignment Data" class="btn btn-danger" OnClick="Button5_Click"/></h3>  
              <br />
              <hr />
              <br />
              <h2>Uploaded Assignment Data Delete</h2>
              <br />
              <h3>
              <asp:Button ID="Button6" runat="server" Text="Delete Uploaded Assignment Data" class="btn btn-danger" OnClick="Button6_Click"/></h3>  
              <br />
              <hr />
              <br />
              <h2>Delete All Assignment Files</h2>
              <h3>
              <asp:Button ID="Button1" runat="server" Text="Delete All  With All Assignment Files" class="btn btn-danger" OnClick="Button1_Click"/></h3>
              <br />
              <hr />
              <br />
              <h2>Delete All Uploaded Assignment Files</h2>
              <h3>
              <asp:Button ID="Button2" runat="server" Text="Delete All  With All Assignment Files" class="btn btn-danger" OnClick="Button2_Click"/></h3>
          </center>
        </div>
      </div>
    </div>
  </div>
  <!-- /.container-fluid -->
</asp:Content>
