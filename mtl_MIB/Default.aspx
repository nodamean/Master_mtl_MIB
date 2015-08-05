<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" id="logo">
        <h4>ระบบเมืองไทย MIB Online</h4>
        <p class="lead"> </p>
    </div>
      
    
  <div class="form-horizontal">
        <h4> <div class="glyphicon glyphicon-search"></div>ค้นหา</h4>
        <hr />

        <asp:ValidationSummary runat="server"  CssClass="text-danger" />
       <div class="form-group">
           <asp:HiddenField ID="HiddenField_UserID" runat="server" />
            <asp:HiddenField ID="HiddenField_PartnerID" runat="server" />
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
         
            <div class="col-md-5">
                 <asp:TextBox runat="server" ID="txtID" CssClass="form-control"  MaxLength="13"/>
                <div id="span_result" class="text text-danger"></div>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-2 control-label">ชื่อ</asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
            
            </div>
            
        </div>
       <div class="form-group">
           <asp:Label runat="server" AssociatedControlID="txtSurname" CssClass="col-md-2 control-label">นามสกุล</asp:Label>
           <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtSurname" CssClass="form-control" />
                <div id="wait" style="display:none;width:69px;height:89px;border:0px solid black;position:absolute;top:50%;left:50%;padding:0px;"><img src='Images/loading.gif' width="64" height="64" /><br>Loading..</div>
                 <div id="preloader" style="position:fixed;top:45%;left:45%;display:none;"><img src="Images/loading.gif" /></div>
            </div>
       </div>
     
        <div class="form-group">
            <div class="col-md-offset-2 col-lg-2">
                <button type="button" data-loading-text="Loading..."  id="btnSearch"  class="btn btn-primary"> ค้นหา</button>
            </div>
            <div class="col-lg-2">
                <%--<button class="btn btn-primary" type="button"   data-loading-text="Loading...">ค้นหา</button>--%>
               
                <button type="button"  id="btnClear"  class="btn btn-default">Clear</button>
            
            </div>
        </div>

        <div class="form-group" id="result_mib">
             <h5> <div class="glyphicon glyphicon-tasks"></div>ผลลัพธ์MIB Online</h5>
            
             <hr />
             
            <div class="col-lg-12"> <a href="whatever.htm" onClick="javascript:printarea();return false">
                     <img src="Images/printer.png" width="30px" height="30px" /></a>
                <h5> <span class="text text-success bg-success" id="span_result1"></span></h5><h5><span class="text text-danger bg-warning" id="span_result2"></h5></span>
            </div>
            <div class="col-md-12">
                หมายเลขอ้างอิงการค้นหา: <span class="text text-success" id="log_id"></span>
            </div>
              <div class="col-md-12">
                วันเวลาที่ค้นหา: <span class="text text-success" id="log_date"></span>
            </div>
               <div class="col-md-12">
                ผู้ที่ค้นหา: <span class="text text-success" id="log_username"></span>
            </div>
             <div class="col-md-12">
                <span class="text text-primary"><u>ข้อมูลที่ใช้ค้นหา</u></span>
            </div>
              <div class="col-md-12">
                 <span class="text text-success" id="log_keyword"></span>
            </div>
           
           <hr />
        </div>
    </div>
     
    <script type="text/javascript">
        
        function printarea() {
            var prtContent =  document.getElementById("result_mib");
            var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=1,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
        $(document).ready(function () {
            $("#result_mib").hide();
          
            //Clear Data
           $("#btnClear").click(function () {
            
                $("#<%=txtID.ClientID%>").val('');
                $("#<%=txtName.ClientID%>").val('');
                $("#<%=txtSurname.ClientID%>").val('');
                $("#span_result2").html('');
                $("#span_result1").html('');
                $("#span_result").html("");
                $("#result_mib").hide();
                $("#btnSearch").button('reset');
            });
            //Check ID Card
            $("#<%=dryTypeID.ClientID%>").change(function () {
                $("#span_result").html("");
                $("#<%=txtID.ClientID%>").inputmask("9999999999999");
                var typeID = $("#<%=dryTypeID.ClientID %> option:selected").text();
                if (typeID == "Passport") {
                    $("#<%=txtID.ClientID%>").inputmask('remove');
                    $("#<%=txtID.ClientID%>").val('');
                    $("#<%=txtID.ClientID%>").attr('maxlength','20');
                }
                else { //ID Card
                    $("#<%=txtID.ClientID%>").val('');
                    $("#<%=txtID.ClientID%>").attr('maxlength', '13');
                 

                }

            });
            $("#<%=txtID.ClientID%>").focusout(function () {
                $("#span_result").html("");
                 typeID = $("#<%=dryTypeID.ClientID %> option:selected").text();
                if (typeID == "บัตรประชาชน") {
                    result = CheckValidPersonalID($("#<%=txtID.ClientID%>").val());
                    
                    if (result == "false") {
                        $("#span_result").html("กรุณาระบุเลขบัตรประชาชนให้ถูกต้อง");
                        $("#<%=txtID.ClientID%>").focus();
                        
                    }
               
            }
            });
           
            $("#btnSearch").click(function () {
                $("#result_mib").hide();
               var btn = $("#btnSearch");
               btn.button('loading');
              validateForm();
              if ($("#ctl01").valid()) {
                  $("#span_result2").html('');
                  $("#span_result1").html('');
                 setTimeout(function () {
                     var obj = GetClientByNameAndPIDForMIB2($("#<%=txtName.ClientID%>").val(), $("#<%=txtSurname.ClientID%>").val(), $("#<%=txtID.ClientID%>").val(), $("#<%=HiddenField_UserID.ClientID %>").val(), $("#<%=dryTypeID.ClientID %> option:selected").text(), $("#<%=HiddenField_PartnerID.ClientID %>").val());
                     if (obj.length > 0) {
                         for (var i = 0; i < obj.length; i++) {
                             if (obj[i].fld_result == "found") {
                                 $("#span_result2").html(obj[i].fld_result_show.toString().trim());
                                 $("#log_id").html(obj[i].refrow.toString().trim());
                                 $("#log_date").html(Date(parseInt(obj[i].logdatetime)).toString().replace('GMT+0700 (SE Asia Standard Time)', ''));
                                 $("#log_username").html(obj[i].username.toUpperCase());
                                 $("#log_keyword").html('หมายเลขระบุตัวตน:'+ obj[i].fld_pid_number  +'<br/>ชื่อ:'+obj[i].fld_first_name +'<br/>นามสกุล:'+obj[i].fld_last_name);

                             }
                             else if (obj[i].fld_result == "notfound") {
                                 $("#span_result1").html(obj[i].fld_result_show.toString().trim());
                                 $("#log_id").html(obj[i].refrow.toString().trim());
                                 $("#log_date").html(Date(parseInt(obj[i].logdatetime)).toString().replace('GMT+0700 (SE Asia Standard Time)',''));
                                 $("#log_username").html(obj[i].username.toUpperCase());
                                 $("#log_keyword").html('หมายเลขระบุตัวตน:' + obj[i].fld_pid_number + '<br/>ชื่อ:' + obj[i].fld_first_name + '<br/>นามสกุล:' + obj[i].fld_last_name);

                             }
                            
                         }
                         
                     }
                     $("#result_mib").show();
                     btn.button('reset');
                  }, 1000)
                    
                   // return false;
              }
              else {
                 
                  btn.button('reset');
              }
            });
            // === BEG: Get Web Services: Check บัตรปชช. === //

            function CheckValidPersonalID(PersonalID) {
                var result;
                $.ajax({
                    type: "POST",
                    url: "WSForMIB.asmx/CheckValidPersonalID",
                    data: "{PersonalID:'" + PersonalID + "' }",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data, status) {
                        result = CheckValidPersonalIDOnSuccess(data, status) },
                    error: CheckValidPersonalIDOnError
                });
                return result;

            }
            function CheckValidPersonalIDOnSuccess(data, status) {
               return data.d;

            }
            function CheckValidPersonalIDOnError(request, status, error) {
                //alert(error);

            }
            // === END: Get Web Services: Check บัตรปชช. === //

            // === BEG: Get Web Services: Check MIB === //

            function GetClientByNameAndPIDForMIB2(fld_first_name, fld_last_name, fld_pid_number,username,type,partnerid) {
                var result;
                $.ajax({
                    type: "POST",
                    url: "WSForMIB.asmx/GetClientByNameAndPIDForMIB2",
                    data: "{fld_first_name:'" + fld_first_name + "' , fld_last_name:'"+fld_last_name +"',fld_pid_number:'" + fld_pid_number+"',username:'"+username + "',type:'"+type+"' ,partnerid:'"+partnerid+"' }",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    processData:false,
                    async: false,
                    success: function (data, status) {
                        result = GetClientByNameAndPIDForMIB2OnSuccess(data, status);
                      
                    },
                    error: GetClientByNameAndPIDForMIB2OnError
                });
                return result;

            }
            function GetClientByNameAndPIDForMIB2OnSuccess(data, status) {

                return data.d; 

            }
            function GetClientByNameAndPIDForMIB2OnError(request, status, error) {
               alert(error);

            }
            // === END: Get Web Services: Check MIB === //
            function validateForm() {

                $("#ctl01").validate({
                    rules: {
                        ctl00$MainContent$txtID: { required: true },
                        ctl00$MainContent$txtName: { required: true, minlength: 2 },
                        ctl00$MainContent$txtSurname: { required: true, minlength: 2 }

                    },
                    messages: {
                        ctl00$MainContent$txtID: { required: "*"},
                        ctl00$MainContent$txtName: { required: "*", minlength: "กรุณาระบุมากกว่า 1 ตัวอักษรขึ้นไป" },
                        ctl00$MainContent$txtSurname: { required: "*", minlength: "กรุณาระบุมากกว่า 1 ตัวอักษรขึ้นไป" }
                    }
                    ,
                    ignore: "",
                    errorClass: 'text-danger',
                    onkeyup: false,
                    onblur: false,
                    errorElement: 'label',
                    submitHandler: function () {
                       
                    }
                });
            }

        });
    </script>
</asp:Content>
