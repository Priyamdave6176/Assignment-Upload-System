using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

namespace ADMIN_E_Lab
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        private void Connection()
        {
            string strcon = ConfigurationManager.ConnectionStrings["connectionlab"].ConnectionString;
            con = new SqlConnection(strcon);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                Display();
            }

        }
        public void Display()
        {
            Connection();
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from student_login", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dt = new DataSet();
            da.Fill(dt);
            Dgvdisplay_details.DataSource = dt;
            Dgvdisplay_details.DataBind();
            con.Close();

            Dgvdisplay_details.UseAccessibleHeader = false;
            Dgvdisplay_details.HeaderRow.TableSection = TableRowSection.TableHeader;

        }

        protected void Dgvdisplay_details_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Dgvdisplay_details.EditIndex = e.NewEditIndex;
            Display();
        }

        protected void Dgvdisplay_details_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = Dgvdisplay_details.Rows[e.RowIndex];
            int id =
            Convert.ToInt32(Dgvdisplay_details.DataKeys[e.RowIndex].Values[0]);

            string fullname = (row.Cells[1].Controls[0] as TextBox).Text;
            string enroll = (row.Cells[2].Controls[0] as TextBox).Text;
            string mac = (row.Cells[3].Controls[0] as TextBox).Text;
            string class1 = (row.Cells[4].Controls[0] as TextBox).Text;
            string div = (row.Cells[5].Controls[0] as TextBox).Text;
            string pcno = (row.Cells[6].Controls[0] as TextBox).Text;
            Connection();
            con.Open();
            SqlCommand cmd = new SqlCommand($"update student_login set Full_name = '{fullname}', Enrollment_No = '{enroll}', Mac_address = '{mac}', class = '{class1}', division = '{div}', pc_no='{pcno}' where stud_id = { id }", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Dgvdisplay_details.EditIndex = -1;
            Display();
        }

        protected void Dgvdisplay_details_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Connection();
            con.Open();
            int id =
            Convert.ToInt32(Dgvdisplay_details.DataKeys[e.RowIndex].Value);
            SqlCommand cmd = new SqlCommand($"delete from student_login where stud_id = { id }", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Display();
        }

        protected void Dgvdisplay_details_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Dgvdisplay_details.EditIndex = -1;
            Display();
        }
    }
}