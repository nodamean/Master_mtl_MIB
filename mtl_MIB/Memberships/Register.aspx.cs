using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Web.Security;
using System.Web.Profile;
using System.Data;
using System.Data.Entity;
namespace mtl_MIB.Memberships
{
    public partial class Register : System.Web.UI.Page
    {
       	
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            MembershipCreateStatus result;
            try
            {
                MembershipUser newUser = Membership.CreateUser(
                  txtUserName.Text,
                  txtPassword.Text
                  );
               
                using (var dbContext = new  MTL_ForCDDScanEntities()){
                   
                }

            }
            catch (MembershipCreateUserException ex)
            {
                Response.Write(ex.StatusCode);
            }
            catch (HttpException ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}