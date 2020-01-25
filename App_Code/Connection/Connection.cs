using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using Microsoft.Practices.EnterpriseLibrary.Data;

using System.Configuration;

namespace NIT.RemindMe.DBConnection
{
    /// <summary>
    /// Summary description for Connection
    /// </summary>
    public sealed class Connection
    {
        public Connection()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static Database GetDefaultDBConnection()
        {
            //Configure DatabaseFactory to read configuration from web.config file
            DatabaseProviderFactory factory = new DatabaseProviderFactory();
            //Create default Database object from the factory.
            // Actual concerete type is determenend by configuration Setting

            Database defaultDB = factory.CreateDefault();
            return defaultDB;
        }
       
    }
}