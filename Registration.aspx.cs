using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.Common;
using NIT.RemindMe.BLL;
using System.Configuration;

public partial class Registration : System.Web.UI.Page
{
    User objUser = new User();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null && PreviousPage.IsCrossPagePostBack )
        {
            //ValidatorCalloutExtender1.Enabled = vce3.Enabled= vce4.Enabled =  vce5.Enabled = false;
            Session["pwd"] = PreviousPage.Password;
            txtEmail.Text = PreviousPage.EmailId;
            txtPassword.Attributes.Add("value", PreviousPage.Password);
            txtPasswordAgain.Attributes.Add("value", PreviousPage.Password);
            txtEmail.Attributes.Add("readonly","readonly");
            txtPassword.Attributes.Add("readonly","readonly");
            txtPasswordAgain.Attributes.Add("readonly", "readonly");
        }
        txtDateOfBirth.Attributes.Add("readonly", "readonly");

       
    }
    protected void btnGetStart_Click(object sender, EventArgs e)
    {
        EmailCheck objCheck = new EmailCheck();
        if (objCheck.CheckEmailAvalibility(txtEmail.Text.Trim()) > 0)
        {
            lblEmailStatus.Text = "This Email-Id is already in use";
        }
        else
        {
            txtDateOfBirth.Attributes.Remove("readonly");
            txtEmail.Attributes.Remove("readonly");
            txtPassword.Attributes.Remove("readonly");
            txtPasswordAgain.Attributes.Remove("readonly");
            objUser.EmailId = txtEmail.Text.Trim();
            if (Session["pwd"] != null)
            {
                objUser.Password = Session["pwd"].ToString();

            }
            else
                objUser.Password = txtPassword.Text.Trim();
            objUser.DateOfRegistration = DateTime.Now;
            objUser.IsApproved = false;
            objUser.IsCancel = false;
            objUser.FirstName = txtFirstName.Text.Trim();
            objUser.MiddelName = txtMiddleName.Text.Trim();
            objUser.LastName = txtLastName.Text.Trim();
            objUser.DateOfBirth = txtDateOfBirth.Text.Trim();
            objUser.Gender = rdbGender.SelectedItem.Value;
            objUser.IsAgeSecret = chkAgeSecret.Checked;
            objUser.MobileNo = txtMobileNumber.Text.Trim();

            if (objUser.UserRegistration() > 0)
            {
                objUser.SendActivationMail();
                lblRegStat.Text = "Registration done successfully!!!";
                mpe.Show();
                txtMobileNumber.Text = txtMiddleName.Text = txtLastName.Text = txtFirstName.Text = txtEmail.Text = txtDateOfBirth.Text = string.Empty;
                txtPassword.Text = txtPasswordAgain.Text = string.Empty;
                txtPassword.Attributes.Remove("value");
                txtPasswordAgain.Attributes.Remove("value");
                chkAgeSecret.Checked = false;
            }
            else
            {
                lblRegStat.Text = "Registration Failed... Try Again!!!";
                mpe.Show();
            }
        }
    }
}