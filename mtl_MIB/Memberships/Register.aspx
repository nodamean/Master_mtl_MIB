﻿<%@ Page Title="" Language="C#"  MasterPageFile="~/Site.Master"   EnableEventValidation="false"  AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="mtl_MIB.Memberships.Register" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account.</h4>
        <hr />
        <%--<asp:ValidationSummary runat="server" CssClass="text-danger" />--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtUserName" CssClass="col-md-2 control-label">User name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserName"
                    CssClass="text-danger" ErrorMessage="*" />
                <label id="lblCheckUsername"></label>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                    CssClass="text-danger" ErrorMessage="*" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="*" />
                <asp:CompareValidator runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="กรุณาระบุรหัสผ่านให้ตรงกัน" />
            </div>
        </div>
        <div class="form-group">
           <asp:Label runat="server" AssociatedControlID="drpPartner" CssClass="col-md-2 control-label">Partner</asp:Label>
             <div class="col-md-10">
               <asp:DropDownList runat="server" ID="drpPartner" AutoPostBack="false"  ></asp:DropDownList>
            </div>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drpPartner"
               CssClass="text-danger"  ErrorMessage="*" InitialValue="00"  ></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <button id="btnRegister" class="btn btn-default" >Register</button>
<%--                <asp:Button ID="Button1" runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />--%>
            </div>
        </div>
        </div>

    <script>
        $(document).ready(function () {
            GetPartner();
            //--Check UserName available----
            $("#<%=txtUserName.ClientID%>").focusout(function () {
                username = $("#<%=txtUserName.ClientID%>").val();
                if (IsUserExist(username) == "found") {
                    $('#lblCheckUsername').text('มีUsernameนี้ในระบบแล้ว กรุณาระบุใหม่')
                }
            });

            $("#btnRegister").click(function () {
                //alert($("#<%=txtUserName.ClientID%>").val() + $("#<%=txtPassword.ClientID%>").val() + $("#<%=drpPartner.ClientID %> option:selected").val() + $("#<%=drpPartner.ClientID %> option:selected").text());
                username = $("#<%=txtUserName.ClientID%>").val();
                password = $("#<%=txtPassword.ClientID%>").val();
                partnerid = $("#<%=drpPartner.ClientID %> option:selected").val();
                partnerdesc = $("#<%=drpPartner.ClientID %> option:selected").text();
                SaveRegister(username, password, partnerid, partnerdesc);
            });
           
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
           // if(data.d =="found"){
           //     $('#lblCheckUsername').text('มีUsernameนี้ในระบบแล้ว กรุณาระบุใหม่')

            // }
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
        function SaveRegister(username, password, partnerid, partnerdesc) {
            $.ajax({
                type: "POST",
                url: "../WSForMIB.asmx/SaveRegister",
                data: "{username:'" + username + "', password:'" + password + "',partnerid:'" + partnerid + "',partnerdesc:'" + partnerdesc + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success:SaveRegisterOnSuccess,
                error:SaveRegisterOnError
            });
        }
        function SaveRegisterOnSuccess(data,status) {
            alert(data.d);
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

                    $("#<%=drpPartner.ClientID%>").append($("<option></option>").val(obj[i].partnerid).html(obj[i].description));

                }
            }
        }
        function GetPartnerOnError(request, status, error) {
            alert(error);
        }
    </script>
</asp:Content>
