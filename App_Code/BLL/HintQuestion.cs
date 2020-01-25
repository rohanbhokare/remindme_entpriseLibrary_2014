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
/// Summary description for HintQuestion
/// </summary>
public class HintQuestion:Utility
{
    #region Private Members
    int _hintQuestionId;
    string _hintQuestion;
    bool _isActive;
    #endregion

    #region Public class Constructor
    public HintQuestion()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    #endregion

    #region Class Public Properties
    public int HintQuestionId
    {
        get { return this._hintQuestionId; }
        set { this._hintQuestionId = value; }
    }
    public string HintQuestionList
    {
        get { return this._hintQuestion; }
        set { this._hintQuestion = value; }
    }
    public bool isActive
    {
        get { return this._isActive; }
        set { this._isActive = value; }
    }

    #endregion

    #region Class Public Methods
    public DataSet GetHintQuestion()
    {
        sqlCommandText = "SP_GetHintQuestion";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "SortOn", DbType.String, this.SortOn);
        defaultDb.AddInParameter(dbCommand, "HintQuestion", DbType.String, this._hintQuestion);
        defaultDb.AddInParameter(dbCommand, "SortBy", DbType.String, this.SortBy);
        return defaultDb.ExecuteDataSet(dbCommand);
    }

    public int AddHintQuestion()
    {
        sqlCommandText = "SP_AddHintQuestion";
        Database defaultdb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultdb.GetStoredProcCommand(sqlCommandText);
        defaultdb.AddInParameter(dbCommand, "HintQuestion", DbType.String, this._hintQuestion);
        defaultdb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this._isActive);
        return defaultdb.ExecuteNonQuery(dbCommand);
    }

    public int UpdateHintQuestion()
    {
        sqlCommandText = "SP_UpdateHintQuestion";
        Database defaultdb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultdb.GetStoredProcCommand(sqlCommandText);
        defaultdb.AddInParameter(dbCommand, "HintQuestion", DbType.String, this._hintQuestion);
        defaultdb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this._isActive);
        defaultdb.AddInParameter(dbCommand, "HintQuestionId", DbType.String, this._hintQuestionId);
        return defaultdb.ExecuteNonQuery(dbCommand);
    }

    public int DeleteHintQuestionById()
    {
        sqlCommandText = "SP_DeleteHintQuestionById";
        Database defaultdb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultdb.GetStoredProcCommand(sqlCommandText);
        defaultdb.AddInParameter(dbCommand, "HintQuestionId", DbType.String, this._hintQuestionId);
        return defaultdb.ExecuteNonQuery(dbCommand);
    }

    public DataSet BindHintQuestion()
    {
        sqlCommandText = "SP_BindHintQuestion";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        return defaultDb.ExecuteDataSet(dbCommand);
    }
    #endregion
}