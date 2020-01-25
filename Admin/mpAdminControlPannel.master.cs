using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_mpAdminControlPannel : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Admin/Login.aspx");
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Remove("UserName");
        Response.Redirect("~/Admin/Login.aspx");
    }
    protected void btnControlPannel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ControlPannel.aspx");
    }
}
