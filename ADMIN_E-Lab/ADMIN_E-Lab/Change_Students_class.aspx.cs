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
    public partial class Change_Students_class : System.Web.UI.Page
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            string FY = "FY";
            string SY = "SY";
            Connection();
            con.Open();
            SqlCommand cmd = new SqlCommand($"update student_login set class='"+SY+"' where class =  '" + FY + "' ", con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','FY Students Class Change to SY Success','success')", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Class is Already Changed','','error')", true);
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string SY = "SY";
            string TY = "TY";
            Connection();
            con.Open();
            SqlCommand cmd = new SqlCommand($"update student_login set class='" + TY + "' where class =  '" + SY + "' ", con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','SY Students Class Change to TY Success','success')", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Class is Already Changed','','error')", true);
            }
            con.Close();
        }
    }
}