using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         string username1 = User.Identity.Name == null ? "" : User.Identity.Name.ToString();
        MembershipUser memberUser1 = Membership.GetUser(username1);

        if (username1 != null)
        {
           // Guid currentUserId = (Guid)memberUser1.ProviderUserKey;
            HiddenField_UserID.Value = username1.ToString();
        }
    }
    
}