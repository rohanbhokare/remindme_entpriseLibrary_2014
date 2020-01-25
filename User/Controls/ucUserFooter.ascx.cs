using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NIT.RemindMe.BLL;


public partial class User_Controls_ucUserFooter : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        User objuser = new User();
        objuser.Logout();
    }
}