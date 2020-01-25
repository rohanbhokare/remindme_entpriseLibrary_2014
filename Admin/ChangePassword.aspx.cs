using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NIT.RemindMe.BLL;

public partial class Admin_ChangePassword : System.Web.UI.Page
{
    AdminUser objAdmin = new AdminUser();

    protected void Page_Load(object sender, EventArgs e)
    {
        img1.Visible = false;
    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        if (objAdmin.CheckOldPassword(Session["UserName"].ToString(), txtOldPassword.Text.Trim()) > 0)
        {
            if (objAdmin.ChangeAdminPassword(Session["UserName"].ToString(), txtOldPassword.Text.Trim(), txtNewPassword.Text.Trim()) > 0)
            {
                lblOldPasswordStatus.Text = "<b style='background-color:green;color:white;font:14px Tahoma'>Password Change Successfully<b>";
                img1.Visible = true;
            }
            else
            {
                lblOldPasswordStatus.Text = "Pasword Changing Failed";
            }
        }
        else
        {
            lblOldPasswordStatus.Text = "Check Old Password";
        }
    }
}