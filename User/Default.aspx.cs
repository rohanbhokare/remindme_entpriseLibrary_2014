using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NIT.RemindMe.BLL;

public partial class User_Default : System.Web.UI.Page
{
    User objUser = new User();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FirstName"] != null)
        {
            lblName.Text = Session["FirstName"].ToString();
            lblLastAccessedDateTime.Text = Session["LastAccessedDateTime"].ToString();
        }
    }
    protected void lnkBtn_Click(object sender, EventArgs e)
    {
        objUser.Logout();
    }
}