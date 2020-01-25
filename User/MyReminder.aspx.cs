using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using NIT.RemindMe.BLL;
public partial class User_MyReminder : System.Web.UI.Page
{
    Birthday objBirthday;
    User objUser = new User();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FirstName"] == null)
            Response.Redirect("~/Login.aspx");
        if (!Page.IsPostBack)
        {
            BindBirthdaysGV();
        }
    }
    protected void lnkBtn_Click(object sender, EventArgs e)
    {
        objUser.Logout();
    }

    void BindBirthdaysGV()
    {
        objBirthday = new Birthday();
        DataSet ds = objBirthday.GetBirthdays(Session["UserId"].ToString());
        gvBirthday.DataSource = ds.Tables[0];
        gvBirthday.DataBind();
    }

    protected void btnAddBirthdays_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddBirthdays.aspx");
    }
    protected void btnBirthdayRequester_Click(object sender, EventArgs e)
    {
        Response.Redirect("BirthdayRequester.aspx");
    }
    protected void gvBirthday_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblLastName = (Label)e.Row.FindControl("lblLastName");
            Label lblNickName = (Label)e.Row.FindControl("lblNickName");
            LinkButton lnkBtnEmail = (LinkButton)e.Row.FindControl("lnkBtnEmail");
            Label lblEventDate = (Label)e.Row.FindControl("lblEventDate");
            Label lblEvent = (Label)e.Row.FindControl("lblEvent");
            if (lblEventDate != null && lblEvent != null)
            {
                int age = DateTime.Now.Year - (DateTime.Parse(lblEventDate.Text).Year);
                lblEvent.Text = age.ToString() + "th Birthday";
            }

            if (lblLastName != null)
            {
                if (lblLastName.Text == "")
                    lblLastName.Text = "<b>NA<b>";
            }

            if (lblNickName != null)
            {
                if (lblNickName.Text == "")
                    lblNickName.Text = "<b>NA<b>";
            }

            if (lnkBtnEmail != null)
            {
                if (lnkBtnEmail.Text == "")
                    e.Row.Cells[7].Text = "<b>NA<b>";
            }

            
        }
    }
}