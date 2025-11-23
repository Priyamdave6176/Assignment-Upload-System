<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN.Master" AutoEventWireup="true" CodeBehind="Admin_students_detail.aspx.cs" Inherits="ADMIN_E_Lab.Admin_students_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script src="Admin-JS1/datatable-css.js"></script>
  <script src="Admin-JS/Jquery_Datatable.js"></script>
  <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"
  ></script>
  <script type="text/javascript">
    $(document).ready(function () {
      $("#<%=Dgvdisplay_details.ClientID%>").DataTable();
    });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- Begin Page Content -->
  <div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-dark" style="font-size: 25px">Data Tables</h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Students Details</h6>
      </div>
      <div class="card-body" style="color: black">
        <div class="table-responsive">
          <center>
            <asp:GridView
              ID="Dgvdisplay_details"
              runat="server"
              BackColor="White"
              BorderColor="#3366CC"
              ShowHeaderWhenEmpty="true"
              BorderStyle="None"
              BorderWidth="1px"
              CellPadding="4"
              AutoGenerateColumns="False"
              DataKeyNames="stud_d"
              OnRowCancelingEdit="dgvdisplay_details_RowCancelingEdit"
              OnRowDeleting="dgvdisplay_details_RowDeleting"
              OnRowEditing="dgvdisplay_details_RowEditing"
              OnRowUpdating="dgvdisplay_details_RowUpdating"
              Width="1089px"
              EmptyDataText="No data found"
            >
              <Columns>
                <asp:BoundField DataField="stud_d" HeaderText="ID" />
                <asp:BoundField DataField="Full_name" HeaderText="Full Name" />
                <asp:BoundField
                  DataField="Enrollment_No"
                  HeaderText="Enrollment No"
                />
                <asp:BoundField
                  DataField="Mac_address"
                  HeaderText="Mac Address"
                />
                <asp:BoundField DataField="class" HeaderText="Class" />
                <asp:BoundField DataField="division" HeaderText="Division" />
                <asp:CommandField
                  HeaderText="Operation"
                  ShowDeleteButton="True"
                  ShowEditButton="True"
                />
              </Columns>
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
              <EmptyDataRowStyle HorizontalAlign="Center" />
            </asp:GridView>
          </center>
        </div>
      </div>
    </div>
  </div>
  <!-- /.container-fluid -->
</asp:Content>
