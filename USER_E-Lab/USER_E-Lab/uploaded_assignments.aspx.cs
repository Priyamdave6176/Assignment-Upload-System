using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Welcomepage
{
    public partial class uploaded_assignments : System.Web.UI.Page
    {
        SqlConnection con1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Full_name"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    grid();
                }
            }
        }
        private void conn()
        {
            string strcon = ConfigurationManager.ConnectionStrings["connectionlab"].ConnectionString;
            con1 = new SqlConnection(strcon);
        }
        private void grid()
        {
            conn();
            con1.Open();
            SqlCommand cmd = new SqlCommand("select stud_name,subject_name,Assignment_no,assignment_date from student_assignment where stud_Name='" + Session["Myname"] + "' and subject_name='"+ Session["subject"] + "'",con1);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
}