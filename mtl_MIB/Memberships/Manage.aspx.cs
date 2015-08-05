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
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
                int i = 0;

                using (var dbContext = new MTL_ForCDDScanEntities())
                {
                    var user = from m in dbContext.mtl_UserProfiles
                               where  !m.UserName.ToLower().Contains("admin")
                               select m;
                    foreach (var item in user)
                    {

                        TableRow tr = new TableRow();
                        tr.TableSection = TableRowSection.TableBody;
                        TableCell tcView = new TableCell();
                        TableCell tcNo = new TableCell();
                        TableCell tcUsername = new TableCell();
                        TableCell tcPartnerID = new TableCell();
                        TableCell tcPartnerDesc = new TableCell();
                        i = i + 1;
                        string UserName = item.UserName == null ? "" : item.UserName.ToString();
                        tcNo.Text = i.ToString();
                        string PartnerID = "", PartnerDesc = "";
                        if (item.Description.Contains(":"))
                        {
                            string[] part = item.Description.Split(':');
                            PartnerDesc = part[1] == null ? "" : part[1].ToString();
                            PartnerID =part[0] == null ? "" : part[0].ToString();

                        }
                        else
                        {
                            PartnerDesc = item.Description == null ? "" : item.Description.ToString();
                            PartnerID = item.PartnerID == null ? "" : item.PartnerID.ToString();

                        }
                        

                        tcView.Text = "<button type='button' class='btn btn-primary btn-sm' value='" + UserName + "'  data-toggle='modal'  data-target='#mdChangePassword'  onclick='GetProfileByID(\"" + UserName + "\");'><span class='glyphicon glyphicon-edit'></span></button>";
                        tcUsername.Text = UserName;
                        tcPartnerID.Text = PartnerID;
                        tcPartnerDesc.Text = PartnerDesc;
                        tr.Cells.Add(tcView);
                        tr.Cells.Add(tcNo);
                        tr.Cells.Add(tcUsername);
                        tr.Cells.Add(tcPartnerID);
                        tr.Cells.Add(tcPartnerDesc);
                        TableShowReport.Rows.Add(tr);
                    }

                }
            }
        
    }
}