<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN.Master" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="ADMIN_E_Lab.Subject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript">
    $(document).ready(function () {
      $("#<%=Bgvdisplay.ClientID%>").DataTable();
    });
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-dark"></h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
         <center>
      <asp:DropDownList ID="Ddlstream" runat="server" OnSelectedIndexChanged="Ddlstream_SelectedIndexChanged" CssClass="form-control" style="margin-left:-40px;  margin-top:20px; height:40px; width:200px; color:black; font-weight:bold; border: 2px solid black;">
            </asp:DropDownList>
         <asp:Button ID="Btndisplay" runat="server" OnClick="Btndisplay_Click" CssClass="btn bg-gradient-info" Text="submit" style="margin-top:-50px; margin-left:350px;"/>
        </center>
      
      <div class="card-header py-3">
        <h5 class="m-0 font-weight-bold text-primary">Subjects</h5>
      </div>
      <div class="table-responsive">
           <asp:GridView ID="Bgvdisplay" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Height="291px" OnRowCancelingEdit="Bgvdisplay_RowCancelingEdit" OnRowEditing="Bgvdisplay_RowEditing" OnRowUpdating="Bgvdisplay_RowUpdating" Width="806px" DataKeyNames="sub_id" OnRowDataBound="Bgvdisplay_RowDataBound" OnRowDeleting="Bgvdisplay_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="sub_id" HeaderText="Subject ID" />
                    <asp:BoundField DataField="sub_name" HeaderText="Subject Name" />
                    <asp:TemplateField HeaderText="Class Name">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlclass" runat="server" >
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("class_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField HeaderText="Operation" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle ForeColor="#003399" HorizontalAlign="Left" BackColor="#99CCCC" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
               <EmptyDataTemplate>
                   <div align="center" style="color:black; font-size:30px;">No Data Found</div>
               </EmptyDataTemplate>
            </asp:GridView>
          </div>
        </div>
         </div>
</asp:Content>
