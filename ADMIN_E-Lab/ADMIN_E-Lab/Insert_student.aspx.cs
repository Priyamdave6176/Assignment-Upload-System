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
    public partial class Insert_student : System.Web.UI.Page
    {
        SqlConnection Con1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login.apsx");
            }

        }
        private void Connection()
        {
            string strcon = ConfigurationManager.ConnectionStrings["connectionlab"].ConnectionString;
            Con1 = new SqlConnection(strcon);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Connection();
            Con1.Open();
            SqlCommand cmd1 = new SqlCommand("Insert into student_login values('" + Full_Name.Text + "','" + Enroll.Text + "','" + Mac.Text + "','" + Class.Text + "','" + Div.Text + "','" + PC.Text + "')", Con1);
            cmd1.Connection = Con1;
            cmd1.ExecuteNonQuery();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','Student Data is Inserted Success','success')", true);
            Con1.Close();
        }
    }
}