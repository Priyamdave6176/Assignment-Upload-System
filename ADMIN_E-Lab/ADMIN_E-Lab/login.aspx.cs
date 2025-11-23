using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ADMIN_E_Lab
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void Connection()
        {
            string strcon = ConfigurationManager.ConnectionStrings["connectionlab"].ConnectionString;
            con = new SqlConnection(strcon);
        }

        protected void Btnlogin_Click(object sender, EventArgs e)
        {
            Connection();
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from admin_login where username='" + TextBox1.Text + "'and password='" + TextBox2.Text + "'", con);
            SqlDataAdapter ds = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ds.Fill(dt);
            cmd.ExecuteNonQuery();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dt.Rows.Count > 0)
            {
                while (dr.Read())
                {
                    Session["name"] = dr.GetValue(3).ToString();
                }
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Error','Wrong Username or Password','error')", true);
            }
            con.Close();
        }
    }
}