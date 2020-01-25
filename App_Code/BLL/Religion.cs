using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using NIT.RemindMe.DBConnection;
using NIT.RemindMe.Common;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
/// <summary>
/// Summary description for Religion
/// </summary>
public class Religion:Utility
{
    #region Private Members
    int _religionId;
    string _religionName;
    bool _isActive;
    #endregion

    #region Public class Constructor
    public Religion()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    #endregion

    #region Class Public Properties
    public int ReligionId
    {
        get { return this._religionId; }
        set { this._religionId = value; }
    }
    public string ReligionName
    {
        get { return this._religionName; }
        set { this._religionName = value; }
    }
    public bool isActive
    {
        get { return this._isActive; }
        set { this._isActive = value; }
    }
    #endregion

    #region Class Public Methods
    public DataSet GetReligion()
    {
        sqlCommandText = "SP_GetReligion";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "SortOn", DbType.String, this.SortOn);
        defaultDb.AddInParameter(dbCommand, "ReligionName", DbType.String, this._religionName);
        defaultDb.AddInParameter(dbCommand, "SortBy", DbType.String, this.SortBy);
        return defaultDb.ExecuteDataSet(dbCommand);
    }

    public int AddReligion()
    {
        sqlCommandText = "SP_AddReligion";
        Database defaultdb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultdb.GetStoredProcCommand(sqlCommandText);
        defaultdb.AddInParameter(dbCommand, "ReligionName", DbType.String, this._religionName);
        defaultdb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this._isActive);
        return defaultdb.ExecuteNonQuery(dbCommand);
    }

    public int UpdateReligion()
    {
        sqlCommandText = "SP_UpdateReligion";
        Database defaultdb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultdb.GetStoredProcCommand(sqlCommandText);
        defaultdb.AddInParameter(dbCommand, "ReligionName", DbType.String, this._religionName);
        defaultdb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this._isActive);
        defaultdb.AddInParameter(dbCommand, "ReligionId", DbType.String, this._religionId);
        return defaultdb.ExecuteNonQuery(dbCommand);
    }

    public int DeleteRelationById()
    {
        sqlCommandText = "SP_DeleteReligionById";
        Database defaultdb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultdb.GetStoredProcCommand(sqlCommandText);
        defaultdb.AddInParameter(dbCommand, "ReligionId", DbType.String, this._religionId);
        return defaultdb.ExecuteNonQuery(dbCommand);
    }
    #endregion
}