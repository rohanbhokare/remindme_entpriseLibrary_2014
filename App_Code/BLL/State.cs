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
public class State:Utility
{
    #region Class Private data members
    int _stateId;
    string _stateName;
    bool _isActive;
    int _countryId;
    #endregion

    #region Class Constructor
    public State()
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
    public string StateName
    {
        get { return this._stateName; }
        set { this._stateName = value; }
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

    #endregion

    #region Public Member Functions
    public DataSet GetState()
    {
        sqlCommandText = "SP_GetState";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "CountryId", DbType.Int32, this._countryId);
        defaultDb.AddInParameter(dbCommand, "StateName", DbType.String, this._stateName);
        defaultDb.AddInParameter(dbCommand, "SortOn", DbType.String, this.SortOn);
        defaultDb.AddInParameter(dbCommand, "SortBy", DbType.String, this.SortBy);
        return defaultDb.ExecuteDataSet(dbCommand);
    }

    public DataSet GetStateByCountryId(int countryId)
    {
        sqlCommandText = "Select StateName, StateId from tblState where CountryId=@CountryID order by StateName";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetSqlStringCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "CountryId", DbType.Int32, countryId);
        return defaultDb.ExecuteDataSet(dbCommand);
    }

    public int AddState()
    {
        sqlCommandText = "SP_AddState";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "CountryId", DbType.String, this._countryId);
        defaultDb.AddInParameter(dbCommand, "StateName", DbType.String, this._stateName);
        defaultDb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this._isActive);
        return defaultDb.ExecuteNonQuery(dbCommand);
    }

    public int UpdateState()
    {
        sqlCommandText = "SP_UpdateState";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "StateId", DbType.String, this._stateId);
        defaultDb.AddInParameter(dbCommand, "CountryId", DbType.String, this._countryId);
        defaultDb.AddInParameter(dbCommand, "StateName", DbType.String, this._stateName);
        defaultDb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this._isActive);
        return defaultDb.ExecuteNonQuery(dbCommand);
    }

    public int DeleteStateById()
    {
        sqlCommandText = "SP_DeleteStateById";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "StateId", DbType.String, this._stateId);
        return defaultDb.ExecuteNonQuery(dbCommand);
    }

    public DataSet BindState()
    {
        sqlCommandText = "SP_BindState";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "@CountryId", DbType.Int32, this._countryId);
        return defaultDb.ExecuteDataSet(dbCommand);
    }
    
    #endregion
}