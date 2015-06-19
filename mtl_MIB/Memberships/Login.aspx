<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="Login.aspx.cs" Inherits="mtl_MIB.Memberships.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2>Login</h2>
     <asp:Login Width="100%" ID="Login_MIB" runat="server" OnAuthenticate="Login_MIB_Authenticate" DestinationPageUrl="~/Default.aspx">
            <LayoutTemplate>
            <h2>เข้าสู่ระบบ</h2>
            <div class="row">
                <div class="col-lg-4">
                    <div class="form-group">
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">ชื่อบัญชีผู้ใช้งาน</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="Username" MaxLength="13"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">รหัสผ่าน</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" MaxLength="13"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:CheckBox ID="RememberMe" runat="server" Text=" ให้ช่วยจดจำสำหรับการเข้าใช้งานครั้งถัดไป" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group error" style="color: Red;">
                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="เข้าสู่ระบบ" ValidationGroup="Login_MIB" CssClass="btn btn-primary" OnClientClick="FormValidation();" />
<%--                    <a id="GoToForgotPassword" href="Membership/ForgetPassword.aspx">ลืมรหัสผ่าน?</a>--%>
                    </div>
                    <%--<div>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Membership/Register.aspx">กรณียังไม่เป็นสมาชิก กรุณาสมัครสมาชิกที่นี่</asp:HyperLink>
                    </div>--%>
                </div>
            </div>
            </LayoutTemplate>
        </asp:Login>
   <%-- <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Use a local account to log in.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtUserName" CssClass="col-md-2 control-label">UserName</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control"  />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserName"
                                CssClass="text-danger" ErrorMessage="*" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="*" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                          
                            <button id="btnLogin" class="btn btn-default" >Log in</button>
                        </div>
                    </div>
                </div>
             
                
            </section>
        </div>
    </div>--%>
  <%--  <script type="text/javascript">
        $(document).ready(function () {

            $("#btnLogin").click(function () {
                username = $("#<%=txtUserName.ClientID%>").val();
                Login(username);
            });
        });

        function Login(username) {
            $.ajax({
                type: "POST",
                url: "../WSForMIB.asmx/Login",
                data: "{username:'"+username+"'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: LoginOnSuccess,
                error: LoginOnError
            });
        }
        function LoginOnSuccess(data, status) {
            var obj = data.d;
            if (obj.length > 0) {
                for (var i = 0; i < obj.length; i++) {
                    if (obj[i].fld_result == "found") {
                        alert(obj[i].username + obj[i].partnerid + obj[i].partnerdesc);
                    }
                    else {
                        alert('ไม่พบUser');
                    }

                }
            }
        }
        function LoginOnError(request, status, error) {
            alert(error);
        }
    </script>--%>
</asp:Content>