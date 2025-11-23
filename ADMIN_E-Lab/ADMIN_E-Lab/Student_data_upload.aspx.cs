using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Data.OleDb;

namespace ADMIN_E_Lab
{
    public partial class Student_data_upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Btnupload_Click(object sender, EventArgs e)
        {
            string[] validFileTypes = {"xlsx"};

            string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);

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
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Please Upload A Valid File','Only Excel File','error')", true);
                //Label9.ForeColor = System.Drawing.Color.Red;

                //Label9.Text = "Please Upload A Valid File (excel File)";

                //string.Join(",", validFileTypes);

            }
            else
            {
                String Full_name;
                String Enrollment_No;
                String Mac_address;
                String c;
                String division;
                String pc_no;
                string path = Path.GetFileName(FileUpload1.FileName);
                path = path.Replace(" ", "");
                FileUpload1.SaveAs(Server.MapPath("~/Excel_file/") + path);
                String ExcelPath = Server.MapPath("~/Excel_file/") + path;
                //OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + ExcelPath + "; ExtendedProperties = ""Excel 8.0;HDR=Yes""");
                OleDbConnection mycon = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + ExcelPath + ";Extended Properties='Excel 12.0;IMEX=1;'");
                mycon.Open();
                OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", mycon);
                OleDbDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    // Response.Write("<br/>"+dr[0].ToString());
                    Full_name = dr[0].ToString();
                    Enrollment_No = dr[1].ToString();
                    Mac_address = dr[2].ToString();
                    c = dr[3].ToString();
                    division = dr[4].ToString();
                    pc_no = dr[5].ToString();
                    savedata(Full_name, Enrollment_No, Mac_address, c, division, pc_no);


                }
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','Data Has Been Saved Successfully','success')", true);
                //Label9.Text = "Data Has Been Saved Successfully";
                //Label9.ForeColor = System.Drawing.Color.Green;
            }

        }
        private void savedata(String Full_name, String Enrollment_No, String Mac_address, String c, String division, String pc_no)
        {
            String query = "insert into student_login(Full_name,Enrollment_No,Mac_address,class,division,pc_no) values('" + Full_name + "','" + Enrollment_No + "','" + Mac_address + "','" + c + "','" + division + "','" + pc_no + "')";
            String mycon = @"Data Source=MEGHPRIY\SQLEXPRESS01;Initial Catalog=D:\E-LAB_PROJECT\USER_E-LAB\USER_E-LAB\APP_DATA\E-LAB.MDF;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }

    }
}