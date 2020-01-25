using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NIT.RemindMe.BLL;
using System.Data;

public partial class Admin_ManageState : System.Web.UI.Page
{
    State objState = new State();
    Country objCountry = new Country();
    DataSet dataset;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["SortOn"]="StateName";
            ViewState["SortBy"] = "Asc";
            BindCountryDdl();
            BindStateGv();
        }
    }

    void BindCountryDdl()
    {
        objCountry.SortOn = "CountryName";
        objCountry.SortBy = "asc";
        dataset = objCountry.GetCountry();
        if (dataset.Tables[0].Rows.Count > 0)
        {
            ddlEditStateCountry.DataSource = ddlAddStateCountry.DataSource = ddlCountry.DataSource = dataset.Tables[0];
            ddlEditStateCountry.DataTextField = ddlAddStateCountry.DataTextField = ddlCountry.DataTextField = "CountryName";
            ddlEditStateCountry.DataValueField = ddlAddStateCountry.DataValueField = ddlCountry.DataValueField = "CountryId";
            ddlCountry.DataBind();
            ddlAddStateCountry.DataBind();
            ddlEditStateCountry.DataBind();
            ddlCountry.Items.Insert(0, new ListItem("Select", "0"));
            ddlAddStateCountry.Items.Insert(0, new ListItem("Select", "0"));

        }
    }
    void BindStateGv()
    {
        objState.CountryId = int.Parse(ddlCountry.SelectedItem.Value);
        objState.StateName = txtStateSearch.Text.Trim();
        objState.SortOn = ViewState["SortOn"].ToString();
        objState.SortBy = ViewState["SortBy"].ToString();
        dataset = objState.GetState();
        gvState.DataSource = dataset.Tables[0];
        gvState.DataBind();
    }
    protected void gvState_Sorting(object sender, GridViewSortEventArgs e)
    {
        //if (ddlCountry.SelectedIndex > 0)
        //{
        //    objState.CountryId = int.Parse(ddlCountry.SelectedItem.Value);
        //}
        ViewState["SortOn"] = e.SortExpression;
        if (ViewState["SortBy"].ToString() == "Asc")
            ViewState["SortBy"] = "Desc";
        else
            ViewState["SortBy"] = "Asc";
        BindStateGv();
    }
    protected void btnSerach_Click(object sender, EventArgs e)
    {
        BindStateGv();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = (Button)sender;
        GridViewRow gridViewRow = (GridViewRow)btnEdit.NamingContainer;
        ViewState["StateId"] = gridViewRow.Cells[1].Text;
        txtEditState.Text = gridViewRow.Cells[2].Text;
        ddlEditStateCountry.SelectedIndex = ddlEditStateCountry.Items.IndexOf(ddlEditStateCountry.Items.FindByText(gridViewRow.Cells[3].Text));
        chkEditState.Checked = ((CheckBox)gridViewRow.Cells[4].Controls[0]).Checked;
        mpe2.Show();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Button btnYes = (Button)sender;
        GridViewRow grv = (GridViewRow)btnYes.NamingContainer;
        ViewState["StateId"] = grv.Cells[1].Text;
        mpe3.Show();
    }
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtStateSearch.Text = string.Empty;
        BindStateGv();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        objState.CountryId = int.Parse(ddlAddStateCountry.SelectedItem.Value);
        objState.StateName = txtAddState.Text.Trim();
        objState.IsActive = chkAddIsActive.Checked;
        objState.AddState();
        BindStateGv();
        txtAddState.Text = string.Empty;
        ddlAddStateCountry.SelectedIndex = 0;
        chkAddIsActive.Checked = false;
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objState.StateId = Convert.ToInt32(ViewState["StateId"]);
        objState.StateName = txtEditState.Text.Trim();
        objState.IsActive = chkEditState.Checked;
        objState.CountryId = int.Parse(ddlEditStateCountry.SelectedItem.Value);
        if (objState.UpdateState() > 0)
        {
           
            lblStatus.Text = "<b style='color:green'> State Data Updated Successfully!!!</b>";
            mpeStatus.Show();
            BindStateGv();
        }
        else
        {
            lblStatus.Text = "<b style='color:red'> State Data Updation Failed!!!</b>";

            //ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Country Details Updation Failed!!!')</script>");
        }


    }
    protected void btnYes_Click(object sender, EventArgs e)
    {
        objState.StateId = Convert.ToInt32(ViewState["StateId"]);
        if (objState.DeleteStateById() > 0)
        {
            //ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Country Details Deleted Successfully!!!')</script>");
            lblStatus.Text = "<b style='color:red'> State Data Deleted Successfully!!!</b>";
            BindStateGv();
            mpeStatus.Show();
        }
        else
        {
            //ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Country Details Deletion Failed!!!')</script>");
            lblStatus.Text = "<b style='color:red'> State Data Deleted Successfully!!!</b>";
            mpeStatus.Show();

        }
    }
    protected void gvState_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvState.PageIndex = e.NewPageIndex;
        BindStateGv();
    }
}