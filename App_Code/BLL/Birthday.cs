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
/// This is BLL for interacting with tblBirthdaydetails table
/// </summary>
namespace NIT.RemindMe.BLL
{
    public class Birthday : Utility
    {
        #region class Private Members
        int _birthdayDetailsId;
        int _userId;
        string _firstname;
        string _middleName;
        string _lastName;
        string _nickName;
        string _gender;
        string _dateOfBirth;
        string _anniversaryDate;
        string _addressLine;
        int _countryId;
        int _stateId;
        int _cityId;
        string _pincode;
        string _mobileNo;
        string _emailId;
        int _relationship;
        string _notes;
        #endregion

        #region Class Constructor
        public Birthday()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion

        #region class Public Properties
        public int BirthdayDetailsId
        {
            get { return this._birthdayDetailsId; }
            set { this._birthdayDetailsId = value; }
        }
        public int UserId
        {
            get { return this._userId; }
            set { this._userId = value; }
        }
        public string Firstname
        {
            get { return this._firstname; }
            set { this._firstname = value; }
        }
        public string MiddleName
        {
            get { return this._middleName; }
            set { this._middleName = value; }
        }
        public string LastName
        {
            get { return this._lastName; }
            set { this._lastName = value; }
        }
        public string NickName
        {
            get { return this._nickName; }
            set { this._nickName = value; }
        }
        public string Gender
        {
            get { return this._gender; }
            set { this._gender = value; }
        }
        public string DateOfBirth
        {
            get { return this._dateOfBirth; }
            set { this._dateOfBirth = value; }
        }
        public string AnniversaryDate
        {
            get { return this._anniversaryDate; }
            set { this._anniversaryDate = value; }
        }
        public string AddressLine
        {
            get { return this._addressLine; }
            set { this._addressLine = value; }
        }
        public int CountryId
        {
            get { return this._countryId; }
            set { this._countryId = value; }
        }
        public int StateId
        {
            get { return this._stateId; }
            set { this._stateId = value; }
        }
        public int CityId
        {
            get { return this._cityId; }
            set { this._cityId = value; }
        }
        public string Pincode
        {
            get { return this._pincode; }
            set { this._pincode = value; }
        }
        public string MobileNo
        {
            get { return this._mobileNo; }
            set { this._mobileNo = value; }
        }
        public string EmailId
        {
            get { return this._emailId; }
            set { this._emailId = value; }
        }
        public int Relationship
        {
            get { return this._relationship; }
            set { this._relationship = value; }
        }
        public string Notes
        {
            get { return this._notes; }
            set { this._notes = value; }
        }
        #endregion

        #region Public Methods

        public int AddBirthdayDetails(string str)
        {
            sqlCommandText = str;
            Database defaultDb = Connection.GetDefaultDBConnection();
            DbCommand dbCommand = defaultDb.GetSqlStringCommand(sqlCommandText);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        public DataSet GetBirthdays(string UserId)
        {
            sqlCommandText = "SP_GetBirthdays";
            Database defaultDb = Connection.GetDefaultDBConnection();
            DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
            defaultDb.AddInParameter(dbCommand, "@UserId", DbType.String, UserId);
            return defaultDb.ExecuteDataSet(dbCommand);
        }
        #endregion
    }
}