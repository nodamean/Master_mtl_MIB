using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mtl_MIB.Memberships
{ 
    
    public partial class Login : System.Web.UI.Page
    {
        public TextBox UserName;
        public TextBox Password;
        public CheckBox RememberMe;
        public Literal FailureText;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserName = Login_MIB.FindControl("UserName") as TextBox;
            Password = Login_MIB.FindControl("Password") as TextBox;
            RememberMe = Login_MIB.FindControl("RememberMe") as CheckBox;
            FailureText = Login_MIB.FindControl("FailureText") as Literal;
          
            if (!Page.IsPostBack)
            {
                //if (Request.IsAuthenticated && (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"])))
                //{
                //    Response.Redirect("~/UnauthorizedAccess.aspx");
                //}
                MembershipUser u = Membership.GetUser("nodamean");
                if (Membership.ValidateUser("nodamean", "220349"))
                {
                    
                }
            }
        }
        protected void Login_MIB_Authenticate(object sender, AuthenticateEventArgs e)
        {
            Login_MIB.FailureText = "";

            MembershipUser userInfo = Membership.GetUser(Login_MIB.UserName);

            if (userInfo == null)
            {
                e.Authenticated = false;
                Login_MIB.FailureText = "ไม่พบบัญชีผู้ใช้งานนี้, กรุณาตรวจสอบแล้วลองอีกครั้ง";
            }
            else if (!userInfo.IsApproved)
            {
                e.Authenticated = false;
                Login_MIB.FailureText = "บัญชีผู้ใช้ของท่านยังไม่ได้รับการยืนยัน, ท่านจะยังไม่สามารถเข้าสู่ระบบได้ จนกว่าจะทำการยืนยันเรียบร้อยแล้ว";
            }
            else if (userInfo.IsLockedOut)
            {
                e.Authenticated = false;
                Login_MIB.FailureText = "บัญชีผู้ใช้ของท่านถูกล็อก , กรุณาติดต่อเจ้าหน้าที่";
            }
            else if (Membership.ValidateUser(Login_MIB.UserName, Login_MIB.Password))
            {
                if (userInfo.LastPasswordChangedDate.AddDays(-1) < DateTime.Now)
                {
                    Login_MIB.Visible = false;
                    //Change Password When Password Expired
                }
                else
                {
                    e.Authenticated = true;

                }
            }
            else
            {
                e.Authenticated = false;
                Login_MIB.FailureText = "รหัสผ่านไม่ถูกต้อง";
            }
        }

        protected void Login_MIB_LoginError(object sender, EventArgs e)
        {
            Login_MIB.FailureText = "";

            MembershipUser userInfo = Membership.GetUser(Login_MIB.UserName);

            if (Membership.ValidateUser(Login_MIB.UserName, Login_MIB.Password))
            {
                if (userInfo != null)
                {
                    if (!userInfo.IsApproved)
                    {
                        Login_MIB.FailureText = "บัญชีผู้ใช้ของท่านยังไม่ได้รับการยืนยัน, ท่านจะยังไม่สามารถเข้าสู่ระบบได้ จนกว่าจะทำการยืนยันเรียบร้อยแล้ว";
                    }
                    else if (userInfo.IsLockedOut)
                    {
                        Login_MIB.FailureText = "บัญชีผู้ใช้ของท่านถูกล็อก , กรุณาติดต่อเจ้าหน้าที่";
                    }
                }
                else
                {
                    Login_MIB.FailureText = "การเข้าสู่ระบบไม่สำเร็จ กรุณาลองใหม่อีกครั้ง";
                }
            }
            else
            {
                Login_MIB.FailureText = "";
            }
        }
    }
}