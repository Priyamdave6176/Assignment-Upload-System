using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ADMIN_E_Lab
{
    public partial class Subject : System.Web.UI.Page
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
                Dropdown();
            }

        }
        private void Connection()
        {
            string strcon = ConfigurationManager.ConnectionStrings["connectionlab"].ConnectionString;
            con = new SqlConnection(strcon);
        }
        public void Dropdown()
        {
            Connection();
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from stream", con);
            Ddlstream.DataSource = cmd.ExecuteReader();
            Ddlstream.DataTextField = "stream_name";
            Ddlstream.DataValueField = "stream_id";
            Ddlstream.DataBind();
            Ddlstream.Items.Insert(0, new ListItem("Select your stream"));
            con.Close();
        }


        protected void Bgvdisplay_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = Bgvdisplay.Rows[e.RowIndex];
            int id = Convert.ToInt32(Bgvdisplay.DataKeys[e.RowIndex].Values[0]);
            string nm = (row.Cells[1].Controls[0] as TextBox).Text;
            string city = (Bgvdisplay.Rows[e.RowIndex].FindControl("ddlclass") as DropDownList).SelectedItem.Value;
            Connection();
            con.Open();
            SqlCommand cmd = new SqlCommand($"update subject set sub_name = '{nm}', class_id = '{city}' where sub_id = { id }", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Bgvdisplay.EditIndex = -1;
            FillGrid();

        }

        protected void Bgvdisplay_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Bgvdisplay.EditIndex = e.NewEditIndex;
            FillGrid();
        }

        protected void Bgvdisplay_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Bgvdisplay.EditIndex = -1;
            FillGrid();
        }

        protected void Bgvdisplay_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && Bgvdisplay.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlCities = (DropDownList)e.Row.FindControl("ddlclass");
                string sql = "SELECT DISTINCT * FROM class where stream_id=" + Ddlstream.SelectedValue + "";
                Connection();

                using (SqlDataAdapter sda = new SqlDataAdapter(sql, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlCities.DataSource = dt;
                        ddlCities.DataTextField = "class_name";
                        ddlCities.DataValueField = "class_id";
                        ddlCities.DataBind();
                        string selectedCity = DataBinder.Eval(e.Row.DataItem, "sub_id").ToString();
                        //ddlCities.Items.FindByValue(selectedCity).Selected = true;
                    }

                }
            }
            con.Close();
        }

        protected void Bgvdisplay_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Connection();
            con.Open();
            int id = Convert.ToInt32(Bgvdisplay.DataKeys[e.RowIndex].Value);
            SqlCommand cmd = new SqlCommand($"delete from subject where sub_id = {id}",
            con);
            cmd.ExecuteNonQuery();
            FillGrid();
            con.Close();

        }

        protected void Ddlstream_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillGrid();
        }
        public void FillGrid()
        {
            Connection();
            con.Open();
            //int id16 = Convert.ToInt32(ddlstream.SelectedValue);
            SqlCommand cmd = new SqlCommand("select subject.sub_id,subject.sub_name,class.class_name from subject join class on subject.class_id=class.class_id where stream_id=" + Ddlstream.SelectedValue + "", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dt = new DataSet();
            da.Fill(dt);
            Bgvdisplay.DataSource = dt;
            Bgvdisplay.DataBind();
            con.Close();
        }

        protected void Btndisplay_Click(object sender, EventArgs e)
        {
            FillGrid();
        }
    }
}