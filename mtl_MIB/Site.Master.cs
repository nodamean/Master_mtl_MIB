using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.Security;
using mtl_MIB;
using System.Security.Claims;
using System.Security.Principal;

public partial class SiteMaster : MasterPage
{
    public HyperLink HyperLink_MemberName;

    protected void Page_Init(object sender, EventArgs e)
    {
   
        try
        {
            if (!IsPostBack)
            {
                if (Page.User.Identity.Name != null && Page.User.Identity.Name != "")
                {
                    MembershipUser membershipUser = Membership.GetUser(Page.User.Identity.Name);
                    Guid uid = (Guid)membershipUser.ProviderUserKey;

                    using (var dbContext = new MTL_ForCDDScanEntities())
                    {
                        var up = (from u in dbContext.mtl_UserProfiles
                                  where u.UserID == uid
                                  select u).FirstOrDefault();

                        HyperLink_MemberName = LoginView1.FindControl("HyperLink_MemberName") as HyperLink;

                        HyperLink_MemberName.Text = "ยินดีต้อนรับ คุณ" + up.UserName + "(" + up.Description + ")";
                    }
                }
                else
                {
                    HyperLink_MemberName = LoginView1.FindControl("HyperLink_MemberName") as HyperLink;

                    HyperLink_MemberName.Text = "";
                }
            }
          
           
        }
        catch(Exception EX)
        {
        }

    }

   

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    
    protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}