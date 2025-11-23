<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN.Master" AutoEventWireup="true" CodeBehind="Upload_Assignment_form.aspx.cs" Inherits="ADMIN_E_Lab.Upload_Assignment_form" %>
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

          <h3>Upload Assignment</h3>
          <div class="user-details row">
            <div class="input-box" style="margin-top: 20px">
              <span
                ><b
                  ><asp:Label
                    ID="Label1"
                    runat="server"
                    Text="Stream :"
                    CssClass="textdark"
                  ></asp:Label></b
              ></span>
              <asp:DropDownList
                ID="Stream"
                runat="server"
                OnSelectedIndexChanged="Stream_SelectedIndexChanged"
                AutoPostBack="true"
                Height="40px"
                Width="100%"
              ></asp:DropDownList>
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator1"
                runat="server"
                ErrorMessage="Please select a Stream"
                ControlToValidate="stream"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
            <div
              class="input-box"
              style="margin-left: 330px; margin-top: -106px"
            >
              <b>
                <asp:Label
                  ID="Label2"
                  runat="server"
                  Text="Class :"
                  CssClass="textdark"
                ></asp:Label
              ></b>
              <asp:DropDownList
                ID="Class"
                runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged="Class_SelectedIndexChanged"
                Height="40px"
                Width="100%"
              ></asp:DropDownList>
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator2"
                runat="server"
                ErrorMessage="Please select a Class"
                ControlToValidate="Class"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
            <div class="input-box">
              <b
                ><asp:Label
                  ID="Label3"
                  runat="server"
                  Text="Division :"
                  CssClass="textdark"
                ></asp:Label
              ></b>
              <asp:DropDownList
                ID="division"
                runat="server"
                AutoPostBack="true"
                Height="40px"
                Width="100%"
              ></asp:DropDownList>
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator3"
                runat="server"
                ErrorMessage="Please select a division"
                ControlToValidate="division"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
            <div
              class="input-box"
              style="margin-left: 330px; margin-top: -106px"
            >
              <b>
                <asp:Label
                  ID="Label8"
                  runat="server"
                  Text="Semister :"
                  CssClass="textdark"
                ></asp:Label
              ></b>
              <asp:DropDownList
                ID="semester"
                runat="server"
                AutoPostBack="true"
                Height="40px"
                Width="100%"
              ></asp:DropDownList>
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator8"
                runat="server"
                ErrorMessage="Please select a division"
                ControlToValidate="division"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
            <div class="input-box">
              <b>
                <asp:Label
                  ID="Label4"
                  runat="server"
                  Text="Subject name :"
                  CssClass="textdark"
                ></asp:Label
              ></b>
              <asp:DropDownList
                ID="subject"
                runat="server"
                AutoPostBack="true"
                Height="40px"
                Width="100%"
              ></asp:DropDownList>
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator4"
                runat="server"
                ErrorMessage="Please select a subject"
                ControlToValidate="subject"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
            <div
              class="input-box"
              style="margin-left: 330px; margin-top: -105px"
            >
              <b>
                <asp:Label
                  ID="Label5"
                  runat="server"
                  Text="Assignment No :"
                  CssClass="textdark"
                ></asp:Label
              ></b>
              <asp:TextBox
                ID="assignment"
                runat="server"
                Height="40px"
              ></asp:TextBox>
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator5"
                runat="server"
                ErrorMessage="Please enter your Assignment number"
                ControlToValidate="assignment"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
            <div class="input-box" style="margin-top: -30px">
              <b
                ><asp:Label
                  ID="Label6"
                  runat="server"
                  Text="Description :"
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
                ErrorMessage="Please enter your Description"
                ControlToValidate="Textbox1"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>

            <div class="input-box">
              <asp:Label
                ID="Label10"
                runat="server"
                Text="Date :"
                CssClass="textdark"
              ></asp:Label>
              <asp:Label
                ID="DATE"
                runat="server"
                Text="Label"
                style="color: black"
              ></asp:Label>
            </div>
            <br />
            <div class="input-box">
              <asp:Label
                ID="Label11"
                runat="server"
                Text="Start-Time :"
                CssClass="textdark"
                for="year"
              ></asp:Label>
              <input
                type="time"
                name="time"
                id="T1"
                runat="server"
                style="height: 40px"
              />
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator9"
                runat="server"
                ErrorMessage="Please enter the Start-time"
                ControlToValidate="T1"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>
            <br />
            <div class="input-box" style="margin-left: 40px">
              <asp:Label
                ID="Label12"
                runat="server"
                Text="End-Time :"
                CssClass="textdark"
                for="year"
              ></asp:Label>
              <input
                type="time"
                name="time"
                id="Time1"
                runat="server"
                style="height: 40px"
              />
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator11"
                runat="server"
                ErrorMessage="Please enter the End-time"
                ControlToValidate="Time1"
                ForeColor="red"
              ></asp:RequiredFieldValidator>
            </div>

            <div class="input-box">
              <h4 class="lab">File Upload :</h4>
              <br />
              <asp:FileUpload
                ID="FileUpload1"
                runat="server"
                BorderColor="White"
                Font-Size="Large"
                Height="60px"
              />
              <asp:RequiredFieldValidator
                ID="RequiredFieldValidator12"
                runat="server"
                ErrorMessage="Please Upload Your File"
                ControlToValidate="FileUpload1"
                ForeColor="Red"
              ></asp:RequiredFieldValidator>
            </div>
          </div>
          <asp:Button
            ID="Button1"
            runat="server"
            Text="Submit"
            class="btn btn-block btn-primary"
            OnClick="Button1_Click"
          />
        </div>
      </div>
    </div>
  </center>
  <!--Uploading form End-->
  <br />
</asp:Content>
