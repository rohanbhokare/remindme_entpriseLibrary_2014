using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NIT.RemindMe.BLL;
using System.Data;
using AjaxControlToolkit;

public partial class User_AddBirthdays : System.Web.UI.Page
{
    Birthday objBirthday;
    DataTable dt;
    Relation objRelation;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FirstName"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }

        if (!Page.IsPostBack)
        {
            BindDummyGridView();
        }
        
    }
    void BindDummyGridView()
    {
        // Creating virtual Table
        dt = new DataTable("Birthday");
        #region Creating and Adding Columns to Virtual Table
        DataColumn[] dc = new DataColumn[5];
        dc[0] = new DataColumn("FirstName", typeof(string));
        dc[1] = new DataColumn("LastName", typeof(string));
        dc[2] = new DataColumn("DateOfBirth", typeof(string));
        dc[3] = new DataColumn("Relationship", typeof(string));
        dc[4] = new DataColumn("Gender", typeof(string));
        dt.Columns.AddRange(dc);
        #endregion

        #region Creating Row
        DataRow dr1 = dt.NewRow();
        dt.Rows.Add(dr1);

        #endregion

        gvAddBirthdays.DataSource = dt;
        gvAddBirthdays.DataBind();
        Session["dt"] = dt;
    }
    protected void lnkBtn_Click(object sender, EventArgs e)
    {
        User objUser = new User();
        objUser.Logout();
    }
    protected void gvAddBirthdays_RowDataBound(object sender, GridViewRowEventArgs e)
    {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    TextBox txtDateOfBirth = (TextBox)e.Row.FindControl("txtDateOfBirth");

                    CalendarExtender ce = (CalendarExtender)e.Row.FindControl("CE");
                    ce.EndDate = DateTime.Now;
                    DropDownList ddlRelation = (DropDownList)e.Row.FindControl("ddlRelationship");
                    if (ddlRelation != null)
                    {
                        objRelation = new Relation();
                        ddlRelation.DataSource = (objRelation.BindRelationship()).Tables[0];
                        ddlRelation.DataTextField = "RelationName";
                        ddlRelation.DataValueField = "RelationId";
                        ddlRelation.DataBind();
                        ddlRelation.Items.Insert(0, new ListItem("Relationship", "0"));
                    }
                }
    }

    protected void lnkBtnLess_Click(object sender, EventArgs e)
    {
        dt = (DataTable)Session["dt"];
        if (dt.Rows.Count > 1)
        {
            From_GV_TO_DT();
            dt.Rows[dt.Rows.Count - 1].Delete();
            gvAddBirthdays.DataSource = dt;
            gvAddBirthdays.DataBind();
            Session["dt"] = dt;
            From_DT_TO_GV();
        }
    }

    void From_GV_TO_DT()
    {
        if (Session["dt"] != null)
        {
            dt = (DataTable)Session["dt"];
            if (dt.Rows.Count > 0)
            {
                for (int RowCount = 0; RowCount < dt.Rows.Count; RowCount++)
                {
                    TextBox TB_FN_FromGV=(TextBox)gvAddBirthdays.Rows[RowCount].Cells[0].FindControl("txtFirstName");
                    TextBox TB_LN_FromGV = (TextBox)gvAddBirthdays.Rows[RowCount].Cells[1].FindControl("txtLastName");
                    TextBox TB_DOB_FromGV = (TextBox)gvAddBirthdays.Rows[RowCount].Cells[2].FindControl("txtDateOfBirth");
                    DropDownList DDL_R_FromGV = (DropDownList)gvAddBirthdays.Rows[RowCount].Cells[3].FindControl("ddlRelationship");
                    DropDownList DDL_G_FromGV = (DropDownList)gvAddBirthdays.Rows[RowCount].Cells[4].FindControl("ddlGender");

                dt.Rows[RowCount][0] = TB_FN_FromGV.Text;
                dt.Rows[RowCount][1] = TB_LN_FromGV.Text;
                dt.Rows[RowCount][2] = TB_DOB_FromGV.Text;
                dt.Rows[RowCount][3] = DDL_R_FromGV.SelectedItem.Text;
                dt.Rows[RowCount][4] = DDL_G_FromGV.SelectedItem.Text;
                }
                Session["dt"] = dt;
            }
        }
    }

    void From_DT_TO_GV()
    {
        if (Session["dt"] != null)
        {
            dt = (DataTable)Session["dt"];
            if (dt.Rows.Count > 0)
            {
                for (int RowCount = 0; RowCount < dt.Rows.Count; RowCount++)
                {
                    TextBox TB_FN_FromGV = (TextBox)gvAddBirthdays.Rows[RowCount].Cells[0].FindControl("txtFirstName");
                    TextBox TB_LN_FromGV = (TextBox)gvAddBirthdays.Rows[RowCount].Cells[1].FindControl("txtLastName");
                    TextBox TB_DOB_FromGV = (TextBox)gvAddBirthdays.Rows[RowCount].Cells[2].FindControl("txtDateOfBirth");
                    DropDownList DDL_R_FromGV = (DropDownList)gvAddBirthdays.Rows[RowCount].Cells[3].FindControl("ddlRelationship");
                    DropDownList DDL_G_FromGV = (DropDownList)gvAddBirthdays.Rows[RowCount].Cells[4].FindControl("ddlGender");


                    TB_FN_FromGV.Text = dt.Rows[RowCount][0].ToString();
                    TB_LN_FromGV.Text = dt.Rows[RowCount][1].ToString();
                    TB_DOB_FromGV.Text = dt.Rows[RowCount][2].ToString();
                    DDL_R_FromGV.SelectedIndex = DDL_R_FromGV.Items.IndexOf(DDL_R_FromGV.Items.FindByText(dt.Rows[RowCount][3].ToString()));
                    DDL_G_FromGV.SelectedIndex = DDL_G_FromGV.Items.IndexOf(DDL_G_FromGV.Items.FindByText(dt.Rows[RowCount][4].ToString()));
                }
                Session["dt"] = dt;
            }
        }
    }

    protected void lnkBtnMore_Click(object sender, EventArgs e)
    {
        dt = (DataTable)Session["dt"];
        if (dt.Rows.Count < 10)
        {
            From_GV_TO_DT();
            DataRow dataRow = dt.NewRow();
            dt.Rows.Add(dataRow);
            gvAddBirthdays.DataSource = dt;
            gvAddBirthdays.DataBind();
            From_DT_TO_GV();
            Session["dt"] = dt;
        }
    }
    
    protected void btnAddTheseBirthdays_Click(object sender, EventArgs e)
    {
        try
        {
            string strSqlQuery = string.Empty;
            foreach (GridViewRow gvr in gvAddBirthdays.Rows)
            {
                if (gvr.RowType == DataControlRowType.DataRow)
                {
                    TextBox txtFirstName = (TextBox)gvr.FindControl("txtFirstName");
                    TextBox txtLastName = (TextBox)gvr.FindControl("txtLastName");
                    TextBox txtDateOfBirth = (TextBox)gvr.FindControl("txtDateOfBirth");
                    DropDownList ddlRelation = (DropDownList)gvr.FindControl("ddlRelationship");
                    DropDownList ddlGender = (DropDownList)gvr.FindControl("ddlGender");

                    strSqlQuery += "insert into tblBirthdayDetails (userId,FirstName,Lastname,DateOfBirth,RelationshipId,Gender) values("+Session["UserId"].ToString()+",'" + txtFirstName.Text.Trim() + "','" + txtLastName.Text.Trim() + "','" + txtDateOfBirth.Text.Trim() + "'," + ddlRelation.SelectedItem.Value + ",'" + ddlGender.SelectedItem.Value + "');";
                }
            }
            objBirthday = new Birthday();
            int intRowAffected = objBirthday.AddBirthdayDetails(strSqlQuery);
            if (intRowAffected > 0)
            {
                lblStatus.Text = "successfully added!!!";
            }
            else
            {
                lblStatus.Text = "Failed";
            }
            BindDummyGridView();

        }
        catch(Exception ex)
        {
            lblStatus.Text = ex.Message;
        }
    }
   
}