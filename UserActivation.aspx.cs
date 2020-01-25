using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NIT.RemindMe.BLL;
public partial class UserActivation_aspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User objUser = new User();
        if (Request.QueryString["eml"] == null)
            Response.Redirect("~/Registration.aspx");
        string EncryEmailId = Request.QueryString["eml"].ToString().Replace(" ", "+");
        objUser.EmailId = objUser.GetDecryptedData(EncryEmailId,"sunny");
        if (objUser.ActivateAccount() > 0)
        {
            lblStatus.Text = "<b style='color:green'> Your Account is Activated Successfully!!!<br/> Please <a href='Login.aspx' style='background-color:#ffc90e;'>click Here</a> for Login</b>";
        }
        else
        {
            lblStatus.Text = "<b style='color:red'> Your Account Activation Failed... Please try again!!! or Register Again!!! </b>";
        }
    }
}