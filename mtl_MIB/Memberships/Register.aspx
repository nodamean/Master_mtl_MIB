<%@ Page Title="" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="mtl_MIB.Memberships.Register" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtUserName" CssClass="col-md-2 control-label">User name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserName"
                    CssClass="text-danger" ErrorMessage="The user name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
           <asp:Label runat="server" AssociatedControlID="drpPartner" CssClass="col-md-2 control-label">Partner</asp:Label>
             <div class="col-md-10">
               <asp:DropDownList runat="server" ID="drpPartner"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="Button1" runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
        </div>

    <script>
        $(document).ready(function () {
            GetPartner();
           
        });
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
            $("#<%=drpPartner.ClientID%>").append($("<option></option>").val('00').html('<----เลือกช่องทางPartner---->'));
            alert(error);
        }
    </script>
</asp:Content>
