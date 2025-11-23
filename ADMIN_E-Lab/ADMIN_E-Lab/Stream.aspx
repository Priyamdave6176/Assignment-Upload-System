<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN.Master" AutoEventWireup="true" CodeBehind="Stream.aspx.cs" Inherits="ADMIN_E_Lab.Stream" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
      $("#<%=GridView1.ClientID%>").DataTable();
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-dark" style="font-size: 25px">Data Tables</h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Stream</h6>
      </div>
      <div class="table-responsive">
        <asp:GridView
          ID="GridView1"
          runat="server"
          BackColor="White"
          BorderColor="#3366CC"
          BorderStyle="None"
          BorderWidth="1px"
          CellPadding="4"
        >
          <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
          <HeaderStyle
            BackColor="#003399"
            Font-Bold="True"
            ForeColor="#CCCCFF"
          />
          <PagerStyle
            BackColor="#99CCCC"
            ForeColor="#003399"
            HorizontalAlign="Left"
          />
          <RowStyle BackColor="White" ForeColor="#003399" />
          <SelectedRowStyle
            BackColor="#009999"
            Font-Bold="True"
            ForeColor="#CCFF99"
          />
          <SortedAscendingCellStyle BackColor="#EDF6F6" />
          <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
          <SortedDescendingCellStyle BackColor="#D6DFDF" />
          <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
      </div>
    </div>
  </div>
  <!-- /.container-fluid -->
</asp:Content>
