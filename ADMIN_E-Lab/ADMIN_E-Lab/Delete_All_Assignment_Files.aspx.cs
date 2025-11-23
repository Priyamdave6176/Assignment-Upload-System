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
    public partial class Delete_All_Assignment_Files : System.Web.UI.Page
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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            deletestudent_Assignment();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            uploaded_assignment_delete();
        }
        public void deletestudent_Assignment()
        {
            String path = @"D:\E-LAB_Project\Student_Assignments";
            DirectoryInfo directory = new DirectoryInfo(path);
            var allfiles = directory.EnumerateFiles();
            var dirs = directory.EnumerateDirectories();
            foreach(FileInfo file in allfiles)
            {
                file.Delete();
            }
            foreach(DirectoryInfo di in dirs)
            {
                di.Delete(true);
            }
            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','Students Assignment is Deleted Successfully','success')", true);
        }
        public void uploaded_assignment_delete()
        {
            String path1 = @"D:\E-LAB_Project\Uploaded_Assignments";
            DirectoryInfo directory = new DirectoryInfo(path1);
            var allfiles = directory.EnumerateFiles();
            var dirs = directory.EnumerateDirectories();
            foreach (FileInfo file in allfiles)
            {
                file.Delete();
            }
            foreach (DirectoryInfo di in dirs)
            {
                di.Delete(true);
            }
            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','Uploaded Assignment is Deleted Successfully','success')", true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string FY = "FY";
            Connection();
            con.Open();
            SqlCommand cmd = new SqlCommand($"delete from student_assignment where class =  '" + FY + "' ", con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','FY Students Assignment Data is Deleted Success','success')", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Error','Data is already Deleted','error')", true);
            }
            con.Close();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string SY = "SY";
            Connection();
            con.Open();
            SqlCommand cmd = new SqlCommand($"delete from student_assignment where class =  '" + SY + "' ", con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','FY Students Assignment Data is Deleted Success','success')", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Error','Data is already Deleted','error')", true);
            }
            con.Close();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string TY = "TY";
            Connection();
            con.Open();
            SqlCommand cmd = new SqlCommand($"delete from student_assignment where class =  '" + TY + "' ", con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','FY Students Assignment Data is Deleted Success','success')", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Error','Data is already Deleted','error')", true);
            }
            con.Close();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Connection();
            con.Open();
            SqlCommand cmd = new SqlCommand($"delete from uploaded_assignment", con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','Uploaded Assignment Data is Deleted Success','success')", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Error','Data is already Deleted','error')", true);
            }
            con.Close();
        }
    }
}