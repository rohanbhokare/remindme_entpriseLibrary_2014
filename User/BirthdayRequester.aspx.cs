using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using NIT.RemindMe.BLL;
public partial class User_BirthdayRequester : System.Web.UI.Page
{
    User objUser = new User();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FirstName"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!Page.IsPostBack)
        {
            if (Session["EmailId"] != null)
            {
                lblFrom.Text = Session["FirstName"].ToString() + " (" + Session["EmailId"].ToString() + ")";
                txtSubject.Text = Session["FirstName"].ToString() + " wants to know your Birthday";
                string message = "\n\n I'm organizing my friends and family's birthdays.\n\n Please do me a favor and enter your birthday by clicking on:\n";

                message += "<a href='";
                message += ConfigurationManager.AppSettings["InternetUrl"].ToString();
                message += "AddMyBirthday.aspx?uid=" + Session["UserId"] + "&nm=" + Session["FirstName"].ToString();
                message += "' target='_blank'>" + ConfigurationManager.AppSettings["InternetUrl"].ToString() + "AddMyBirthday.aspx?uid=" + Session["UserId"] + "&nm=" + Session["FirstName"].ToString() + "</a>";


                message += " \n It only takes a minute.\n \n\n Thanks! \n ";
                message += Session["FirstName"].ToString();
                txtMessageBody.Text = message;
            }
        }

    }
    protected void lnkBtn_Click(object sender, EventArgs e)
    {
        objUser.Logout();
    }
}