using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADMIN_E_Lab
{
    public partial class ADMIN : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] != null)
            {
                Session_name.Text = Session["name"].ToString();
            }
            if (!IsPostBack)
            {
                if (Session["name"] == null)
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        protected void Btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("name");
            Session.Clear();
            Response.Redirect("login.aspx");
        }
    }
}