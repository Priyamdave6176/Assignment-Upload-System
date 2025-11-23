<%@ Page Title="" Language="C#" MasterPageFile="~/Master_page.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="Welcomepage.Welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Uploading form Start--> 
    <br />
   <%--<link href="Masterpage_user/lab1.css" rel="stylesheet"/>--%>
    <link href="Masterpage_user/style3.css" rel="stylesheet" />
    <link href="Masterpage_user/lab1.css" rel="stylesheet" />
    <script type="text/javascript">  
        function checksize(source, arguments) {
            arguments.IsValid = false;
            var size = document.getElementById("<%=fileupload.ClientID%>").files[0].size;
            if (size > 502400) {
                arguments.IsValid = false;
                return false;
            }
            else {
                arguments.IsValid = true;
                return true;
            }
        }
    </script>  
    <div class="container12" style="margin-top:20px;">
    
    <div class="content">
        <div class="container-fluid form-row">
         <asp:Label ID="Label6" runat="server" Text="" Font-Size="X-Large" style="margin-left:150px;"></asp:Label>
            <asp:Label ID="Enrollment" runat="server" Style="display:none"></asp:Label>
            <asp:Label ID="Label9" runat="server" Style="display:none;"></asp:Label>
            <asp:Label ID="Name" runat="server" Style="display:none"></asp:Label>
        <div class="user-details row">
          <div class="input-box" style="margin-top:30px;">
              <span ><b><asp:Label ID="Label1" runat="server" Text="Stream :" class="details"></asp:Label></b></span>
                <asp:TextBox ID="Stream" runat="server" Class="input" Enabled="False"></asp:TextBox>
          </div>
          <div class="input-box" style="margin-left:330px; margin-top:-90px;">
              <b><asp:Label ID="Label2" runat="server" Text="Class :" CssClass="details"></asp:Label></b>
                <asp:TextBox ID="Class" runat="server" Enabled="False"></asp:TextBox>
          </div>
          <div class="input-box">
            <b><asp:Label ID="Label3" runat="server" Text="Division :" CssClass="details"></asp:Label></b>
                <asp:TextBox ID="Division" runat="server" Enabled="False"></asp:TextBox>
          </div>
          <div class="input-box"  style="margin-left:330px; margin-top:-90px;">
            <b><asp:Label ID="Label4" runat="server" Text="Semester :" CssClass="details"></asp:Label></b>
                <asp:TextBox ID="Semester" runat="server" Enabled="False"></asp:TextBox>
          </div>
          <div class="input-box">
            <b><asp:Label ID="Label5" runat="server" Text="Subject name :" CssClass="details"></asp:Label></b>
                <asp:TextBox ID="Subject" runat="server" Enabled="False"></asp:TextBox>
          </div>
           <div class="input-box"  style="margin-left:330px; margin-top:-90px;">
            <b><asp:Label ID="Label7" runat="server" Text="Assignment No :" CssClass="details"></asp:Label></b>
                <asp:TextBox ID="Assignment_No" runat="server" Enabled="False"></asp:TextBox>
          </div>
          <div class="input-box">
            <b><asp:Label ID="Label8" runat="server" Text="Assignment Date :" CssClass="details"></asp:Label></b>
                <asp:TextBox ID="Assignment_date" runat="server" Enabled="False"></asp:TextBox>
          </div>
          <div class="input-box"  style="margin-left:350px; margin-top:-80px;">
            <h4 class="lab">File Upload :</h4>
                            <br />
                <asp:FileUpload ID="fileupload" runat="server" BorderColor="White" Font-Size="Large" Height="60px"/>
              <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Upload Your File" ControlToValidate="fileupload" ForeColor="Red" ></asp:RequiredFieldValidator>--%>
          <asp:CustomValidator ID="cvvalidate" runat="server"  
           ToolTip="FileSize should not exceed 1MB" Style="color: #FF0000; display: inline; float: left; font-family: arial; font-size: 20px; margin-left: 20px; margin-top: 10px;"            
           ErrorMessage="File Size To Large..."  
           ControlToValidate="fileupload"  
           ClientValidationFunction="checksize"></asp:CustomValidator>  
          </div>
            </div>
        </div>
       <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="btn-189" Font-Size="Large" OnClick="Submit_Click" />
    </div>
  </div>
<!--Uploading form End-->
    <br />
</asp:Content>
