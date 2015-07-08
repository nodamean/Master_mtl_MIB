<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="Login.aspx.cs" Inherits="mtl_MIB.Memberships.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
                       <a  id="lnkChangePassword"  runat="server" data-toggle="modal" data-target="#mdChangePassword" href="#" class="bth bth-primary" visible="false">เปลี่ยนรหัสผ่าน</a>
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
        <h4 class="modal-title">รหัสผ่านหมดอายุแล้ว กรุณาเปลี่ยนรหัสผ่านใหม่</h4> <hr />
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
            </div>
            </div>
         <div class="row">
                <div class="col-lg-12"><span class="text text-success" id="span_result"></span><span class="text text-danger" id="span_result_error"></span></div>
            </div>
      </div>
      <div class="modal-footer">
     
          <asp:Button ID="btnChangePassword" runat="server"  Text="Save" CssClass="btn btn-primary"/>
           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    

  </div>
</div>
</div>

    <script type="text/javascript">
        var theForm = document.forms['aspnetForm'];
        $(document).ready(function () {
            $("#span_result").html('');
            $("#span_result_error").html('');
            $("#<%=UserName.ClientID%>").change(function () {
                $("#<%=txtUserName.ClientID%>").val();
                $("#<%=txtUserName.ClientID%>").val($("#<%=UserName.ClientID%>").val());
            });
            $('#mdChangePassword').modal({
                show:  <%= showDialog %>});
 
            $("#<%=btnChangePassword.ClientID%>").click(function () {
                validateForm();
                if ($("#ctl01").valid()) {
                  result =  ChangePassword($("#<%=txtUserName.ClientID%>").val(), $("#<%=txtPasswordOld.ClientID%>").val(), $("#<%=txtPasswordNew.ClientID%>").val());
                    if (result == "completed") {
                        $("#span_result").html("เปลี่ยนรหัสผ่านเรียบร้อยแล้ว รหัสผ่านใหม่ของท่าน คือ "+ $("#<%=txtPasswordNew.ClientID%>").val());
                        return false;
                    }
                    else {

                        $("#span_result_error").html("ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง กรุณากรอกใหม่");
                        return false;
                    }
                }
            });

            function ChangePassword(username, passwordOld, passwordNew) {
                var result;
                $.ajax({
                    type: "POST",
                    url: "../WSForMIB.asmx/ChangePassword",
                    data: "{username:'" + username + "' , passwordOld:'" + passwordOld + "', passwordNew:'" + passwordNew + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data, status) { result = ChangePasswordOnSuccess(data, status) },
                    error: ChangePasswordOnError
                });
                return result;
            }
            function  ChangePasswordOnSuccess(data, status) {
                    return data.d;
               
            }
            function ChangePasswordOnError(request, status, error) {
                alert(error);
            }
            function validateForm() {

                $("#ctl01").validate({
                    rules: {
                        ctl00$MainContent$txtUserName: { required: true },
                        ctl00$MainContent$txtPasswordOld: { required: true },
                        ctl00$MainContent$txtPasswordNew: { required: true, minlength: 4},
                        ctl00$MainContent$txtPasswordNewConfirm: { required: true,minlength:4,equalTo: "#<%=txtPasswordNew.ClientID%>" }
                    },
                    messages: {
                        ctl00$MainContent$txtUserName: { required: "*" },
                        ctl00$MainContent$txtPasswordOld: { required: "*" },
                        ctl00$MainContent$txtPasswordNew: { required: "*", minlength: "กรุณาระบุรหัสผ่านอย่างน้อย 4 ตัวขึ้นไป" },
                        ctl00$MainContent$txtPasswordNewConfirm: { required: "*" ,minlength:"กรุณาระบุรหัสผ่านอย่างน้อย 4 ตัวขึ้นไป", equalTo:"กรุณาระบุรหัสผ่านที่ตรงกัน" }
                    }
                });
            }
        });
   </script>

</asp:Content>