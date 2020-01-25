using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using NIT.RemindMe.BLL;

public partial class Admin_ManageRelation : System.Web.UI.Page
{
    Relation objRelation = null;
    DataSet dataset = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        objRelation = new Relation();
        if (!Page.IsPostBack)
        {
            ViewState["SortOn"] = "RelationName";
            ViewState["SortBy"] = "asc";
            BindRelationData();
        }

    }
    void BindRelationData()
    {
        objRelation.RelationName = txtrRelationSearch.Text.Trim();
        objRelation.SortOn = ViewState["SortOn"].ToString();
        objRelation.SortBy = ViewState["SortBy"].ToString();
        dataset = objRelation.GetRelation();
        gvRelation.DataSource = dataset.Tables[0];
        gvRelation.DataBind();
    }
    protected void btnSerach_Click(object sender, EventArgs e)
    {
        BindRelationData();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = (Button)sender;
        GridViewRow grv = (GridViewRow)btnEdit.NamingContainer;
        ViewState["RelationId"] = grv.Cells[1].Text;
        txtEditRelation.Text = grv.Cells[2].Text;
        chkEditRelation.Checked = ((CheckBox)grv.Cells[3].Controls[0]).Checked;
        mpe2.Show();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Button btnYes = (Button)sender;
        GridViewRow grv = (GridViewRow)btnYes.NamingContainer;
        ViewState["RelationId"] = grv.Cells[1].Text;
        mpe3.Show();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        objRelation.RelationName = txtAddRelation.Text.Trim();
        objRelation.isActive = chkAddIsActive.Checked;
        if (objRelation.AddRelation() > 0)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Country Details Added Successfully!!!')</script>");
            BindRelationData();
            txtAddRelation.Text = string.Empty;
            chkAddIsActive.Checked = false;
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Country Details Adding Failed!!!')</script>");
            BindRelationData();
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objRelation.RelationId = Convert.ToInt32(ViewState["RelationId"]);
        objRelation.RelationName = txtEditRelation.Text.Trim();
        objRelation.isActive = chkEditRelation.Checked;
        if (objRelation.UpdateRelation() > 0)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Relation Details Updated Successfully!!!')</script>");
            BindRelationData();
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Relation Details Updation Failed!!!')</script>");
        }
    }
    protected void btnYes_Click(object sender, EventArgs e)
    {
        objRelation.RelationId = Convert.ToInt32(ViewState["RelationId"]);
        if (objRelation.DeleteRelationById() > 0)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Relation Details Deleted Successfully!!!')</script>");
            BindRelationData();
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Relation Details Deletion Failed!!!')</script>");
        }
    }
    protected void gvRelation_Sorting(object sender, GridViewSortEventArgs e)
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

        BindRelationData();
    }
    protected void gvRelation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvRelation.PageIndex = e.NewPageIndex;
        BindRelationData();
    }
}