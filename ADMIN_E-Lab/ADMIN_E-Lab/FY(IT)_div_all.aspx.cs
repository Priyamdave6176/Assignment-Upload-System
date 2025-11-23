using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Text;

namespace ADMIN_E_Lab
{
    public partial class FY_IT__div_all : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                Connection();
                con.Open();
                String class1 = "FY";
                //String sql = "select Class.class_name, division.div_name, semister.sem_num, subject.Sub_name, uploaded_assignment.assignment_no, uploaded_assignment.description, uploaded_assignment.file_path from uploaded_assignment Join Class on uploaded_assignment.class_id = Class.class_id join division on division.div_id uploaded_assignment.div_id Join semister on semister.sem_id = uploaded_assignment.sem_id Join subject on subject.sub_id = uploaded_assignment.sub_id";
                SqlCommand cmd = new SqlCommand("select * from student_assignment where class = '" + class1 + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dt = new DataSet();
                da.Fill(dt);
                FYdisplay.DataSource = dt;
                FYdisplay.DataBind();
                con.Close();

                FYdisplay.UseAccessibleHeader = true;
                FYdisplay.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        private void Connection()
        {
            string strcon = ConfigurationManager.ConnectionStrings["connectionlab"].ConnectionString;
            con = new SqlConnection(strcon);
        }
        protected void DownloadFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            if (File.Exists(filePath))
            {
                Response.ContentType = ContentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.WriteFile(filePath);
                Response.End();
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Error','File is Not Found','error')", true);
            }
        }
    }
}