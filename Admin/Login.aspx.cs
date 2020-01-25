using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using NIT.RemindMe.BLL;

public partial class Admin_Login : System.Web.UI.Page
{
    AdminUser objAdminUser = null;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void imgBtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        objAdminUser = new AdminUser();
        objAdminUser.UserName = txtUserId.Text.Trim();
        objAdminUser.Password = txtPassword.Text;
        DataSet ds = objAdminUser.CheckAdminLogin();
        DataRowCollection dataRowCollection = ds.Tables[0].Rows;
        if (dataRowCollection.Count > 0)
        {
            DataRow dataRow = dataRowCollection[0];
            Session["UserName"] = dataRow["UserName"].ToString();
            DateTime currentAccessedDateTime = DateTime.Now;
            DateTime lastAccessedDateTime = DateTime.Now;
            if (!string.IsNullOrEmpty(dataRow["LastAccessedDateTime"].ToString()))
            {
                lastAccessedDateTime = DateTime.Parse(dataRow["LastAccessedDateTime"].ToString());
            }
            objAdminUser.UpdateAdminLastAccessedDateTime(txtUserId.Text.Trim(), currentAccessedDateTime);
            Session["AdminLastAccessedDateTime"] = lastAccessedDateTime;
            Response.Redirect("~/Admin/ControlPannel.aspx");
        }
        else
        {
            lblStatus.Text = "Login failed plz check userid or password";
        }

    }
}