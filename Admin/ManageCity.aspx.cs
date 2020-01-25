using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NIT.RemindMe.BLL;
using System.Data;

public partial class Admin_ManageCity : System.Web.UI.Page
{
    City objCity = new City();
    State objState = new State();
    Country objCountry = new Country();
    DataSet dataset;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["SortOn"] = "StateName";
            ViewState["SortBy"] = "Asc";
            BindCountryDdl();
            BindCityGv();
        }
    }


    void BindCountryDdl()
    {
        objCountry.SortOn = "CountryName";
        objCountry.SortBy = "asc";
        dataset = objCountry.GetCountry();
        if (dataset.Tables[0].Rows.Count > 0)
        {
            ddlEditCityCountry.DataSource = ddlAddCityCountry.DataSource = ddlCountry.DataSource = dataset.Tables[0];
            ddlEditCityCountry.DataTextField = ddlAddCityCountry.DataTextField = ddlCountry.DataTextField = "CountryName";
            ddlEditCityCountry.DataValueField = ddlAddCityCountry.DataValueField = ddlCountry.DataValueField = "CountryId";
            ddlCountry.DataBind();
            ddlAddCityCountry.DataBind();
            ddlEditCityCountry.DataBind();
            ddlCountry.Items.Insert(0, new ListItem("Select", "0"));
            ddlAddCityCountry.Items.Insert(0, new ListItem("Select", "0"));
            
        }
    }


    void BindStateDdl()
    {
        objState.SortOn = "StateName";
        objState.SortBy = "asc";
        dataset = objState.GetState();
        if (dataset.Tables[0].Rows.Count > 0)
        {
            ddlEditCityState.DataSource = ddlAddCityState.DataSource = ddlState.DataSource = dataset.Tables[0];
            ddlEditCityState.DataTextField = ddlAddCityState.DataTextField = ddlState.DataTextField = "StateName";
            ddlEditCityState.DataValueField = ddlAddCityState.DataValueField = ddlState.DataValueField = "StateId";
            ddlState.DataBind();
            ddlAddCityState.DataBind();
            ddlEditCityState.DataBind();
            ddlState.Items.Insert(0, new ListItem("Select", "0"));
            ddlAddCityState.Items.Insert(0, new ListItem("Select", "0"));

            BindCityGv();

        }
    }


    void BindCityGv()
    {
        objCity.CountryId = int.Parse(ddlCountry.SelectedItem.Value);
        objCity.StateId = int.Parse(ddlState.SelectedItem.Value);
        objCity.CityName = txtCitySearch.Text.Trim();
        objCity.SortOn = ViewState["SortOn"].ToString();
        objCity.SortBy = ViewState["SortBy"].ToString();
        dataset = objCity.GetCity();
        gvCity.DataSource = dataset.Tables[0];
        gvCity.DataBind();
    }
    
    
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        objCity.CountryId = int.Parse(ddlAddCityCountry.SelectedItem.Value);
        objCity.StateId = int.Parse(ddlAddCityState.SelectedItem.Value);
        objCity.CityName = txtAddCity.Text.Trim();
        objCity.IsActive = chkAddIsActive.Checked;
        if (objCity.AddCity() > 0)
        {
            lblStatus.Text = "Added Successfully!!!";
            BindCityGv();
            mpeStatus.Show();
            ddlAddCityCountry.SelectedIndex = 0;
            ddlAddCityState.SelectedIndex = 0;
            txtAddCity.Text = string.Empty;
            chkAddIsActive.Checked = false;
        }
        else
        {
            lblStatus.Text = "Unable to Add ...Try Again!!!";
            mpeStatus.Show();
        }

    }
    
    
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objCity.CityId = Convert.ToInt32(ViewState["CityId"].ToString());
        objCity.CountryId = int.Parse(ddlEditCityCountry.SelectedItem.Value);
        objCity.StateId = int.Parse(ddlEditCityState.SelectedItem.Value);
        objCity.CityName = txtEditCity.Text.Trim();
        objCity.IsActive = chkEditState.Checked;
        if (objCity.UpdateCity() > 0)
        {
            lblStatus.Text = "Updated Successfully!!!";
            mpeStatus.Show();
            BindCityGv();
        }
        else
        {
            lblStatus.Text = "Updation Failed!!!";
            mpeStatus.Show();
        }
    }
    
    
    protected void btnYes_Click(object sender, EventArgs e)
    {
        objCity.CityId = int.Parse(ViewState["CityId"].ToString());
        if (objCity.DeleteCityById() > 0)
        {
            lblStatus.Text = "Deleted Successfully";
            mpeStatus.Show();
            BindCityGv();
        }
        else
        {
            lblStatus.Text = "Deletion Failed";
            mpeStatus.Show();
        }
    }


    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        BindStateById(ddlState, (DropDownList)sender);
        ddlState.Items.Insert(0,new ListItem("select","0"));
    }


    void BindStateById(DropDownList targetDdl,DropDownList senderDdl)
    {
        DataSet ds = objState.GetStateByCountryId(int.Parse(senderDdl.SelectedItem.Value));
        targetDdl.DataSource = ds.Tables[0];
        targetDdl.DataTextField = "StateName";
        targetDdl.DataValueField = "StateId";
        targetDdl.DataBind();
    }


    protected void btnSerach_Click(object sender, EventArgs e)
    {
        BindCityGv();
    }


    protected void gvState_Sorting(object sender, GridViewSortEventArgs e)
    {
        ViewState["SortOn"] = e.SortExpression;
        if (ViewState["SortBy"].ToString() == "Asc")
            ViewState["SortBy"] = "Desc";
        else
            ViewState["SortBy"] = "Asc";
        BindCityGv();
    }


    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = (Button)sender;
        GridViewRow gridViewRow = (GridViewRow)btnEdit.NamingContainer;
        ViewState["CityId"] = gridViewRow.Cells[1].Text;
        txtEditCity.Text = gridViewRow.Cells[2].Text;
        ddlEditCityCountry.SelectedIndex = ddlEditCityCountry.Items.IndexOf(ddlEditCityCountry.Items.FindByText(gridViewRow.Cells[4].Text));
        BindStateById(ddlEditCityState, ddlEditCityCountry);
        ddlEditCityState.SelectedIndex = ddlEditCityState.Items.IndexOf(ddlEditCityState.Items.FindByText(gridViewRow.Cells[3].Text));
        chkEditState.Checked = ((CheckBox)gridViewRow.Cells[5].Controls[0]).Checked;
        mpe2.Show();
    }


    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Button btnYes = (Button)sender;
        GridViewRow grv = (GridViewRow)btnYes.NamingContainer;
        ViewState["CityId"] = grv.Cells[1].Text;
        mpe3.Show();
    }


    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
    BindCityGv();
    }


    protected void ddlAddCityCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        BindStateById(ddlAddCityState,(DropDownList)sender);
        ddlAddCityState.Items.Insert(0, new ListItem("Select", "0"));
        mpe1.Show();
    }


    protected void gvCity_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCity.PageIndex = e.NewPageIndex;
        BindCityGv();
    }
   
    protected void ddlEditCityCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        BindStateById(ddlEditCityState, (DropDownList)sender);
        ddlEditCityState.Items.Insert(0, new ListItem("Select", "0"));
        mpe2.Show();
    }
}