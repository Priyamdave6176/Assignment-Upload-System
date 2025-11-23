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
    public partial class Upload_Assignment_form : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Dropdown();
            }

            if (Session["name"] == null)
            {
                Response.Redirect("login.aspx");
            }
            string date = DateTime.UtcNow.ToString("dd/MM/yyyy");
            DATE.Text = date;
        }
        public void Connection()
        {
            string strcon = ConfigurationManager.ConnectionStrings["connectionlab"].ConnectionString;
            con = new SqlConnection(strcon);
        }
        public void Dropdown()
        {
            Connection();
            if (con != null)
            {
                con.Open();
                SqlCommand cmd11 = new SqlCommand("select * from stream", con);
                cmd11.CommandType = CommandType.Text;
                Stream.DataSource = cmd11.ExecuteReader();
                Stream.DataTextField = "stream_name";
                Stream.DataValueField = "stream_id";
                Stream.DataBind();
                Stream.Items.Insert(0, new ListItem("Select a Stream"));
            }
        }

        protected void Stream_SelectedIndexChanged(object sender, EventArgs e)
        {
            Connection();
            int stream_id = Convert.ToInt32(Stream.SelectedValue);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from class where stream_id=" + stream_id, con);
            cmd.CommandType = CommandType.Text;
            Class.DataSource = cmd.ExecuteReader();
            Class.DataTextField = "class_name";
            Class.DataValueField = "class_id";
            Class.DataBind();
            Class.Items.Insert(0, new ListItem("Select a class"));
        }

        protected void Class_SelectedIndexChanged(object sender, EventArgs e)
        {
            int class_id = Convert.ToInt32(Class.SelectedValue);
            Connection();
            con.Open();
            SqlCommand cmd12 = new SqlCommand("select * from division where class_id=" + class_id, con);
            cmd12.CommandType = CommandType.Text;
            division.DataSource = cmd12.ExecuteReader();
            division.DataTextField = "div_name";
            division.DataValueField = "div_id";
            division.DataBind();
            division.Items.Insert(0, new ListItem("Select a Division"));
            //int class_id = Convert.ToInt32(Class.SelectedValue);
            Connection();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("select * from semester where class_id=" + class_id, con);
            cmd1.CommandType = CommandType.Text;
            semester.DataSource = cmd1.ExecuteReader();
            semester.DataTextField = "sem_name";
            semester.DataValueField = "sem_id";
            semester.DataBind();
            semester.Items.Insert(0, new ListItem("Select a semester"));
            Connection();
            con.Open();
            SqlCommand cmd5 = new SqlCommand("select * from subject where class_id=" + class_id, con);
            cmd5.CommandType = CommandType.Text;
            subject.DataSource = cmd5.ExecuteReader();
            subject.DataTextField = "sub_name";
            subject.DataValueField = "sub_id";
            subject.DataBind();
            subject.Items.Insert(0, new ListItem("Select a subject"));

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Connection();
            int s_id = Convert.ToInt32(Stream.SelectedValue);
            int class_id = Convert.ToInt32(Class.SelectedValue);
            int div_id = Convert.ToInt32(division.SelectedValue);
            int sem_id = Convert.ToInt32(semester.SelectedValue);
            int sub_id = Convert.ToInt32(subject.SelectedValue);
            //FileUpload1.SaveAs(Server.MapPath("~/Admin_file_upload/") + Path.GetFileName(FileUpload1.FileName));
            //String link = "Admin_file_upload/" + Path.GetFileName(FileUpload1.FileName);

            String file = "D:/E-LAB_Project/Uploaded_Assignments/" + Path.GetFileName(FileUpload1.FileName);
            FileUpload1.SaveAs(@"D:\E-LAB_Project\Uploaded_Assignments\" + FileUpload1.FileName);
            SqlCommand cmd1 = new SqlCommand("Insert into uploaded_assignment values('" + s_id + "','" + class_id + "','" + div_id + "','" + sem_id + "','" + sub_id + "','" + assignment.Text + "','" + TextBox1.Text + "','" + file + "','" + DATE.Text + "','" + T1.Value + "','" + Time1.Value + "')", con);
            cmd1.Connection = con;
            con.Open();
            cmd1.ExecuteNonQuery();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','Your Assignment is Uploaded Successfully','success')", true);
            con.Close();
        }
    }
}