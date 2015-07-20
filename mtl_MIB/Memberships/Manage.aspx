<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="mtl_MIB.Memberships.Manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="form-group">
        <div class="col-md-12">
      

            <asp:GridView ID="GridView1" runat="server"  OnPreRender="GridView1_PreRender" 
                CssClass="table table-hover table-responsive  cell-border table-bordered bg-success" AutoGenerateColumns="False" >
               <Columns>
                       <asp:TemplateField HeaderText="" ItemStyle-Font-Bold="true" >
                        <ItemTemplate>                  
                            <button id="btnEdit">Edit</button>
                        </ItemTemplate>
                        </asp:TemplateField>      
                       <asp:TemplateField HeaderText="ลำดับ" ItemStyle-Font-Bold="true" >
                        <ItemTemplate>                  
                        <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>

                        <ItemStyle Font-Bold="True"></ItemStyle>
                        </asp:TemplateField>          
                    <asp:BoundField HeaderText="ชื่อบัญชีผู้ใช้งาน" DataField="username" />
                    <asp:BoundField HeaderText="คำอธิบายอื่นๆ" DataField="partnerdesc" />
                    <asp:BoundField HeaderText="Partner" DataField="partnerid" />
                </Columns>
                
            </asp:GridView>
           
            </div>
  
        </div>
<!-- Modal -->
<div id="mdChangePassword" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header bg-success">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-success">ข้อมูลผู้ใช้งาน</h4> 
      </div>
      <div class="modal-body">
       <div class="row">
          
           <div class="col-lg-4"><asp:Label ID="lblUserName" runat="server" AssociatedControlID="txtUserName">ชื่อบัญชีผู้ใช้งาน</asp:Label></div>
            <div class="col-lg-8"><asp:TextBox ID="txtUserName" runat="server" CssClass="text text-primary" placeholder="UserName" ReadOnly="true"></asp:TextBox>
            </div>
       </div>
       <div class="row">
            <div class="col-lg-4"><asp:Label ID="lblDesc" runat="server" AssociatedControlID="txtDesc">คำอธิบายอื่นๆ</asp:Label></div>
            <div class="col-lg-8"><asp:TextBox ID="txtDesc" runat="server" CssClass="text text-primary"  ReadOnly="true"  ></asp:TextBox> 
            </div>
        </div>
       <div class="row">
            <div class="col-lg-4"><asp:Label ID="lblPartner" runat="server" >Partner</asp:Label></div>
            <div class="col-lg-8"><asp:TextBox ID="txtPartner" runat="server" CssClass="text text-primary"  ReadOnly="true"  ></asp:TextBox>

            </div>
        </div>
       <div class="row">
                <div class="col-lg-4"><asp:Label ID="lblStatus" runat="server" >สถานะ</asp:Label></div>
                <div class="col-lg-8"><asp:DropDownList ID="DropDownStatus" runat="server">
                                <asp:ListItem Text="Active">Active</asp:ListItem>
                                <asp:ListItem Text="UnActive">UnActive</asp:ListItem>
                                 <asp:ListItem Text="Locked">Locked</asp:ListItem>
                                </asp:DropDownList><span class="text text-success" id="span_result2"></span> 
                </div>
            </div>
       
           <hr />
        <div class="row">
            <div class="col-lg-12"><h5>เปลี่ยนรหัสผ่าน</h5></div>
        </div>
         <div class="row">
             <div class="col-lg-4"><asp:Label ID="lblPasswordNew" runat="server">รหัสผ่านใหม่</asp:Label></div>
             <div class="col-lg-8">  <div class="col-lg-8"> <button id="btnGenPasswordNew" class="btn btn-info">สร้างรหัสผ่านใหม่</button><div id="result_password" class="text text-success"></div> </div> </div>
         </div>
      </div>
       <div class="row">
                         <div class="col-lg-12">
                            <span class="text text-success" id="span_result1"></span> <span class=" text text-danger" id="span_result"></span>
                         </div>
                    </div>
      <div class="modal-footer">
        <button id="btnChangePassword" class="btn btn-primary">Save</button>
        <%--  <asp:Button ID="btnChangePassword" runat="server"  Text="Save" CssClass="btn btn-primary"/>--%>
           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    

  </div>
   </div>
</div>

 <script type="text/javascript">
     $(document).ready(function () {
         var status1 = "";
         $("#result_password").text('');
         $("#btnEdit").click(function () {
             $('#mdChangePassword').modal({
                 show: true
             });
             $("#<%=GridView1.ClientID%> tr:has(td)").each(function () {
                 var cell2 = $(this).find("td:eq(2)");
                 var cell3 = $(this).find("td:eq(3)");
                 var cell4 = $(this).find("td:eq(4)");
                 //alert(cell.html());
                 $("#<%=txtUserName.ClientID%>").val(cell2.html());
                 $("#<%=txtDesc.ClientID%>").val(cell3.html());
                 $("#<%=txtPartner.ClientID%>").val(cell4.html());
                 GetProfileByID($("#<%=txtUserName.ClientID%>").val())

             });
             return false;
         });
         
         $("#btnGenPasswordNew").click(function () {
             $("#result_password").text(GetPasswordRandom());
             return false;
         });
         $("#<%=DropDownStatus.ClientID%>").change(function () {

              status1 = $("#<%=DropDownStatus.ClientID %> option:selected").val();
           
            
         });
         $("#btnChangePassword").click(function(){
            var r =confirm("ยืนยันเปลี่ยนข้อมูลผู้ใช้งาน");
            if (r == true) {
                if ($("#result_password").text() != "") {
                    var newpsw= ResetPasswordNew($("#<%=txtUserName.ClientID%>").val(), $("#result_password").text());
                    if(newpsw!=""){
                        $("#span_result1").html('บันทึกข้อมูลเรียบร้อยแล้ว รหัสผ่านใหม่คือ'+ newpsw);

                    }
                }
                if (status1 != "") {
                   
                    if (SaveStatusProfileByID($("#<%=txtUserName.ClientID%>").val(), status1, '') == "completed") {
                        $("#span_result2").html('บันทึกข้อมูลสถานะเรียบร้อยแล้ว');
                    }
                  // $("#span_result1").html(SaveStatusProfileByID($("#<%=txtUserName.ClientID%>").val(), status1, ''));
                }
                return false;
             }
            else {
                return false;
            }
             return false;
          });
           $("#<%=GridView1.ClientID%>").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
            
            $("#<%=GridView1.ClientID%>").DataTable({
                 "retrieve": true,
                "paging": false
            });

            function GetPasswordRandom() {
                var result;
                $.ajax({
                    type: "POST",
                    url: "../WSForMIB.asmx/GetPasswordRandom",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data, status) { result = GetPasswordRandomOnSuccess(data, status) },
                    error: GetPasswordRandomOnError
                });
                return result;
            }
            function GetPasswordRandomOnSuccess(data, status) {
                return data.d;

            }
            function GetPasswordRandomOnError(request, status, error) {
                alert(error);
            }

            function ResetPasswordNew(username, genpsw) {
                var result;
                $.ajax({
                    type: "POST",
                    url: "../WSForMIB.asmx/ResetPasswordNew",
                    data: "{username:'" + username + "',genpsw:'"+ genpsw +"'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data, status) { result = ResetPasswordNewOnSuccess(data, status) },
                    error: ResetPasswordNewOnError
                });
                return result;
            }
            function ResetPasswordNewOnSuccess(data, status) {
                return data.d;

            }
            function ResetPasswordNewOnError(request, status, error) {
                alert(error);
            }
            function SaveStatusProfileByID(User, Status ,StatusOld) {
                var result;
                $.ajax({
                    type: "POST",
                    url: "../WSForMIB.asmx/SaveStatusProfileByID",
                    data: "{User:'" + User + "',Status:'" + Status + "' , StatusOld:'" + StatusOld+ "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data, status) { result = SaveStatusProfileByIDOnSuccess(data, status) },
                    error: SaveStatusProfileByIDOnError
                });
                return result;
            }
            function SaveStatusProfileByIDOnSuccess(data, status) {
                return data.d;

            }
            function SaveStatusProfileByIDOnError(request, status, error) {
                alert(error);
            }

            function GetProfileByID(User) {
                $("#showresult").html("");
                $.ajax({
                    type: "POST",
                    url: "../WSForMIB.asmx/GetProfileByID",
                    data: "{User:'" + User + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: GetProfileByIDResultOnSuccess,
                    error: GetProfileByIDResultOnError
                });
            }

            function GetProfileByIDResultOnSuccess(data, status) {
                var obj = data.d;
                    if (obj == "Active") {
                        $('#<%=DropDownStatus.ClientID %>').val(obj).attr('selected', true);
                    }
                    else if (obj== "UnActive") {
                        $('#<%=DropDownStatus.ClientID %>').val(obj).attr('selected', true);
                    }
                    else if (obj == "Locked") {
                        $('#<%=DropDownStatus.ClientID %>').val(obj).attr('selected', true);

                    }
               
            }
            function GetProfileByIDResultOnError(request, status, error) {
                $(".showresult").html(request.statusText);
            }
        });
    </script>

</asp:Content>
