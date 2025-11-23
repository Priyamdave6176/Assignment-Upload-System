<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN.Master" AutoEventWireup="true" CodeBehind="Insert_subject.aspx.cs" Inherits="ADMIN_E_Lab.Insert_subject" %>
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
          <h3>Insert Subject</h3>
          <div class="user-details row">
            <div class="input-box" style="margin-left:160px; margin-top:20px;">
              <b
                ><asp:Label
                  ID="Label6"
                  runat="server"
                  Text="Subject Name :"
                  CssClass="textdark"
                ></asp:Label
              ></b>
              <asp:TextBox
                ID="TextBox1"
                runat="server"
                Height="40px"
              ></asp:TextBox>
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator6"
                runat="server"
                ErrorMessage="Please enter your Subject Name"
                ControlToValidate="Textbox1"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
            <br />
          </div>
          <asp:Button
            ID="Btninsertstud"
            runat="server"
            Text="Submit"
            class="btn btn-block btn-primary"
          />
        </div>
      </div>
    </div>
  </center>
  <!--Uploading form End-->
  <br />
</asp:Content>
