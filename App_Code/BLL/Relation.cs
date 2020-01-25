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
/// Summary description for Relation
/// </summary>
public class Relation:Utility
{
    #region Private Members
    int _relationId;
    string _relationName;
    bool _isActive;
    #endregion

    #region Public class Constructor
    public Relation()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    #endregion

    #region Class Public Properties
    public int RelationId
    {
        get { return this._relationId; }
        set { this._relationId = value; }
    }
    public string RelationName
    {
        get { return this._relationName; }
        set { this._relationName = value; }
    }
    public bool isActive
    {
        get { return this._isActive; }
        set { this._isActive = value; }
    }
    #endregion



    #region Class Public Methods

    public DataSet BindRelationship()
    {
        sqlCommandText = "Select * from tblRelation where isActive='true'";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetSqlStringCommand(sqlCommandText);
        return defaultDb.ExecuteDataSet(dbCommand);
    }


    public DataSet GetRelation()
    {
        sqlCommandText = "SP_GetRelation";
        Database defaultDb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
        defaultDb.AddInParameter(dbCommand, "SortOn", DbType.String, this.SortOn);
        defaultDb.AddInParameter(dbCommand, "RelationName", DbType.String, this._relationName);
        defaultDb.AddInParameter(dbCommand, "SortBy", DbType.String, this.SortBy);
        return defaultDb.ExecuteDataSet(dbCommand);
    }

    public int AddRelation()
    {
        sqlCommandText = "SP_AddRelation";
        Database defaultdb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultdb.GetStoredProcCommand(sqlCommandText);
        defaultdb.AddInParameter(dbCommand, "RelationName", DbType.String, this._relationName);
        defaultdb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this._isActive);
        return defaultdb.ExecuteNonQuery(dbCommand);
    }

    public int UpdateRelation()
    {
        sqlCommandText = "SP_UpdateRelation";
        Database defaultdb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultdb.GetStoredProcCommand(sqlCommandText);
        defaultdb.AddInParameter(dbCommand, "RelationName", DbType.String, this._relationName);
        defaultdb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this._isActive);
        defaultdb.AddInParameter(dbCommand, "RelationId", DbType.String, this._relationId);
        return defaultdb.ExecuteNonQuery(dbCommand);
    }

    public int DeleteRelationById()
    {
        sqlCommandText = "SP_DeleteRelationById";
        Database defaultdb = Connection.GetDefaultDBConnection();
        DbCommand dbCommand = defaultdb.GetStoredProcCommand(sqlCommandText);
        defaultdb.AddInParameter(dbCommand, "RelationId", DbType.String, this._relationId);
        return defaultdb.ExecuteNonQuery(dbCommand);
    }
    #endregion
}