using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using NIT.RemindMe.BLL;

public partial class Login : System.Web.UI.Page
{
    User objUser = new User();
    protected void Page_Load(object sender, EventArgs e)
    {
        mpeLogin.Show();
        if (!Page.IsPostBack)
        {
            
        }
        if (Session["UserId"] != null)
        {
            Response.Redirect("~/User/");
        }
    }

    #region Login Button Click
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        lnkbtnResendMail.Visible = false;
        objUser.EmailId = txtEmailId.Text.Trim();
        objUser.Password = txtPassword.Text.Trim();
        DataSet dsLogin = objUser.CheckUserLogin();
        DataTable dtLogin = dsLogin.Tables[0];

        if (dtLogin.Rows.Count > 0)
        {
            if (objUser.CheckUserAccountStatus(1) > 0)
            {
                lblError.Text = "Check your Mail to activate your account";
                ViewState["EmailId"] = txtEmailId.Text.Trim();
                ViewState["FirstName"] = dtLogin.Rows[0]["FirstName"].ToString();
                lnkbtnResendMail.Visible = true;
                return;
            }
            if (objUser.CheckUserAccountStatus(2) > 0)
            {
                lblError.Text = "Your account is De-Activated. Please Contact Administrator";
                return;
            }

            Session["UserId"]=dtLogin.Rows[0]["UserId"].ToString();
            Session["FirstName"] = dtLogin.Rows[0]["FirstName"].ToString();
            Session["EmailId"] = dtLogin.Rows[0]["EmailId"].ToString();
            Session["LastAccessedDateTime"] = dtLogin.Rows[0]["LastAccessedDateTime"].ToString();
            objUser.UserId = int.Parse(Session["UserId"].ToString());
            DateTime LastAccessedDateTime = DateTime.Now;
            if (!string.IsNullOrEmpty(dtLogin.Rows[0]["LastAccessedDateTime"].ToString()))
            {
                LastAccessedDateTime = DateTime.Parse(dtLogin.Rows[0]["LastAccessedDateTime"].ToString());
            }
            DateTime currentLoginDateTime = DateTime.Now;
            objUser.UpdateUserLastAccessedDateTime(currentLoginDateTime);
            Session["UserLastAccessedDateTime"] = LastAccessedDateTime;
            Response.Redirect("~/User/Default.aspx");
        }
        else
        {
            lblError.Text = "<b style='color:red'> Incorret Email-Id or Password </b>";
        }
    }
    #endregion


    protected void lnkbtnResendMail_Click(object sender, EventArgs e)
    {
        objUser.EmailId= ViewState["EmailId"].ToString();
        objUser.FirstName = ViewState["FirstName"].ToString();
        objUser.SendActivationMail();
        lnkbtnResendMail.Visible = false;
        lblError.Text = "<b style='color:green'>Mail has been Sent to your Email-Id. Please Activate your Account for Login </b>";
    }
    protected void btnEmailPassword_Click(object sender, EventArgs e)
    {
        objUser.EmailId = txtForgetEmail.Text.Trim();
        objUser.HintQuestionAnswer = txtAnswer.Text.Trim();
    
        IDataReader dataReader = objUser.GetForgetPassword();
        if (dataReader.Read())
        {
            objUser.EmailId = txtForgetEmail.Text.Trim();
            objUser.Password = dataReader["Password"].ToString();
            //objUser.SendPasswordMail();
            //show password sent popup window
            lblEmailsent.Text = txtForgetEmail.Text.Trim();
            txtForgetEmail.Text = string.Empty;
            mpePwdSent.Show();
        }
        else
        {
            lblStatus.Text = "This answer is not matched!!!";
            EmailCheck emailCheck = new EmailCheck();
            txtHintQuestion.Text = emailCheck.GetHintQuestion(txtForgetEmail.Text.Trim());
            trHintQuestion.Style.Add("display","");
            trHintAnswer.Style.Add("display","");
            mpeForgetPassword.Show();
            txtAnswer.Focus();
        }
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost/remindme.com");
    }
}