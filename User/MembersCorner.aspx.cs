using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

using NIT.RemindMe.BLL;

public partial class User_MembersCorner : System.Web.UI.Page
{
    User objUser = new User();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["FirstName"] == null)
                Response.Redirect("~/Login.aspx");
            DataGrid1.DataSourceID = "XmlDataSource1";
            DataGrid1.DataBind();
        }
    }
    protected void lnkBtn_Click(object sender, EventArgs e)
    {
        objUser.Logout();
    }
}