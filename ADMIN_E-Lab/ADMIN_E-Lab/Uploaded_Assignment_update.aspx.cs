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
    public partial class Uploaded_Assignment_update : System.Web.UI.Page
    {
        SqlConnection con;
        private void Connection()
        {
            string strcon = ConfigurationManager.ConnectionStrings["connectionlab"].ConnectionString;
            con = new SqlConnection(strcon);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Display();
            }
        }
        public void Display()
        {
            Connection();
            con.Open();
            string sql = "select * from uploaded_assignment";
            //String sql = "select Class.class_name, division.div_name, semister.sem_num, subject.Sub_name, uploaded_assignment.assignment_no, uploaded_assignment.description, uploaded_assignment.file_path from uploaded_assignment Join Class on uploaded_assignment.class_id = Class.class_id join division on division.div_id uploaded_assignment.div_id Join semister on semister.sem_id = uploaded_assignment.sem_id Join subject on subject.sub_id = uploaded_assignment.sub_id";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dt = new DataSet();
            da.Fill(dt);
            dgvassignment.DataSource = dt;
            dgvassignment.DataBind();
            con.Close();

            dgvassignment.UseAccessibleHeader = true;
            dgvassignment.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
       
        protected void dgvassignment_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            dgvassignment.EditIndex = -1;
            Display();
        }

        protected void dgvassignment_RowEditing(object sender, GridViewEditEventArgs e)
        {
            dgvassignment.EditIndex = e.NewEditIndex;
            Display();
        }
    }
}