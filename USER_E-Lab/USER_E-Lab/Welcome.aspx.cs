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

namespace Welcomepage
{
    public partial class Welcome : System.Web.UI.Page
    {
        SqlConnection con1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["fUll_name"] == null)
            {
                    Response.Redirect("login.aspx");
            }
            if (Session["Myname"] != null)
            {
                Label9.Text = Session["Myname"].ToString();
            }
            if (Session["enrollment_no"] != null)
            {
                Enrollment.Text = Session["enrollment_no"].ToString();
            }
            
            Conn();
            con1.Open();
            SqlCommand cmd = new SqlCommand("select stream.stream_name, class.class_name, division.div_name, semester.sem_name, subject.sub_name, uploaded_assignment.assignment_no, uploaded_assignment.date, uploaded_assignment.file_path from uploaded_assignment Join class On class.class_id = uploaded_assignment.class_id join division on division.div_id = uploaded_assignment.div_id join semester on semester.sem_id=uploaded_assignment.sem_id join subject on subject.sub_id = uploaded_assignment.sub_id join stream on stream.stream_id = uploaded_assignment.stream_id",con1);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmd.ExecuteNonQuery();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dt.Rows.Count > 0)
            {
                while (dr.Read())
                {
                    Assignment_date.Text = dr.GetValue(6).ToString();
                    Assignment_No.Text = dr.GetValue(5).ToString();
                    Subject.Text = dr.GetValue(4).ToString();
                    Semester.Text = dr.GetValue(3).ToString();
                    Division.Text= dr.GetValue(2).ToString();
                    Class.Text = dr.GetValue(1).ToString();
                    Stream.Text= dr.GetValue(0).ToString();
                }
                Session["class"] = Class.Text;
                Session["division"] = Division.Text;
            }
            con1.Close();
        }
        private void Conn()
        {
            string strcon = ConfigurationManager.ConnectionStrings["connectionlab"].ConnectionString;
            con1 = new SqlConnection(strcon);
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string[] validFileTypes = { "txt", "docx", "java", "py", "doc", "php"};

            string ext = System.IO.Path.GetExtension(fileupload.PostedFile.FileName);

            bool isValidFile = false;

            for (int i = 0; i < validFileTypes.Length; i++)

            {

                if (ext == "." + validFileTypes[i])

                {

                    isValidFile = true;

                    break;

                }

            }

            if (!isValidFile)

            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please upload a Valid file','','error')", true);
                //Label6.ForeColor = System.Drawing.Color.Red;

                //Label6.Text = "Please upload a Valid file";

                //string.Join(",", validFileTypes);

            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','Your Assignment is Uploaded Successfully','success')", true);

                //Label6.ForeColor = System.Drawing.Color.Green;

                //Label6.Text = "File uploaded successfully.";
                Conn();
                con1.Open();
                String file = "D:/E-LAB_Project/Student_Assignments/" + Path.GetFileName(fileupload.FileName);
                //fileupload.SaveAs(Server.MapPath(@"D:\upload_assignment\") + Path.GetFileName(fileupload.FileName));
                fileupload.SaveAs(@"D:\E-LAB_Project\Student_Assignments\" + fileupload.FileName);
                SqlCommand cmd = new SqlCommand("INSERT INTO student_assignment VALUES('"+ Label9.Text +"','"+Enrollment.Text+"','"+ Stream.Text +"','"+ Class.Text +"','"+ Division.Text +"','"+ Subject.Text +"','"+ Assignment_No.Text +"','"+ file +"','"+ Assignment_date.Text + "')",con1);
                cmd.ExecuteNonQuery();
                con1.Close();
            }

        }
    }
}

