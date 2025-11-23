<%@ Page Title="" Language="C#" MasterPageFile="~/Master_page.Master" AutoEventWireup="true" CodeBehind="uploaded_assignments.aspx.cs" Inherits="Welcomepage.uploaded_assignments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link rel="icon" href="User_images/SRKI.png"/>
        <!-- slider stylesheet -->
  <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="Masterpage_user/style2.css" />
  

  <!-- fonts style -->
  <link href="Masterpage_user/style1.css" rel="stylesheet" />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="Masterpage_user/bootstrap.css" />

  <!-- Custom styles for this template -->
  <link href="Masterpage_user/style.css" rel="stylesheet" />

  <!-- responsive style -->
  <link href="Masterpage_user/responsive.css" rel="stylesheet" />
  <link href="Masterpage_user/style3.css" rel="stylesheet" />
  <link href="Masterpage_user/lab1.css" rel="stylesheet" />
    <br />
    <br />
    <center>
    <asp:GridView ID="GridView1" runat="server" Height="282px" Width="950px" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:BoundField DataField="stud_name" HeaderText="Student Name">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="subject_name" HeaderText="Subject Name">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Assignment_no" HeaderText="Assignment No.">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="assignment_date" HeaderText="Assignment Submittion Date">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
        <EmptyDataTemplate>
           <div algin="center" style="font-size:20px; text-align:center;">Data is not Found</div> 
        </EmptyDataTemplate>
        </asp:GridView>
        </center>
</asp:Content>
