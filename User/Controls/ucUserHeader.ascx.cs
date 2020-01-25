using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NIT.RemindMe.BLL;

public partial class User_Controls_ucUserHeader : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        lblDateTime.Text = "Last Accessed Date Time : "+ Session["LastAccessedDateTime"].ToString();
        lnkBtn.Text = "(If You are not <b> " + Session["FirstName"].ToString() + "</b> then click here)";
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        User objuser = new User();
        objuser.Logout();
    }
}