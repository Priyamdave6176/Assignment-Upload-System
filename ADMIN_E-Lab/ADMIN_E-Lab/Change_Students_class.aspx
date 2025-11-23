<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN.Master" AutoEventWireup="true" CodeBehind="Change_Students_class.aspx.cs" Inherits="ADMIN_E_Lab.Change_Students_class" %>
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
        <h4 class="m-0 font-weight-bold text-primary">Delete All Assignments : FY , SY AND TY</h4></center>
      </div>
      <div class="card-body" style="color: black">
        <div class="table-responsive">
          <center>
              <h2>FY Students Class Change To SY</h2>
              <h3>
              <asp:Button ID="Button3" runat="server" Text="Class Convert A FY TO SY" class="btn btn-danger" OnClick="Button3_Click"/></h3>
              <br />
              <br />
              <h2>SY Students Class Change To TY</h2>
              <br />
              <h3>
              <asp:Button ID="Button1" runat="server" Text="Class Convert A SY TO TY" class="btn btn-danger" OnClick="Button1_Click"/></h3>
          </center>
        </div>
      </div>
    </div>
  </div>
  <!-- /.container-fluid -->
</asp:Content>
