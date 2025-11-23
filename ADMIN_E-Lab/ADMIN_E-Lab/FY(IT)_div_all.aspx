<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN.Master" AutoEventWireup="true" CodeBehind="FY(IT)_div_all.aspx.cs" Inherits="ADMIN_E_Lab.FY_IT__div_all" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript">
    $(document).ready(function () {
      $("#<%=FYdisplay.ClientID%>").DataTable();
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
        <h6 class="m-0 font-weight-bold text-primary">FY(IT)Div-all</h6>
      </div>
      <div class="table-responsive">
        <center>
          <asp:GridView
            ID="FYdisplay"
            runat="server"
            BackColor="White"
            DataKeyNames="stud_assignment"
            BorderColor="#3366CC"
            ShowHeaderWhenEmpty="true"
            BorderStyle="None"
            BorderWidth="1px"
            CellPadding="4"
            AutoGenerateColumns="False"
            CssClass="dt-responsive"
            Width="1073px"
            EmptyDataText="No Data Found"
          >
            <Columns>
              <asp:BoundField DataField="stud_id" HeaderText="ID" />
              <asp:BoundField
                DataField="stud_name"
                HeaderText="Student Full Name"
              />
              <asp:BoundField
                DataField="Enrollment_No"
                HeaderText="Enrollment No"
              />
              <asp:BoundField DataField="stream" HeaderText="Stream" />
              <asp:BoundField DataField="class" HeaderText="Class" />
              <asp:BoundField DataField="division" HeaderText="Division" />
              <asp:BoundField
                DataField="subject_name"
                HeaderText="Subject Name"
              />
              <asp:BoundField
                DataField="assignment_date"
                HeaderText="Assignment Date"
              />

              <asp:TemplateField HeaderText="Download">
                <ItemTemplate>
                  <asp:LinkButton
                    ID="lnkDownload"
                    Text="Download"
                    CommandArgument='<%# Eval("stud_assignment") %>'
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
  <!-- /.container-fluid -->
</asp:Content>
