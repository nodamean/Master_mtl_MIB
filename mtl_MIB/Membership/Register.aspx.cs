using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
namespace mtl_MIB.Membership
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            MembershipCreateStatus result;
            try
            {
                // Create new user.
                if (Membership.RequiresQuestionAndAnswer)
                {
                    MembershipUser newUser = Membership.CreateUser(
                      txtUserName.Text,
                      txtPassword.Text,
                      "",
                      "",
                     "",
                      false,
                      out result);
                }
                else
                {
                    MembershipUser newUser = Membership.CreateUser(
                      txtUserName.Text,
                      txtPassword.Text
                      );
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