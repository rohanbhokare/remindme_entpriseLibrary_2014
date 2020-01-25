
#region NameSapaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using System.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using NIT.RemindMe.Common;
using NIT.RemindMe.DBConnection;
#endregion

namespace NIT.RemindMe.BLL
{
    /// <summary>
    /// This Class is used to perform any action related to User for exchange data with database
    /// </summary>
    public class User : Utility
    {
        #region Private Members
        string _hintQuestionId;
        string _newHintQuestion;
        string _hintQuestionAnswer;
        int _userId;
        string _emailId;
        string _password;
        string _dateOfAnniversary;
        DateTime _dateOfRegistration;
        bool _isApproved;
        bool _isCancled;
        string _firstName;
        string _middleName;
        string _lastName;
        string _dateOfBirth;
        string _gender;
        bool _isAgeSecret;
        string _mobileNo;
        string _nickName;
        int _countryId;
        int _stateId;
        int _cityId;
        string _addressLine;
        string _pincode;
        string _userPhoto;
        #endregion

        #region public Properties

        
        public string DateOfAnniversary
        {
            get { return this._dateOfAnniversary; }
            set { this._dateOfAnniversary = value; }
        }
        public string UserPhoto
        {
            get { return this._userPhoto; }
            set { this._userPhoto = value;}
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
        public string AddressLine
        {
            get { return this._addressLine; }
            set { this._addressLine = value; }
        }
        public string Pincode
        {
            get { return this._pincode; }
            set { this._pincode = value; }
        }
        public string HintQuestionId
        {
            get { return this._hintQuestionId; }
            set { this._hintQuestionId = value; }
        }
        public string NewHintQuestion
        {
            get { return this._newHintQuestion; }
            set { this._newHintQuestion = value; }
        }
        
        public string NickName
        {
            get { return this._nickName; }
            set { this._nickName = value; }
        }

        public int UserId
        {
            get{return this._userId;}
            set{this._userId =value;}
        }

        public string EmailId
        {
            get { return this._emailId; }
            set { this._emailId = value; }
        }
        public string Password
        {
            get { return this._password; }
            set { this._password = value; }
        }
        public DateTime DateOfRegistration
        {
            get { return this._dateOfRegistration; }
            set { this._dateOfRegistration = value; }
        }
        public bool IsApproved
        {
            get { return this._isApproved; }
            set { this._isApproved = value; }
        }
        public bool IsCancel
        {
            get { return this._isCancled; }
            set { this._isCancled = value; }
        }
        public string FirstName
        {
            get { return this._firstName; }
            set { this._firstName = value; }
        }
        public string MiddelName
        {
            get { return this._middleName; }
            set { this._middleName = value; }
        }
        public string LastName
        {
            get { return this._lastName; }
            set { this._lastName = value; }
        }
        public string DateOfBirth
        {
            get { return this._dateOfBirth; }
            set { this._dateOfBirth = value; }
        }
        public string Gender
        {
            get { return this._gender; }
            set { this._gender = value; }
        }
        public bool IsAgeSecret
        {
            get { return this._isAgeSecret; }
            set { this._isAgeSecret = value; }
        }
        public string MobileNo
        {
            get { return this._mobileNo; }
            set { this._mobileNo = value; }
        }
        public string HintQuestionAnswer
        {
            get { return this._hintQuestionAnswer; }
            set { this._hintQuestionAnswer = value; }
        }

        #endregion

        #region Public User Constructor
        public User()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #endregion

        #region public Function
        public int UpdateUserProfile()
        {
            sqlCommandText = "SP_UpdateUserProfile";
            Database defaultDb = Connection.GetDefaultDBConnection();
            DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
            defaultDb.AddInParameter(dbCommand, "@UserId", DbType.Int32, this._userId);
            defaultDb.AddInParameter(dbCommand, "@NewPassword", DbType.String, this._password);
            defaultDb.AddInParameter(dbCommand, "@HintQuestionId", DbType.Int32, this._hintQuestionId);
            defaultDb.AddInParameter(dbCommand, "@NewHintQuestion", DbType.String, this._newHintQuestion);
            defaultDb.AddInParameter(dbCommand, "@HintQuestionAnswer", DbType.String, this._hintQuestionAnswer);
            defaultDb.AddInParameter(dbCommand, "@FirstName", DbType.String, this._firstName);
            defaultDb.AddInParameter(dbCommand, "@MiddleName", DbType.String, this._middleName);
            defaultDb.AddInParameter(dbCommand, "@LastName", DbType.String, this._lastName);
            defaultDb.AddInParameter(dbCommand, "@NickName", DbType.String, this._nickName);
            defaultDb.AddInParameter(dbCommand, "@Gender", DbType.String, this._gender);
            defaultDb.AddInParameter(dbCommand, "@IsAgeSecret", DbType.Boolean, this._isAgeSecret);
            defaultDb.AddInParameter(dbCommand, "@DateOfBirth", DbType.String, this._dateOfBirth);
            defaultDb.AddInParameter(dbCommand, "@AnniversaryDate", DbType.String, this._dateOfAnniversary);
            defaultDb.AddInParameter(dbCommand, "@MobileNumber", DbType.String, this._mobileNo);
            defaultDb.AddInParameter(dbCommand, "@UserPhoto", DbType.String, this._userPhoto);
            defaultDb.AddInParameter(dbCommand, "@AddressLine", DbType.String, this._addressLine);
            defaultDb.AddInParameter(dbCommand, "@CountryId", DbType.Int32, this._countryId);
            defaultDb.AddInParameter(dbCommand, "@StateId", DbType.Int32, this._stateId);
            defaultDb.AddInParameter(dbCommand, "@CityId", DbType.Int32, this._cityId);
            defaultDb.AddInParameter(dbCommand, "@Pincode", DbType.String, this._pincode);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        public void SendActivationMail()
        {
            string message = string.Empty;
            message = "<table width='100%' style='box-shadow:#c3325f 4px 4px 4px;border:2px solid #c3325f'>";
            message += "<tr><td><img src='https://lh3.googleusercontent.com/8Do8agv21Nfa9qJXo8sEyoFEYDvd20rpp6iwuVm9Gg=w638-h88-no' width='100%' alt='image'/></td></tr>";
            message += "<tr><td>Dear " + this._firstName + ",</td></tr>";
            message += "<tr><td>&nbsp;</td></tr><tr><td>Thankyou for Registration.</td></tr>";
            message += "<tr><td><p> Our Team Welcome You To RemindMe.com. Here you can save Your Dear and Near ones Special Days. We will send notification before event via Emails. And also You will get many more facilities on this site... Just login and see :) </p></td></tr>";
            message += "<tr><td>Please click following link for activation.</td></tr>";
            message += "<tr><td><a href='" + ConfigurationManager.AppSettings["InternetUrl"].ToString() + "UserActivation.aspx?eml=" + GetEncryptedData(this._emailId, "sunny") + "'>Click Here For Activate Your Account</a></td></tr>";
            message += "<tr><td> &nbsp;</td></tr>";
            message += "<tr style='background-color:#c3325f;color:#ffc90e'><td>With Best Regards</td></tr>";
            message += "<tr style='background-color:#c3325f;color:#ffc90e'><td>Team RemindMe.com</td></tr>";

            message += "</table>";
            SendMail(this._emailId, "RemindMe Activation Mail", message);

        }

        public void SendPasswordMail()
        {
            string message = string.Empty;
            message = "<table width='100%' style='box-shadow:#c3325f 4px 4px 4px;border:2px solid #c3325f'>";
            message += "<tr><td><img src='https://lh3.googleusercontent.com/8Do8agv21Nfa9qJXo8sEyoFEYDvd20rpp6iwuVm9Gg=w638-h88-no' width='100%' alt='image'/></td></tr>";
            message += "<tr><td>Dear Member,</td></tr>";
            message += "<tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>";
            message += "<tr><td><p> As you Forget Your Password,we had sent your password via email. folowing is your password </p></td></tr>";
            message += "<tr><td> password:"+this.Password +" </td></tr>";
            
            message += "<tr><td> &nbsp;</td></tr>";
            message += "<tr style='background-color:#ffc90e;color:#c3325f'><td>With Best Regards</td></tr>";
            message += "<tr style='background-color:#ffc90e;color:#c3325f'><td>Team RemindMe.com</td></tr>";

            message += "</table>";
            SendMail(this._emailId, "RemindMe Password Mail", message);
        }

        public void Logout()
        {
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Session.Remove("UserId");
            HttpContext.Current.Session.Remove("FirstName");
            HttpContext.Current.Session.Remove("EmailId");
            HttpContext.Current.Response.Redirect("~/Default.aspx");
        }

        public int UserRegistration()
        {
            sqlCommandText = "SP_UserRegistration";
            Database defaultDb = Connection.GetDefaultDBConnection();
            DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
            defaultDb.AddInParameter(dbCommand, "@Email", DbType.String, _emailId);
            defaultDb.AddInParameter(dbCommand, "@Password", DbType.String, _password);
            defaultDb.AddInParameter(dbCommand, "@DateOfRegistration", DbType.DateTime, _dateOfRegistration);
            defaultDb.AddInParameter(dbCommand, "@IsApproved", DbType.Boolean, _isApproved);
            defaultDb.AddInParameter(dbCommand, "@IsCanclled", DbType.Boolean, _isApproved);

            defaultDb.AddInParameter(dbCommand, "@FirstName", DbType.String, _firstName);
            defaultDb.AddInParameter(dbCommand, "@MiddleName", DbType.String, _middleName);
            defaultDb.AddInParameter(dbCommand, "@LastName", DbType.String, _lastName);
            defaultDb.AddInParameter(dbCommand, "@DateOfBirth", DbType.String, _dateOfBirth);
            defaultDb.AddInParameter(dbCommand, "@Gender", DbType.String, _gender);
            defaultDb.AddInParameter(dbCommand, "@MobileNo", DbType.String, _mobileNo);
            defaultDb.AddInParameter(dbCommand, "@IsAgeSecret", DbType.Boolean, _isAgeSecret);

            return defaultDb.ExecuteNonQuery(dbCommand);


        }


        public int ActivateAccount()
        {
            Database defaultDb = Connection.GetDefaultDBConnection();
            sqlCommandText = "Update tblUserAccountDetails set IsApproved='true' where EmailId=@EmailId";
            DbCommand dbCommand = defaultDb.GetSqlStringCommand(sqlCommandText);
            defaultDb.AddInParameter(dbCommand, "@EmailId", DbType.String, this._emailId);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }

        public DataSet CheckUserLogin()
        {
            sqlCommandText = "SP_CheckUserLogin";
            Database defaultDb = Connection.GetDefaultDBConnection();
            DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
            defaultDb.AddInParameter(dbCommand,"@EmailId", DbType.String, this.EmailId);
            defaultDb.AddInParameter(dbCommand, "@Password", DbType.String, this.Password);
            return defaultDb.ExecuteDataSet(dbCommand);
        }

        public int CheckUserAccountStatus(int status)
        {
            sqlCommandText = "SP_CheckUserAccountStatus";
            Database defaultDb = Connection.GetDefaultDBConnection();
            DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
            defaultDb.AddInParameter(dbCommand, "@EmailId", DbType.String, this.EmailId);
            defaultDb.AddInParameter(dbCommand, "@Status", DbType.Int32, status);
            return Convert.ToInt32(defaultDb.ExecuteScalar(dbCommand));
        }

        public int UpdateUserLastAccessedDateTime(DateTime LastAccessedDateTime)
        {
            sqlCommandText = "update tblUserAccountDetails set LastAccessedDateTime='" + LastAccessedDateTime.ToString("MM-dd-yyyy hh:mm:ss tt") + "' where EmailId='" + this.EmailId + "'";
            Database defaultDb = Connection.GetDefaultDBConnection();
            DbCommand dbCommand = defaultDb.GetSqlStringCommand(sqlCommandText);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        public IDataReader GetForgetPassword()
        {
            if (this._hintQuestionAnswer == "")
                sqlCommandText = "select password from tblUserAccountDetails where EmailId='"+this._emailId+"'";
            else
                sqlCommandText="select password from tblUserAccountDetails where  EmailId='"+this._emailId+"' and HintQuestionAnswer='"+this._hintQuestionAnswer+"'";
            Database defaultDb = Connection.GetDefaultDBConnection();
            DbCommand dbCommand = defaultDb.GetSqlStringCommand(sqlCommandText);
            return defaultDb.ExecuteReader(dbCommand);
        }

        public DataSet GetUserDetails()
        {
            sqlCommandText = "SP_GetUserDetails";
            Database defaultDb = Connection.GetDefaultDBConnection();
            DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommandText);
            defaultDb.AddInParameter(dbCommand, "@UserId", DbType.Int32, this.UserId);
            return defaultDb.ExecuteDataSet(dbCommand);
        }

        #endregion
    }
}