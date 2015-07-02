<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h3>ระบบเมืองไทย MIB Online</h3>
        <p class="lead"> </p>
    </div>
  <div class="form-horizontal">
        <h4> <div class="glyphicon glyphicon-search"></div>ค้นหา</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="dryTypeID" CssClass="col-md-2 control-label">ประเภทบัตร</asp:Label>
            <div class="col-md-10">
                   <asp:DropDownList ID="dryTypeID" runat="server"  CssClass="col-md-2 control-label">
                    <asp:ListItem Value="1">บัตรประชาชน</asp:ListItem>
                    <asp:ListItem Value="2">Passport</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
           <asp:Label runat="server" AssociatedControlID="txtID" CssClass="col-md-2 control-label">หมายเลขระบุตัวตน</asp:Label>
         
            <div class="col-md-10">
                 <asp:TextBox runat="server" ID="txtID" CssClass="form-control"  MaxLength="13"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtID"
                    CssClass="text-danger" ErrorMessage="กรุณาระบุหมายเลขระบุตัวตน" />      
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-2 control-label">ชื่อ-นามสกุล</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName"
                    CssClass="text-danger" ErrorMessage="กรุณาระบุชื่อ" />
            </div>
        </div>
       
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <button class="btn btn btn-primary" id="btnSearch">ค้นหา</button>
            </div>
        </div>
    </div>
       
    <script type="text/javascript">
        $(document).ready(function () {
            //Check ID Card
            $("#<%=dryTypeID.ClientID%>").change(function () {
                var typeID = $("#<%=dryTypeID.ClientID %> option:selected").text();
                if (typeID == "Passport") {
                    $("#<%=txtID.ClientID%>").val('');
                    $("#<%=txtID.ClientID%>").attr('maxlength', '');
                }
                else { //ID Card
                    $("#<%=txtID.ClientID%>").val('');
                    $("#<%=txtID.ClientID%>").attr('maxlength', '13');
                 

                }

            });
            $("#btnSearch").click(function () {
                validateForm();
                if ($("#ctl01").valid()) {
                }
            });
            function CheckID() {

            }

            function validateForm() {

                $("#ctl01").validate({
                    rules: {
                        ctl00$MainContent$txtID: { required: true ,minlength: 13 }
                    },
                    messages: {
                        ctl00$MainContent$txtID: { required: "*", minlength: "กรุณาระบุบัตรประชาชนให้ถูกต้อง" }
                    }
                });
            }
        });
    </script>
</asp:Content>
