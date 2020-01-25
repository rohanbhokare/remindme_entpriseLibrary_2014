using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.IO;
using NIT.RemindMe.BLL;
public partial class User_MyAccount : System.Web.UI.Page
{
    HintQuestion objHintQuestion = new HintQuestion();
    Country objCountry = new Country();
    State objState = new State();
    City objCity = new City();

    User objUser = new User();
    DataSet dataset = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FirstName"] == null)
            Response.Redirect("~/Login.aspx");
        
            if (!Page.IsPostBack)
            {
                BindHintQuestionDDL();
                BindCountryDDL();
                BindUserData();
            }
    }

    void BindHintQuestionDDL()
    {
        dataset = objHintQuestion.BindHintQuestion();
        ddlHintQuestion.DataSource = dataset.Tables[0];
        ddlHintQuestion.DataTextField = "HintQuestion";
        ddlHintQuestion.DataValueField = "HintQuestionID";
        ddlHintQuestion.DataBind();
        ddlHintQuestion.Items.Insert(0, new ListItem("select", "0"));
        ddlHintQuestion.Items.Insert(ddlHintQuestion.Items.Count, new ListItem("Other", "1"));

    }
    void BindCountryDDL()
    {
        dataset = objCountry.BindCountry();
        ddlCountry.DataSource = dataset.Tables[0];
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataValueField = "CountryId";
        ddlCountry.DataBind();

        ddlCountry.Items.Insert(0,new ListItem("Select","0"));
        BindStateDDL();
    }
    void BindStateDDL()
    {
        objState.CountryId = int.Parse(ddlCountry.SelectedItem.Value);
        dataset = objState.BindState();
        ddlState.DataSource = dataset.Tables[0];
        ddlState.DataTextField = "StateName";
        ddlState.DataValueField = "StateId";
        ddlState.DataBind();
        ddlState.Items.Insert(0, new ListItem("Select", "0"));
        BindCityDDL();
    }
    void BindCityDDL()
    {
        objCity.StateId = int.Parse(ddlState.SelectedItem.Value);
        dataset = objCity.BindCity();
        ddlCity.DataSource = dataset.Tables[0];
        ddlCity.DataTextField = "CityName";
        ddlCity.DataValueField = "CityId";
        ddlCity.DataBind();
        ddlCity.Items.Insert(0, new ListItem("Select", "0"));
    }
    void BindUserData()
    {

        objUser.UserId = Convert.ToInt32(Session["UserId"]);
        dataset = objUser.GetUserDetails();
        DataTable datatable = dataset.Tables[0];
        if (datatable.Rows.Count > 0)
        {
            DataRow dataRow = dataset.Tables[0].Rows[0];
            txtFirstName.Text = dataRow["FirstName"].ToString();
            txtMiddleName.Text = dataRow["MiddleName"].ToString();
            txtLastName.Text = dataRow["LastName"].ToString();
            txtNickName.Text = dataRow["NickName"].ToString();
            rdbGender.SelectedIndex = rdbGender.Items.IndexOf(rdbGender.Items.FindByValue(dataRow["gender"].ToString()));
            txtDateOfBirth.Text = dataRow["DateOfBirth"].ToString();
            chkKeepAgeSecret.Checked = bool.Parse(dataRow["IsAgeSecret"].ToString());
            txtAnniversaryDate.Text = dataRow["AnniversaryDate"].ToString();
            txtMobileNumber.Text = dataRow["MobileNo"].ToString();
            if (string.IsNullOrEmpty(dataRow["UserPhoto"].ToString()))
            {
                if (rdbGender.SelectedIndex==0)
                {
                    imgProfilePic.ImageUrl = "~/Images/mShadow.png";
                }
                else if(rdbGender.SelectedIndex==1)
                {
                    imgProfilePic.ImageUrl = "~/Images/fShadow.png";
                }
                ViewState["UserPhoto"] = string.Empty;
            }
            else
            {
                imgProfilePic.ImageUrl = "~/ProfilePhoto/"+ dataRow["UserPhoto"].ToString();
            }

            txtEmailId.Text = dataRow["EmailId"].ToString();
            ddlHintQuestion.SelectedIndex = ddlHintQuestion.Items.IndexOf(ddlHintQuestion.Items.FindByValue(dataRow["HintQuestionId"].ToString()));
            txtNewHintQuestion.Text = dataRow["NewHintQuestion"].ToString();
            txtHintQuestionAnswer.Text = dataRow["HintQuestionAnswer"].ToString();
            txtRegisteredDate.Text = dataRow["DateOfRegistration"].ToString();
            txtAddressLine.Text = dataRow["AddressLine"].ToString();
            BindCountryDDL();
            ddlCountry.SelectedIndex = ddlCountry.Items.IndexOf(ddlCountry.Items.FindByValue(dataRow["CountryId"].ToString()));
            BindStateDDL();
            ddlState.SelectedIndex = ddlState.Items.IndexOf(ddlState.Items.FindByValue(dataRow["StateId"].ToString()));
            BindCityDDL();
            ddlCity.SelectedIndex = ddlCity.Items.IndexOf(ddlCity.Items.FindByValue(dataRow["CityId"].ToString()));
            txtPincode.Text = dataRow["Pincode"].ToString();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objUser.UserId = int.Parse(Session["UserId"].ToString());
        objUser.FirstName = txtFirstName.Text.Trim();
        objUser.MiddelName = txtMiddleName.Text.Trim();
        objUser.LastName = txtLastName.Text.Trim();
        objUser.NickName = txtNickName.Text.Trim();
        objUser.Gender = rdbGender.SelectedItem.Value;
        objUser.DateOfBirth = txtDateOfBirth.Text.Trim();
        objUser.IsAgeSecret = chkKeepAgeSecret.Checked;
        objUser.DateOfAnniversary = txtAnniversaryDate.Text.Trim();
        objUser.MobileNo = txtMobileNumber.Text.Trim();
        objUser.Password = txtNewPassword.Text.Trim();
        objUser.HintQuestionId = ddlHintQuestion.SelectedItem.Value;
        objUser.NewHintQuestion = txtNewHintQuestion.Text.Trim();
        objUser.HintQuestionAnswer = txtHintQuestionAnswer.Text.Trim();
        objUser.AddressLine = txtAddressLine.Text.Trim();
        objUser.CountryId = int.Parse(ddlCountry.SelectedItem.Value);
        objUser.StateId = int.Parse(ddlState.SelectedItem.Value);
        objUser.CityId = int.Parse(ddlCity.SelectedItem.Value);
        objUser.Pincode = txtPincode.Text.Trim();
        objUser.UserPhoto = fileUpload1.FileName;
        if (fileUpload1.HasFile)
            objUser.UserPhoto = fileUpload1.FileName;
        if (objUser.UpdateUserProfile() > 0)
        {
            Response.Write("success6");
        }
        else
        {
            Response.Write("Failed");
        }
        BindUserData();
    }
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(2000);
        BindStateDDL();
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCityDDL();
    }

    protected void lnkBtn_Click(object sender, EventArgs e)
    {
        objUser.Logout();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/User/MembersCorner.aspx");
    }
}