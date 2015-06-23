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
                       <a  id="lnkChangePassword"  runat="server" data-toggle="modal" data-target="#mdChangePassword" href="#" class="bth bth-primary">เปลี่ยนรหัสผ่าน</a>
                    </div>
                   
                </div>
            </div>
            </LayoutTemplate>
        </asp:Login>
                    <div>
                   </div>

    <!-- Modal -->
<div id="mdChangePassword" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">เปลี่ยนรหัสผ่าน</h4> <hr />
      </div>
      <div class="modal-body">
       <div class="row">
           <div class="col-lg-4"><asp:Label ID="lblUserName" runat="server" AssociatedControlID="txtUserName">ชื่อบัญชีผู้ใช้งาน</asp:Label></div>
            <div class="col-lg-8"><asp:TextBox ID="txtUserName" runat="server" CssClass="text text-primary" placeholder="UserName" ></asp:TextBox>
                              <%--  <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserName" CssClass="text-danger" ErrorMessage="*" />--%>
            </div>
       </div>
        <div class="row">
            <div class="col-lg-4"><asp:Label ID="lblPasswordOld" runat="server" AssociatedControlID="txtPasswordOld">รหัสผ่านเดิม</asp:Label></div>
            <div class="col-lg-8"><asp:TextBox ID="txtPasswordOld" runat="server" CssClass="text text-primary"   placeholder="Password" TextMode="Password" MaxLength="13" ></asp:TextBox> 
                                   <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPasswordOld" CssClass="text-danger" ErrorMessage="*" />--%>
            </div>
        </div>
         <div class="row">
            <div class="col-lg-4"><asp:Label ID="lblPasswordNew" runat="server" AssociatedControlID="txtPasswordNew">รหัสผ่านใหม่</asp:Label></div>
            <div class="col-lg-8"><asp:TextBox ID="txtPasswordNew" runat="server" CssClass="text text-primary"   placeholder="New Password" TextMode="Password" MaxLength="13" ></asp:TextBox> 
                                 <%--  <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPasswordNew" CssClass="text-danger" ErrorMessage="*" />--%>

            </div>
        </div>
           <div class="row">
            <div class="col-lg-4"><asp:Label ID="lblPasswordNewConfirm" runat="server" AssociatedControlID="txtPasswordNewConfirm">ยืนยันรหัสผ่านใหม่</asp:Label></div>
            <div class="col-lg-8"><asp:TextBox ID="txtPasswordNewConfirm" runat="server" CssClass="text text-primary"   placeholder="Confirm New Password" TextMode="Password" MaxLength="13" ></asp:TextBox>
                                 <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="txtPasswordNewConfirm" CssClass="text-danger" ErrorMessage="*" />
                                 <asp:CompareValidator runat="server" ControlToCompare="txtPasswordNew" ControlToValidate="txtPasswordNewConfirm"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="กรุณาระบุรหัสผ่านให้ตรงกัน" />--%>
             </div>
        </div>
      </div>
      <div class="modal-footer">
     <%--    <button id="btnChangePassword" class="btn btn-primary" >Save</button>--%>
          <asp:Button ID="btnChangePassword" runat="server"  Text="Save" CssClass="btn btn-primary"/>
           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
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

    <script type="text/javascript">
        var theForm = document.forms['aspnetForm'];
        $(document).ready(function () {
            $("#<%=UserName.ClientID%>").change(function () {
                $("#<%=txtUserName.ClientID%>").val();
                $("#<%=txtUserName.ClientID%>").val($("#<%=UserName.ClientID%>").val());
            });
            $("#<%=btnChangePassword.ClientID%>").click(function () {
                
                validateForm();
                if ($("#form1").valid()) {
                }
            });
            function validateForm() {

                $("#ctl01").validate({
                    rules: {
                        ctl00$MainContent$txtUserName: { required: true },
                        ctl00$MainContent$txtPasswordOld: { required: true },
                        ctl00$MainContent$txtPasswordNew: { required: true},
                        ctl00$MainContent$txtPasswordNewConfirm: {  equalTo: "#txtPasswordNewConfirm" }
                    },
                    messages: {
                        ctl00$MainContent$txtUserName: { required: "*" },
                        ctl00$MainContent$txtPasswordOld: { required: "*" },
                        ctl00$MainContent$txtPasswordNew: "กรุณาระบุรหัสผ่านให้ตรงกัน",
                        ctl00$MainContent$txtPasswordNewConfirm:"กรุณาระบุรหัสผ่านให้ตรงกัน"
                        
                    },
                    ignore: "",
                    // errorClass: 'fieldError',
                    onkeyup: false,
                    onblur: false,
                    errorElement: 'label',
                    submitHandler: function () {
                        alert("alert");
                    }
                    , errorPlacement: function (error, element) {
                        if (element.is(":radio")) {
                            error.insertBefore("#Titleerror");
                        }
                        else { // This is the default behavior 
                            error.insertAfter(element);
                        }
                    }
                });
            }
        });
   </script>

</asp:Content>