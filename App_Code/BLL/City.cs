using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using NIT.RemindMe.Common;
using NIT.RemindMe.DBConnection;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;
/// <summary>
/// Summary description for State
/// </summary>
public class City : Utility
{
    #region Class Private data members
    int _cityId;
    string _cityName;
    bool _isActive;
    int _countryId;
    int _stateId;

    #endregion

    #region Class Constructor
    public City()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    #endregion

    #region Class Public Properties
    public int StateId
    {
        get { return this._stateId; }
        set { this._stateId = value; }
    }
    public string CityName
    {
        get { return this._cityName; }
        set { this._cityName = value; }
    }
    public bool IsActive
    {
        get { return this._isActive; }
        set { this._isActive = value; }
    }
    public int CountryId
    {
        get { return this._countryId; }
        set { this._countryId = value; }
    }

    public int CityId
    {
        get { return this._cityId; }
        set { this._cityId = value; }
    }
    #endregion

    #region Public Member Functions
    public DataSet GetCity()
    {
        sqlCommandText = "SP_GetCity";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "CountryId", DbType.Int32, this._countryId);
        defaultDb.AddInParameter(dbCommand, "StateId", DbType.String, this._stateId);
        defaultDb.AddInParameter(dbCommand, "CityName", DbType.String, this._cityName);
        defaultDb.AddInParameter(dbCommand, "SortOn", DbType.String, this.SortOn);
        defaultDb.AddInParameter(dbCommand, "SortBy", DbType.String, this.SortBy);
        return defaultDb.ExecuteDataSet(dbCommand);
    }

    public int AddCity()
    {
        sqlCommandText = "SP_AddCity";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "CountryId", DbType.String, this._countryId);
        defaultDb.AddInParameter(dbCommand, "StateId", DbType.String, this._stateId);
        defaultDb.AddInParameter(dbCommand, "CityName", DbType.String, this._cityName);
        defaultDb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this._isActive);
        return defaultDb.ExecuteNonQuery(dbCommand);
    }

    public int UpdateCity()
    {
        sqlCommandText = "SP_UpdateCity";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "CityId", DbType.String, this._cityId);
        defaultDb.AddInParameter(dbCommand, "StateId", DbType.String, this._stateId);
        defaultDb.AddInParameter(dbCommand, "CountryId", DbType.String, this._countryId);
        defaultDb.AddInParameter(dbCommand, "CityName", DbType.String, this._cityName);
        defaultDb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this._isActive);
        return defaultDb.ExecuteNonQuery(dbCommand);
    }

    public int DeleteCityById()
    {
        sqlCommandText = "SP_DeleteCityById";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "CityId", DbType.String, this._cityId);
        return defaultDb.ExecuteNonQuery(dbCommand);
    }

    public DataSet BindCity()
    {
        sqlCommandText = "SP_BindCity";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "@StateId", DbType.Int32, this._stateId);
        return defaultDb.ExecuteDataSet(dbCommand);
    }
    #endregion
}