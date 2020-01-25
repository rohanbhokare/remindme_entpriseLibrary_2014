using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using NIT.RemindMe.BLL;

public partial class Admin_ManageReligion : System.Web.UI.Page
{
    Religion objReligion = null;
    DataSet dataset = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        objReligion = new Religion();
        if (!Page.IsPostBack)
        {
            ViewState["SortOn"] = "ReligionName";
            ViewState["SortBy"] = "asc";
            BindReligionData();
        }

    }
    void BindReligionData()
    {
        objReligion.ReligionName = txtReligionSearch.Text.Trim();
        objReligion.SortOn = ViewState["SortOn"].ToString();
        objReligion.SortBy = ViewState["SortBy"].ToString();
        dataset = objReligion.GetReligion();
        gvReligion.DataSource = dataset.Tables[0];
        gvReligion.DataBind();
    }
    protected void btnSerach_Click(object sender, EventArgs e)
    {
        BindReligionData();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = (Button)sender;
        GridViewRow grv = (GridViewRow)btnEdit.NamingContainer;
        ViewState["ReligionId"] = grv.Cells[1].Text;
        txtEditReligion.Text = grv.Cells[2].Text;
        chkEditReligion.Checked = ((CheckBox)grv.Cells[3].Controls[0]).Checked;
        mpe2.Show();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Button btnYes = (Button)sender;
        GridViewRow grv = (GridViewRow)btnYes.NamingContainer;
        ViewState["ReligionId"] = grv.Cells[1].Text;
        mpe3.Show();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        objReligion.ReligionName = txtAddReligion.Text.Trim();
        objReligion.isActive = chkAddIsActive.Checked;
        if (objReligion.AddReligion() > 0)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Religion Details Added Successfully!!!')</script>");
            BindReligionData();
            txtAddReligion.Text = string.Empty;
            chkAddIsActive.Checked = false;
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Religion Details Adding Failed!!!')</script>");
            BindReligionData();
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objReligion.ReligionId = Convert.ToInt32(ViewState["ReligionId"]);
        objReligion.ReligionName = txtEditReligion.Text.Trim();
        objReligion.isActive = chkEditReligion.Checked;
        if (objReligion.UpdateReligion() > 0)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Religion Details Updated Successfully!!!')</script>");
            BindReligionData();
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Religion Details Updation Failed!!!')</script>");
        }
    }
    protected void btnYes_Click(object sender, EventArgs e)
    {
        objReligion.ReligionId = Convert.ToInt32(ViewState["ReligionId"]);
        if (objReligion.DeleteRelationById() > 0)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Religion Details Deleted Successfully!!!')</script>");
            BindReligionData();
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Country Details Deletion Failed!!!')</script>");
        }
    }
    protected void gvReligion_Sorting(object sender, GridViewSortEventArgs e)
    {
        ViewState["SortOn"] = e.SortExpression;
        if (ViewState["SortBy"].ToString() == "Asc")
        {
            ViewState["SortBy"] = "Desc";
        }
        else
        {
            ViewState["SortBy"] = "Asc";
        }
        BindReligionData();
    }
    protected void gvReligion_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvReligion.PageIndex = e.NewPageIndex;
    }
}