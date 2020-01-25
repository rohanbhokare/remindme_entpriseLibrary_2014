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
/// Summary description for Country
/// </summary>
public class Country:Utility
{
    #region Private Members
    int _countryId;
    string _countryName=null;
    bool _IsActive;
    #endregion

    #region Public class Constructor
    public Country()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    #endregion

    #region Class Public Properties
    public int CountryId
    {
        get { return this._countryId; }
        set { this._countryId = value; }
    }
    public string CountryName
    {
        get { return this._countryName; }
        set { this._countryName = value; }
    }
    public bool IsActive
    {
        get { return this._IsActive; }
        set { this._IsActive = value; }
    }
    #endregion

    #region Class Public Methods
    public DataSet GetCountry()
    {
        sqlCommandText = "SP_GetCountry";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "SortOn", DbType.String, this.SortOn);
        defaultDb.AddInParameter(dbCommand, "CountryName", DbType.String, this._countryName);
        defaultDb.AddInParameter(dbCommand, "SortBy", DbType.String, this.SortBy);
        return defaultDb.ExecuteDataSet(dbCommand);
    }

    public int AddCountry()
    {
        sqlCommandText = "SP_AddCountry";
        Database defaultdb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultdb.GetStoredProcCommand(sqlCommandText);
        defaultdb.AddInParameter(dbCommand, "CountryName", DbType.String, this._countryName);
        defaultdb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this._IsActive);
        return defaultdb.ExecuteNonQuery(dbCommand);
    }

    public int UpdateCountry()
    {
        sqlCommandText = "SP_UpdateCountry";
        Database defaultdb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultdb.GetStoredProcCommand(sqlCommandText);
        defaultdb.AddInParameter(dbCommand, "CountryName", DbType.String, this._countryName);
        defaultdb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this._IsActive);
        defaultdb.AddInParameter(dbCommand, "CountryId", DbType.String, this._countryId);
        return defaultdb.ExecuteNonQuery(dbCommand);
    }

    public int DeleteCountryById()
    {
        sqlCommandText = "SP_DeleteCountryById";
        Database defaultdb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultdb.GetStoredProcCommand(sqlCommandText);
        defaultdb.AddInParameter(dbCommand, "CountryId", DbType.String, this._countryId);
        return defaultdb.ExecuteNonQuery(dbCommand);
    }

    public DataSet BindCountry()
    {
        sqlCommandText = "SP_BindCountry";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        return defaultDb.ExecuteDataSet(dbCommand);
    }
    #endregion

}