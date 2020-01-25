using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    
    #region Class Public ReadOnly Properties
    public string EmailId
    {
        get { return this.txtHomeEmail.Text.Trim(); }
    }
    public string Password
    {
        get { return this.txtHomePassword.Text.Trim(); }
    }
    public string PasswordAgain
    {
        get { return this.txtPasswordAgain.Text.Trim(); }
    }
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}