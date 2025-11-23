<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN.Master" AutoEventWireup="true" CodeBehind="Student_data_upload.aspx.cs" Inherits="ADMIN_E_Lab.Student_data_upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link rel="stylesheet" href="Admin-css1/label-college1.css" />
  <link rel="stylesheet" href="Admin-css1/style3.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <center>
      <div class="container12" style="margin-top:20px;">
      <div class="content">
        <div class="container-fluid form-row">
          <asp:Label
            ID="Label9"
            runat="server"
            style="font-size: 20px"
          ></asp:Label>
          <h3>Upload Student Data :</h3>
          <div class="user-details row">
            <div class="input-box" style="margin-left:170px; margin-top:40px;">
              <h4 class="lab">File Upload :</h4>
              <br />
              <asp:FileUpload
                ID="FileUpload1"
                runat="server"
                BorderColor="White"
                Font-Size="Large"
                Height="60px"
              />
            </div>
          </div>
          <asp:Button
            ID="Btnupload"
            runat="server"
            Text="Submit"
            class="btn btn-block btn-primary" OnClick="Btnupload_Click"
          />
        </div>
      </div>
    </div>
  </center>
</asp:Content>
