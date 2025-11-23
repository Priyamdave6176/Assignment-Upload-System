<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN.Master" AutoEventWireup="true" CodeBehind="Uploaded_Assignment_update.aspx.cs" Inherits="ADMIN_E_Lab.Uploaded_Assignment_update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script src="Admin-JS/Jquery.js"></script>
  <script src="Admin-JS/Jquery_Datatable.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      $("#<%=dgvassignment.ClientID%>").DataTable();
    });
  </script>
    <link rel="stylesheet" href="Admin-css1/Sweetalert.css" />
    <script src="Admin-JS/s2.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-dark" style="font-size: 40px;"></h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
          <asp:Label
            ID="Label9"
            runat="server"
            style="font-size: 20px"
          ></asp:Label>
        <h6 class="m-0 font-weight-bold text-primary">Uploaded Assignment</h6>
      </div>
      <div class="card-body" style="color: black">
        <div class="table-responsive">
          <center>
            <asp:GridView
              ID="dgvassignment"
              runat="server"
              BackColor="White"
              DataKeyNames="upload_id"
              BorderColor="#3366CC"
              ShowHeaderWhenEmpty="True"
              BorderStyle="None"
              BorderWidth="1px"
              CellPadding="4"
              AutoGenerateColumns="False"
              CssClass="dt-responsive"
              Width="925px"
              EmptyDataText="No Data Found" OnRowCancelingEdit="dgvassignment_RowCancelingEdit" OnRowEditing="dgvassignment_RowEditing"
            >
              <Columns>
                  <%--<asp:TemplateField>
                      <HeaderTemplate>
                          <asp:CheckBox ID="Chkheader" runat="server" AutoPostBack="true" Text="Select All" OnCheckedChanged="Chkheader_CheckedChanged"/>
                      </HeaderTemplate>
                      <ItemTemplate>
                          <asp:CheckBox ID="Chkempty" runat="server" OnCheckedChanged="Chkempty_CheckedChanged"/>
                      </ItemTemplate>
                  </asp:TemplateField>--%>
                <asp:BoundField
                  DataField="stream_id"
                  HeaderText="Stream name"
                />
                <asp:BoundField
                  DataField="class_id"
                  HeaderText="Class name"
                />
                <asp:BoundField DataField="div_id" HeaderText="Div name" />
                <asp:BoundField DataField="sem_id" HeaderText="Sem name" />
                <asp:BoundField DataField="sub_id" HeaderText="Sub name" />
                <asp:BoundField
                  DataField="assignment_no"
                  HeaderText="assignment_no"
                />
                <asp:BoundField
                  DataField="description"
                  HeaderText="description"
                />
                <asp:BoundField DataField="date" HeaderText="date" />
                <asp:BoundField
                  DataField="start_time"
                  HeaderText="start_time"
                />
                <asp:BoundField DataField="end_time" HeaderText="end_time" />

                  <asp:CommandField HeaderText="Operations" ShowEditButton="True" />

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
