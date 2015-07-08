<%@ Page Title="" Language="C#"  MasterPageFile="~/Site.Master"   EnableEventValidation="false"  AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="mtl_MIB.Memberships.Register" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account.</h4>
        <hr />
        <%--<asp:ValidationSummary runat="server" CssClass="text-danger" />--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtUserName" CssClass="col-md-3 control-label">User name</asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" placeholder="Username"  />
              
            </div>
        </div>

        <%-------Create Password Manual-----%>
        <%--<div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="col-md-3 control-label">Password</asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control"  placeholder="Password"/>
             
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtConfirmPassword" CssClass="col-md-3 control-label">Confirm password</asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtConfirmPassword" TextMode="Password" CssClass="form-control text-primary"  placeholder="Confirm Password"/>
              
            </div>
        </div>--%>
        <div class="form-group">
           <asp:Label runat="server" AssociatedControlID="drpPartner" CssClass="col-md-3 control-label">Partner</asp:Label>
             <div class="col-md-5">
               <asp:DropDownList runat="server" ID="drpPartner" AutoPostBack="false"   CssClass="form-control text-primary"></asp:DropDownList>
            </div>
            
        </div>
         <div class="form-group">
           <asp:Label runat="server" AssociatedControlID="txtDes" CssClass="col-md-3 control-label">คำอธิบายชื่อสาขา/อื่นๆ</asp:Label>
             <div class="col-md-5">
               <asp:TextBox runat="server" ID="txtDes" CssClass="form-control"  placeholder="สาขา..."/>
            </div>
            
        </div>
        <div class="form-group">
            <div class="col-md-offset-3 col-md-5">
                <button id="btnRegister" class="btn btn-default" >Register</button>
            </div>
        </div>

         <div class="form-group">
            <div class="col-md-12">
                <span id="span_result" class="text text-success"></span>
                  <span id="span_error" class="text text-danger"></span>
            </div>
        </div>

        </div>

    <script>
        $(document).ready(function () {
            GetPartner();
            //--Check UserName available----
            $("#<%=txtUserName.ClientID%>").focusout(function () {
                username = $("#<%=txtUserName.ClientID%>").val();
                $("#<%=txtUserName.ClientID%>").val(username.toUpperCase())
                if (IsUserExist(username) == "found") {
                    $('#lblCheckUsername').text('มีUsernameนี้ในระบบแล้ว กรุณาระบุใหม่')
                }
            });

            $("#btnRegister").click(function () {
                validateForm()
                if ($("#ctl01").valid()) {
                    username = $("#<%=txtUserName.ClientID%>").val();
                   <%-- password = $("#<%=txtPassword.ClientID%>").val();--%>
                    partnerid = $("#<%=drpPartner.ClientID %> option:selected").val();
                    partnerdesc = partneredesp = $("#<%=txtDes.ClientID%>").val() + ":"+$("#<%=drpPartner.ClientID %> option:selected").text();
                    result= SaveRegister(username, partnerid, partnerdesc);

                    var pattern = new RegExp("completed_");
                    $("#span_result").text('');
                    $("#span_error").text('');
                    var status = result.split('_');
                    if (pattern.test(result)) {
                       $("#span_result").text('User สำหรับเข้าระบบ: '+ username + ' รหัสผ่าน:  '+status[1]);

                    }
                    else {
                        $("#span_error").text('ไม่สามารถสร้าง User เข้าระบบได้: ' + status[1] );
                    }
                }
            });
            jQuery.validator.addMethod(
            "selectNone",
            function (value, element) {
                if (element.value == "00" || element.value == "") {
                    return false;
                }
                else return true;
            },
            "*"
          );
           function validateForm() {

                $("#ctl01").validate({
                    rules: {
                        ctl00$MainContent$txtUserName: { required: true },
                        ctl00$MainContent$drpPartner: { selectNone: true },
                        ctl00$MainContent$txtDes: { required: true },
                    },
                    messages: {
                        ctl00$MainContent$txtUserName: { required: "*" },
                        ctl00$MainContent$txtDes: { required: "*" }
                    }
                    ,
                    ignore: "",
                    errorClass: 'text-danger',
                    onkeyup: false,
                    onblur: false,
                    submitHandler: function () {
                        return false;
                }
                    
                });
            }
        });
        function IsUserExist(username) {
            var result;
            $.ajax({
                type: "POST",
                url: "../WSForMIB.asmx/IsUserExist",
                data: "{username:'" + username  + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data, status) { result = IsUserExistOnSuccess(data, status) },
                error: IsUserExistOnError
            });
            return result;
        }
        function IsUserExistOnSuccess(data, status) {
          
            var pattern = new RegExp("notcomplete_");
            if (pattern.test(data.d)) {
                var status = data.d.split('_');
                return status[1];
            }
            else {
                return data.d;
            }
        }
        function IsUserExistOnError(request, status, error) {
            alert(error);
        }
        function SaveRegister(username, partnerid, partnerdesc) {
            var result;
            $.ajax({
                type: "POST",
                url: "../WSForMIB.asmx/SaveRegister",
                data: "{username:'" + username + "',partnerid:'" + partnerid + "',partnerdesc:'" + partnerdesc + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data, status) { result = SaveRegisterOnSuccess(data, status) },
                error:SaveRegisterOnError
            });
            return result;
        }
        function SaveRegisterOnSuccess(data, status) {

            return data.d;
            
        }
        function SaveRegisterOnError(request ,status,error) {
            alert(error);

        }

        function GetPartner() {
            $.ajax({
                type: "POST",
                url: "../WSForMIB.asmx/GetPartner",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: GetPartnerOnSuccess,
                error: GetPartnerOnError
            });
        }
        function GetPartnerOnSuccess(data, status) {
            $("#<%=drpPartner.ClientID%>").val('').html('');
            var obj = data.d;
            if (obj.length > 0) {
                $("#<%=drpPartner.ClientID%>").append($("<option></option>").val('00').html('<----เลือกช่องทางPartner---->'));
                for (var i = 0; i < obj.length; i++) {

                    $("#<%=drpPartner.ClientID%>").append($("<option></option>").val(obj[i].partnerid).html(obj[i].partnerdesc));

                }
            }
        }
        function GetPartnerOnError(request, status, error) {
            alert(error);
        }
    </script>
</asp:Content>
