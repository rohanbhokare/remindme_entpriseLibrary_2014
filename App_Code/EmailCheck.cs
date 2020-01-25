using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using NIT.RemindMe.DBConnection;
using System.Data;
/// <summary>
/// Summary description for EmailCheck
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class EmailCheck : System.Web.Services.WebService {

    public EmailCheck () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public int CheckEmailAvalibility(string email) {
        string SqlCommandText = "select count(*) from tblUserAccountDetails where EmailId=@EmailId";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetSqlStringCommand(SqlCommandText);
        defaultDb.AddInParameter(dbCommand, "@EmailId", DbType.String, email);
        return Convert.ToInt32(defaultDb.ExecuteScalar(dbCommand));
    }

    [WebMethod]
    public string GetHintQuestion(string email)
    {
        Database defaultDb = Connection.GetDefaultDBConnection();
        string SqlCommandText = "Select h.HintQuestion from tblUserAccountDetails a, tblHintQuestion h where h.HintQuestionId = a.HintQuestionId and a.EmailId='" + email+"'";
        DbCommand dbCommand = defaultDb.GetSqlStringCommand(SqlCommandText);
        IDataReader dr = defaultDb.ExecuteReader(dbCommand);
        string HintQuestion = string.Empty;
        if (dr.Read())
        {
            if (!string.IsNullOrEmpty(dr["HintQuestion"].ToString()))
                HintQuestion = dr["HintQuestion"].ToString();
        }
        else
        {
            if (dr != null)
            {
                if (!dr.IsClosed)
                    dr.Close();
            }
            SqlCommandText = "Select NewHintQuestion from tblUserAccountDetails where EmailId='" + email + "'";
            defaultDb = Connection.GetDefaultDBConnection();
            dbCommand = defaultDb.GetSqlStringCommand(SqlCommandText);
            dr = defaultDb.ExecuteReader(dbCommand);
            if (dr.Read())
            {
                if (!string.IsNullOrEmpty(dr["NewHintQuestion"].ToString()))
                    HintQuestion = dr["NewHintQuestion"].ToString();
            }
            if (dr != null)
            {
                if (!dr.IsClosed)
                    dr.Close();
            }
        }
        return HintQuestion;
    }
    
}
