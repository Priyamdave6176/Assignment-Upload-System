<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN.Master" AutoEventWireup="true" CodeBehind="Insert_student.aspx.cs" Inherits="ADMIN_E_Lab.Insert_student" %>
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

          <h3>Insert Student Data</h3>
          <div class="user-details row">
            <div class="input-box" style="margin-top: 20px">
              <span
                ><b
                  ><asp:Label
                    ID="Label1"
                    runat="server"
                    Text="Full Name of Student :"
                    CssClass="textdark"
                  ></asp:Label></b
              ></span>
                 <asp:TextBox
                    ID="Full_Name"
                    runat="server"
                    aria-label="Name"
                  ></asp:TextBox>
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator1"
                runat="server"
                ErrorMessage="Please enter a Full Name"
                ControlToValidate="Full_Name"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
            <div
              class="input-box"
              style="margin-left: 330px; margin-top: -112px"
            >
              <b>
                <asp:Label
                  ID="Label2"
                  runat="server"
                  Text="Enrollment number"
                  CssClass="textdark"
                ></asp:Label
              ></b>
                 <asp:TextBox
                    ID="Enroll"
                    class="form-control"
                    runat="server"
                    aria-label="Name"
                  ></asp:TextBox>
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator2"
                runat="server"
                ErrorMessage="Please enter the Enrollment number"
                ControlToValidate="Enroll"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
            <div class="input-box">
              <b
                ><asp:Label
                  ID="Label3"
                  runat="server"
                  Text="Mac Address (Warning) Make Sure you are inserting valid Mac-Address (Insert like : M80FG268VJ9)"
                  CssClass="textdark"
                ></asp:Label
              ></b>
                 <asp:TextBox
                    ID="Mac"
                    class="form-control"
                    runat="server"
                    aria-label="Name"
                  ></asp:TextBox>
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator3"
                runat="server"
                ErrorMessage="Please enter the Mac Address"
                ControlToValidate="Mac"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
            <div
              class="input-box"
              style="margin-left: 330px; margin-top: -138px"
            >
              <b>
                <asp:Label
                  ID="Label8"
                  runat="server"
                  Text="Class (enter like this : FY,SY,TY) Without anyspace"
                  CssClass="textdark"
                ></asp:Label
              ></b>
                <asp:TextBox
                    ID="Class"
                    class="form-control"
                    runat="server"
                    aria-label="Name"
                  ></asp:TextBox>
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator8"
                runat="server"
                ErrorMessage="Please enter the class"
                ControlToValidate="class"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
            <div class="input-box">
              <b>
                <asp:Label
                  ID="Label4"
                  runat="server"
                 Text="Division (Enter Without Anyspace)"
                  CssClass="textdark"
                ></asp:Label
              ></b>
                 <asp:TextBox
                    ID="Div"
                    class="form-control"
                    runat="server"
                    aria-label="Name"
                  ></asp:TextBox>
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator4"
                runat="server"
                ErrorMessage="Please enter the Division"
                ControlToValidate="Div"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
            <div
              class="input-box"
              style="margin-left: 330px; margin-top: -111px"
            >
              <b>
                <asp:Label
                  ID="Label5"
                  runat="server"
                   Text="PC No :"
                  CssClass="textdark"
                ></asp:Label
              ></b>
              <asp:TextBox
                ID="PC"
                runat="server"
              ></asp:TextBox>
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator5"
                runat="server"
                ErrorMessage="Please enter the PC NO"
                ControlToValidate="PC"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
   
          <asp:Button
            ID="Button1"
            runat="server"
            Text="Submit"
            class="btn btn-block btn-primary" OnClick="Button1_Click"
          />
         </div>
        </div>
      </div>
    </div>
  </center>
</asp:Content>
