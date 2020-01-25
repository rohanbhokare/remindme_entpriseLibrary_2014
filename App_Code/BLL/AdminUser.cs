using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using NIT.RemindMe.Common;
using NIT.RemindMe.DBConnection;


/// <summary>
/// Summary description for UsersData
/// </summary>

namespace NIT.RemindMe.BLL
{
public class AdminUser:Utility
{
    #region Class Private Fields
    string _userName;
    string _password;
    string _createdDate;
    DateTime _lastAccessedDateTime;
    #endregion

    #region Class Public Properties
    public string UserName
    {
        get { return this._userName; }
        set { this._userName = value; }
    }
    public string Password
    {
        get { return this._password; }
        set { this._password = value; }
    }
    public string CreatedDate
    {
        get { return this._createdDate; }
        set { this._createdDate = value; }
    }
    public DateTime LastAccessedDateTime
    {
        get { return this._lastAccessedDateTime; }
        set { this._lastAccessedDateTime = value; }
    }
    
    #endregion

    #region Class Constructor
    public AdminUser()
	{
    }
    #endregion

    #region Public Methods
    public DataSet CheckAdminLogin()
    {
        Database defaultDb = Connection.GetDefaultDBConnection();
        sqlCommandText = "select * from tblAdminAccount where UserName=@userName and Password=@password";
        DbCommand dbCommand = defaultDb.GetSqlStringCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "userName", DbType.String, this._userName);
        defaultDb.AddInParameter(dbCommand, "password", DbType.String, this._password);
        return defaultDb.ExecuteDataSet(dbCommand);
    }

    public int UpdateAdminLastAccessedDateTime(string username, DateTime LastAccessedDateTime)
    {
        sqlCommandText="update tblAdminAccount set LastAccessedDateTime='"+LastAccessedDateTime.ToString("MM-dd-yyyy hh:mm:ss tt")+"' where UserName='"+username+"'";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetSqlStringCommand(sqlCommandText);
        return defaultDb.ExecuteNonQuery(dbCommand);
    }

    public int CheckOldPassword(string UserName, string Password)
    {
        sqlCommandText = "select count(*) from tblAdminAccount where UserName='"+UserName+"'and password='"+Password+"'";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetSqlStringCommand(sqlCommandText);
        return Convert.ToInt32(defaultDb.ExecuteScalar(dbCommand));
    }

    public int ChangeAdminPassword(string userName, string oldPassword, string NewPassword)
    {
        Database defaultDb = Connection.GetDefaultDBConnection();
        sqlCommandText = "update tblAdminAccount set Password='"+NewPassword+"' where UserName='"+userName+"' and Password='"+oldPassword+"'";
        DbCommand dbCommand = defaultDb.GetSqlStringCommand(sqlCommandText);
        return defaultDb.ExecuteNonQuery(dbCommand);
    }
    #endregion
}
}