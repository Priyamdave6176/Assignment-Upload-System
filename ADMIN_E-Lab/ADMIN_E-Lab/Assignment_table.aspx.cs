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
    public partial class Assignment_table : System.Web.UI.Page
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
                Grid();
            }
        }


        private void Connection()
        {
            string strcon = ConfigurationManager.ConnectionStrings["connectionlab"].ConnectionString;
            con = new SqlConnection(strcon);
        }
        private void Grid()
        {
            Connection();
            con.Open();
            string sql = "select stream.stream_name, class.class_name, division.div_name, semester.sem_name, subject.sub_name, uploaded_assignment.assignment_no, uploaded_assignment.description, uploaded_assignment.date, uploaded_assignment.start_time, uploaded_assignment.end_time, uploaded_assignment.file_path from uploaded_assignment Join class On class.class_id = uploaded_assignment.class_id join division on division.div_id = uploaded_assignment.div_id join semester on semester.sem_id=uploaded_assignment.sem_id join subject on subject.sub_id = uploaded_assignment.sub_id join stream on stream.stream_id = uploaded_assignment.stream_id";
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
        protected void DownloadFile(object sender, EventArgs e)
        {
            
                string filePath = (sender as LinkButton).CommandArgument;
            // check the file is exist in folder or not
            if (File.Exists(filePath))
            {
                Response.ContentType = ContentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.WriteFile(filePath);
                Response.End();
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k","swal('Error','File is Not Found','error')",true);
                //Label1.Text = "File is not found";
                //Label1.ForeColor = System.Drawing.Color.Red;
            }

        }
       

        //protected void Chkempty_CheckedChanged(object sender, EventArgs e)
        //{
        //    CheckBox chkstatus = (CheckBox)sender;
        //    GridViewRow row = (GridViewRow)chkstatus.NamingContainer;
        //}

        //protected void Chkheader_CheckedChanged(object sender, EventArgs e)
        //{
        //    CheckBox chkheader = (CheckBox)dgvassignment.HeaderRow.FindControl("Chkheader");
        //    foreach (GridViewRow row in dgvassignment.Rows)
        //    {
        //        CheckBox chkrow = (CheckBox)row.FindControl("Chkempty");
        //        if (chkheader.Checked == true)
        //        {
        //            chkrow.Checked = true;
        //        }
        //        else
        //        {
        //            chkrow.Checked = false;
        //        }
        //    }
        //}
    }
}