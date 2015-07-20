using mtl_MIB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;
    public class WatchListWSLog
    {

        public string Partner { get; set; }
        public string IPAddress { get; set; }
        public string Action { get; set; }
        public string WSName { get; set; }
        public string WSMethod { get; set; }
        public string Detail { get; set; }
        public string RefRow { get; set; }
        public DateTime DateNow { get; set; }

        public WatchListWSLog()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public bool SetWatchListWSLog()
        {
            System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
            using (var dbContext = new MTL_CDDGatewayUatEntities())
            {
                WSLog obj = new WSLog();
                obj.Partner = Partner;
                obj.IPaddress = IPAddress;
                obj.Action = Action;
                //obj.LogDateTime = null;
                obj.LogDateTime = DateNow;
                obj.WSName = WSName;
                obj.WSMethod = WSMethod;
                obj.Detail = Detail.Substring(0, Detail.Length);
                obj.RefRow = RefRow;

                dbContext.WSLog.Add(obj);
                dbContext.SaveChanges();
            }
            return true;
        }
    }
