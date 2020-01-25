using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using NIT.RemindMe.BLL;

public partial class Admin_ManageCountry : System.Web.UI.Page
{
    Country objCountry = new Country();
    DataSet dataset;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["SortOn"] = "CountryName";
            ViewState["SortBy"] = "asc";
            BindCountryData();
        }
    }
    void BindCountryData()
    {
        objCountry.CountryName = txtCountrySearch.Text.Trim();
        objCountry.SortOn = ViewState["SortOn"].ToString();
        objCountry.SortBy = ViewState["SortBy"].ToString();
        dataset = objCountry.GetCountry();
        gvCountry.DataSource = dataset.Tables[0];
        gvCountry.DataBind();
    }
    protected void btnSerach_Click(object sender, EventArgs e)
    {
        BindCountryData();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        objCountry.CountryName = txtAddCountry.Text.Trim();
        objCountry.IsActive = chkAddIsActive.Checked;
        if (objCountry.AddCountry() > 0)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Country Details Added Successfully!!!')</script>");
            BindCountryData();
            txtAddCountry.Text = string.Empty;
            chkAddIsActive.Checked = false;
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Country Details Adding Failed!!!')</script>");
            BindCountryData();
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objCountry.CountryId = Convert.ToInt32(ViewState["CountryId"]);
        objCountry.CountryName = txtEditCountry.Text.Trim();
        objCountry.IsActive = chkEditCountry.Checked;
        if (objCountry.UpdateCountry() > 0)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Country Details Updated Successfully!!!')</script>");
            BindCountryData();
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Country Details Updation Failed!!!')</script>");
        }

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = (Button)sender;
        GridViewRow grv = (GridViewRow)btnEdit.NamingContainer;
        ViewState["CountryId"] = grv.Cells[1].Text;
        txtEditCountry.Text = grv.Cells[2].Text;
        chkEditCountry.Checked = ((CheckBox)grv.Cells[3].Controls[0]).Checked;
        mpe2.Show();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Button btnYes = (Button)sender;
        GridViewRow grv = (GridViewRow)btnYes.NamingContainer;
        ViewState["CountryId"] = grv.Cells[1].Text;
        mpe3.Show();
    }

    protected void btnYes_Click(object sender, EventArgs e)
    {
        objCountry.CountryId = Convert.ToInt32(ViewState["CountryId"]);
        if (objCountry.DeleteCountryById() > 0)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Country Details Deleted Successfully!!!')</script>");
            BindCountryData();
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Country Details Deletion Failed!!!')</script>");
        }
    }
    protected void gvCountry_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCountry.PageIndex = e.NewPageIndex;
        BindCountryData();

    }
    protected void gvCountry_Sorting(object sender, GridViewSortEventArgs e)
    {
       ViewState["SortOn"]= e.SortExpression;
       if (ViewState["SortBy"].ToString() == "asc")
       {
           ViewState["SortBy"] = "desc";
       }
       else
       {
           ViewState["SortBy"] = "asc";
       }
        BindCountryData();
    }
}