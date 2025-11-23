<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN.Master" AutoEventWireup="true" CodeBehind="Assignment_table.aspx.cs" Inherits="ADMIN_E_Lab.Assignment_table" %>
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
              DataKeyNames="file_path"
              BorderColor="#3366CC"
              ShowHeaderWhenEmpty="True"
              BorderStyle="None"
              BorderWidth="1px"
              CellPadding="4"
              AutoGenerateColumns="False"
              CssClass="dt-responsive"
              Width="925px"
              EmptyDataText="No Data Found"
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
                  DataField="stream_name"
                  HeaderText="Stream name"
                />
                <asp:BoundField
                  DataField="class_name"
                  HeaderText="Class name"
                />
                <asp:BoundField DataField="div_name" HeaderText="Div name" />
                <asp:BoundField DataField="sem_name" HeaderText="Sem name" />
                <asp:BoundField DataField="sub_name" HeaderText="Subject name" />
                <asp:BoundField
                  DataField="assignment_no"
                  HeaderText="Assignment No"
                />
                <asp:BoundField
                  DataField="description"
                  HeaderText="Description"
                />
                <asp:BoundField DataField="date" HeaderText="Date" />
                <asp:BoundField
                  DataField="start_time"
                  HeaderText="Start time"
                />
                <asp:BoundField DataField="end_time" HeaderText="End time" />

                <asp:TemplateField HeaderText="Download">
                  <ItemTemplate>
                    <asp:LinkButton
                      ID="lnkDownload"
                      Text="Download"
                      CommandArgument='<%# Eval("file_path") %>'
                      runat="server"
                      OnClick="DownloadFile"
                    ></asp:LinkButton>
                  </ItemTemplate>
                </asp:TemplateField>
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
