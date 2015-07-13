using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mtl_MIB.Memberships
{
    public partial class Manage : System.Web.UI.Page
    {
        public class LoginUser
        {
            public string username { get; set; }
            public string partnerid { get; set; }
            public string partnerdesc { get; set; }
        }
        public List<LoginUser> LoginUserInformation { get; set; }

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                GridView1.DataSource = getDataTable();
                GridView1.DataBind();

            }
        }
        protected List<LoginUser> GetData()
        {
            //Add Data to Gridview
            List<LoginUser> listobj = new List<LoginUser>();
            using (var dbContext = new MTL_ForCDDScanEntities())
            {
                var user = from m in dbContext.mtl_UserProfiles
                           select m;
                foreach (var item in user)
                {
                    LoginUser obj = new LoginUser();
                    obj.username = item.UserName;
                    obj.partnerid = item.PartnerID;
                    obj.partnerdesc = item.Description;
                    listobj.Add(obj);
                }
            }
            return listobj;
        }
        public DataTable getDataTable()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = new DataTable();
                dt.Columns.Add("i", typeof(int));
                dt.Columns.Add("username", typeof(string));
                dt.Columns.Add("partnerid", typeof(string));
                dt.Columns.Add("partnerdesc", typeof(string));

                List<LoginUser> listobj = new List<LoginUser>();
                int i = 1;
                using (var dbContext = new MTL_ForCDDScanEntities())
                {
                    var user = from m in dbContext.mtl_UserProfiles
                               select m;
                    foreach (var item in user)
                    {
                        LoginUser obj = new LoginUser();
                        if (item.Description.Contains(':'))
                        {
                            string [] desc= item.Description.Split(':');
                            dt.Rows.Add(i, item.UserName, desc[1], desc[0]);

                        }
                        else
                        {
                            dt.Rows.Add(i, item.UserName, item.Description, item.PartnerID);

                        }
                        i = i + 1;
                    }
                }
            }
            catch { throw; }
            return dt;
        }
        protected void GridView1_PreRender(object sender, EventArgs e)
        {
            // You only need the following 2 lines of code if you are not 
            // using an ObjectDataSource of SqlDataSource
            //GridView1.DataSource = getDataTable();
           // GridView1.DataBind();

            //if (GridView1.Rows.Count > 0)
            //{
            //    //This replaces <td> with <th> and adds the scope attribute
            //    GridView1.UseAccessibleHeader = true;

            //    //This will add the <thead> and <tbody> elements
            //    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

            //    //This adds the <tfoot> element. 
            //    //Remove if you don't have a footer row
            //    GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
            //}

        }
    }
}