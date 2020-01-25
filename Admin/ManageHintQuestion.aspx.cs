using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using NIT.RemindMe.BLL;

public partial class Admin_ManageHintQuestion : System.Web.UI.Page
{
    HintQuestion objHQ = null;
    DataSet dataset = null;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        objHQ = new HintQuestion();
        if (!Page.IsPostBack)
        {
            ViewState["SortOn"] = "HintQuestion";
            ViewState["SortBy"] = "asc";
            BindHintQuestionData();
        }
    }
    void BindHintQuestionData()
    {
        objHQ.HintQuestionList = txtHintQuestionSearch.Text.Trim();
        objHQ.SortOn = ViewState["SortOn"].ToString();
        objHQ.SortBy = ViewState["SortBy"].ToString();
        dataset = objHQ.GetHintQuestion();
        gvHintQuestion.DataSource = dataset.Tables[0];
        gvHintQuestion.DataBind();
    }
    protected void btnSerach_Click(object sender, EventArgs e)
    {
        BindHintQuestionData();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = (Button)sender;
        GridViewRow grv = (GridViewRow)btnEdit.NamingContainer;
        ViewState["HintQuestionId"] = grv.Cells[1].Text;
        txtEditHQ.Text = grv.Cells[2].Text;
        chkEditHQ.Checked = ((CheckBox)grv.Cells[3].Controls[0]).Checked;
        mpe2.Show();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Button btnYes = (Button)sender;
        GridViewRow grv = (GridViewRow)btnYes.NamingContainer;
        ViewState["HintQuestionId"] = grv.Cells[1].Text;
        mpe3.Show();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objHQ.HintQuestionId = Convert.ToInt32(ViewState["HintQuestionId"]);
        objHQ.HintQuestionList = txtEditHQ.Text.Trim();
        objHQ.isActive = chkEditHQ.Checked;
        if (objHQ.UpdateHintQuestion() > 0)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Hint Question Updated Successfully!!!')</script>");
            BindHintQuestionData();
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Hint Question Updation Failed!!!')</script>");
        }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        objHQ.HintQuestionList = txtAddHintQuestion.Text.Trim();
        objHQ.isActive = chkAddIsActive.Checked;
        if (objHQ.AddHintQuestion() > 0)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Hint Question Added Successfully!!!')</script>");
            BindHintQuestionData();
            txtAddHintQuestion.Text = string.Empty;
            chkAddIsActive.Checked = false;
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Hint Question Adding Failed!!!')</script>");
            BindHintQuestionData();
        }
    }
    
    
    protected void btnYes_Click(object sender, EventArgs e)
    {
        objHQ.HintQuestionId = Convert.ToInt32(ViewState["HintQuestionId"]);
        if (objHQ.DeleteHintQuestionById() > 0)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Hint Question Deleted Successfully!!!')</script>");
            BindHintQuestionData();
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script type='text/javascript'> alert('Hint Question Deletion Failed!!!')</script>");
        }
    }
    protected void gvHintQuestion_Sorting(object sender, GridViewSortEventArgs e)
    {
        ViewState["SortOn"] = e.SortExpression;
        if (ViewState["SortBy"].ToString() == "asc")
        {
            ViewState["SortBy"] = "desc";
        }
        else
        {
            ViewState["SortBy"] = "asc";
        }
        BindHintQuestionData();
    }

    protected void gvHintQuestion_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvHintQuestion.PageIndex = e.NewPageIndex;
        BindHintQuestionData();
    }
}