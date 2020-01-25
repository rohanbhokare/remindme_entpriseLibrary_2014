using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NIT.RemindMe.BLL;

public partial class Admin_CheckOldPassword : System.Web.UI.Page
{
    AdminUser objAdmin = new AdminUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["pwd"] != null && Request.QueryString["uname"] != null)
        {
            if (objAdmin.CheckOldPassword(Request.QueryString["uname"].ToString(), Request.QueryString["pwd"].ToString()) > 0)
            {
                Response.Write("");
            }
            else
            {
                Response.Write(" Please enter correct 'Old Password'");
            }
        }
        else
        {
            Response.Redirect("~/Admin/ChangePassword.aspx");
        }
        Response.End();
    }
}