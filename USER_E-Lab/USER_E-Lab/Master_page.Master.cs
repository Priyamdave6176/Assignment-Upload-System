using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace Welcomepage
{
    public partial class Master_page : System.Web.UI.MasterPage
    {
        SqlConnection con1;
        String filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["Full_Name"] == null)
            {
               Response.Redirect("login.aspx");
            }
            else
            {
                if (Session["Full_name"] != null)
                {
                    Label9.Text = Session["Full_name"].ToString();
                    Session["Myname"] = Label9.Text;
                }
            }
            Connection();
            con1.Open();
           
            SqlCommand cmd = new SqlCommand("select stream.stream_name, class.class_name, division.div_name, semester.sem_name, subject.sub_name, uploaded_assignment.assignment_no, uploaded_assignment.date, uploaded_assignment.file_path from uploaded_assignment Join class On class.class_id = uploaded_assignment.class_id join division on division.div_id = uploaded_assignment.div_id join semester on semester.sem_id=uploaded_assignment.sem_id join subject on subject.sub_id = uploaded_assignment.sub_id join stream on stream.stream_id = uploaded_assignment.stream_id", con1);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmd.ExecuteNonQuery();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dt.Rows.Count > 0)
            {
                while (dr.Read())
                {
                    filepath = dr.GetValue(7).ToString();
                }
               
                //Response.ContentType = "image/txt";
                ////filepath.Replace('\\', '/').Insert(0, "~/");
                //Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filepath + "\"");
                //Response.TransmitFile(Server.MapPath("@"+filepath));
                //Response.End();
            }
            con1.Close();
        }
        private void Connection()
        {
            con1 = new SqlConnection(@"Data Source=MEGHPRIY\SQLEXPRESS01;Initial Catalog=D:\E-LAB_PROJECT\USER_E-LAB\USER_E-LAB\APP_DATA\E-LAB.MDF;Integrated Security=True");
        }
        protected void DownloadFile(object sender, EventArgs e)
        {
            Response.ContentType = "text/plain";
            FileInfo file = new FileInfo(filepath);
            Response.AppendHeader("content-disposition", "attachment; filename=" + file.Name);
            Response.AddHeader("Content-Length", file.Length.ToString());
            Response.TransmitFile(file.FullName);
            Response.End();
        }

        protected void LOGOUT_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("Full_Name");
            Session.Clear();
  
        }
    }
}