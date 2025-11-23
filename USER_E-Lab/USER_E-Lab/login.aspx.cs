using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Configuration;

namespace E_Lab
{
    public partial class login : System.Web.UI.Page
    {
        string macaddress = "";
        SqlConnection con1;
        string m1;
        string m2;
        string timer;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Timer.Text = DateTime.Now.ToString("HH:mm");
                timer = Timer.Text;
            }
            
            HtmlMeta meta = new HtmlMeta();

            meta.HttpEquiv = "Refresh";

            meta.Content = "60000";

            this.Page.Header.Controls.Add(meta);


            try
            {
                //Don't touch this code Network code

                NetworkInterface[] anics = NetworkInterface.GetAllNetworkInterfaces();
                foreach (NetworkInterface adapter in anics)
                {
                    if (macaddress == String.Empty)
                    {
                        IPInterfaceProperties properties = adapter.GetIPProperties();
                        macaddress = adapter.GetPhysicalAddress().ToString();
                        Label4.Visible = true;
                        Label4.Text = macaddress;
                    }

                }
                //Don't touch this code Network code
            }

            catch (Exception){ 
            
            }

            connection();
            con1.Open();
            SqlCommand cmd = new SqlCommand("select stream.stream_name, class.class_name, division.div_name, semester.sem_name, subject.sub_name, uploaded_assignment.assignment_no, uploaded_assignment.date, uploaded_assignment.start_time, uploaded_assignment.end_time , uploaded_assignment.file_path from uploaded_assignment Join class On class.class_id = uploaded_assignment.class_id join division on division.div_id = uploaded_assignment.div_id join semester on semester.sem_id=uploaded_assignment.sem_id join subject on subject.sub_id = uploaded_assignment.sub_id join stream on stream.stream_id = uploaded_assignment.stream_id", con1);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            cmd.ExecuteNonQuery();
            SqlDataReader dr1 = cmd.ExecuteReader();
            if (dt1.Rows.Count > 0)
            {
                while (dr1.Read())
                {
                    starttime.Text = dr1.GetValue(7).ToString();
                    endtime.Text = dr1.GetValue(8).ToString();
                    Session["subject"]= dr1.GetValue(4).ToString();
                    div1.Text = dr1.GetValue(2).ToString();
                    class1.Text = dr1.GetValue(1).ToString();
                    m1 = starttime.Text;
                    m2 = endtime.Text;
                   
                }
                
            }
           
            

        }







        //ConnectionString start

        public void connection()
        {
            string strcon = ConfigurationManager.ConnectionStrings["connectionlab"].ConnectionString;
            con1 = new SqlConnection(strcon);
        }

        //ConnectionString End
















        protected void Button1_Click(object sender, EventArgs e)
            
        {

            TimeSpan t1 = TimeSpan.Parse(m1);
            TimeSpan t2 = TimeSpan.Parse(m2);
            TimeSpan now = TimeSpan.Parse(Timer.Text);

            if (now >= t1 && now <= t2)
            {
               
                    connection();
                    con1.Open();
                    SqlCommand cmd = new SqlCommand("select * from student_login where Enrollment_No='" + TextBox1.Text + "'and Mac_address='" + Label4.Text + "' and class='" + class1.Text + "' and division='" + div1.Text + "'", con1);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    cmd.ExecuteNonQuery();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dt.Rows.Count > 0)
                    {
                        while (dr.Read())
                        {

                            Session["enrollment_no"] = dr.GetValue(2).ToString();
                            Session["Full_name"] = dr.GetValue(1).ToString();
                            Session["stud_id"] = dr.GetValue(0).ToString();
                        }
                        Response.Redirect("Welcome.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('No Lab Schedule','','error')", true);
                        //Label1.Text = "No Lab Schedule";
                        //Label1.ForeColor = System.Drawing.Color.Red;
                    }
                    con1.Close();
               
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('No Lab Schedule','','error')", true);
                //Label1.Text = "No Lab Schedule";
                //Label1.ForeColor = System.Drawing.Color.Red;
            }
           
                //fetch the time from database
          
        }
           

        }


    }

