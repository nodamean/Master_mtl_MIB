﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by Microsoft.VSDesigner, Version 4.0.30319.42000.
// 
#pragma warning disable 1591

namespace mtl_MIB.WS_Admin_ForMIB_V9 {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1055.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="WS_Admin_ForMIBBinding", Namespace="http://tempuri.org/")]
    public partial class WS_AdminWS_Admin_ForMIB : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback GetClientByNameAndPIDForMIB2OperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public WS_AdminWS_Admin_ForMIB() {
            this.Url = global::mtl_MIB.Properties.Settings.Default.mtl_MIB_WS_Admin_ForMIB_V9_WS_Admin_WS_Admin_ForMIB;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event GetClientByNameAndPIDForMIB2CompletedEventHandler GetClientByNameAndPIDForMIB2Completed;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("urn:http://tempuri.org/GetClientByNameAndPIDForMIB2", RequestNamespace="http://tempuri.org/", ResponseElementName="GetClientByNameAndPIDForMIB2_Response", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        [return: System.Xml.Serialization.XmlElementAttribute("fld_result")]
        public string GetClientByNameAndPIDForMIB2(string fld_admin_username, string fld_admin_password, string fld_operator_username, string fld_operator_password, string fld_first_name, string fld_last_name, string fld_pid_number, out string fld_session_id) {
            object[] results = this.Invoke("GetClientByNameAndPIDForMIB2", new object[] {
                        fld_admin_username,
                        fld_admin_password,
                        fld_operator_username,
                        fld_operator_password,
                        fld_first_name,
                        fld_last_name,
                        fld_pid_number});
            fld_session_id = ((string)(results[1]));
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void GetClientByNameAndPIDForMIB2Async(string fld_admin_username, string fld_admin_password, string fld_operator_username, string fld_operator_password, string fld_first_name, string fld_last_name, string fld_pid_number) {
            this.GetClientByNameAndPIDForMIB2Async(fld_admin_username, fld_admin_password, fld_operator_username, fld_operator_password, fld_first_name, fld_last_name, fld_pid_number, null);
        }
        
        /// <remarks/>
        public void GetClientByNameAndPIDForMIB2Async(string fld_admin_username, string fld_admin_password, string fld_operator_username, string fld_operator_password, string fld_first_name, string fld_last_name, string fld_pid_number, object userState) {
            if ((this.GetClientByNameAndPIDForMIB2OperationCompleted == null)) {
                this.GetClientByNameAndPIDForMIB2OperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetClientByNameAndPIDForMIB2OperationCompleted);
            }
            this.InvokeAsync("GetClientByNameAndPIDForMIB2", new object[] {
                        fld_admin_username,
                        fld_admin_password,
                        fld_operator_username,
                        fld_operator_password,
                        fld_first_name,
                        fld_last_name,
                        fld_pid_number}, this.GetClientByNameAndPIDForMIB2OperationCompleted, userState);
        }
        
        private void OnGetClientByNameAndPIDForMIB2OperationCompleted(object arg) {
            if ((this.GetClientByNameAndPIDForMIB2Completed != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetClientByNameAndPIDForMIB2Completed(this, new GetClientByNameAndPIDForMIB2CompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1055.0")]
    public delegate void GetClientByNameAndPIDForMIB2CompletedEventHandler(object sender, GetClientByNameAndPIDForMIB2CompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.6.1055.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetClientByNameAndPIDForMIB2CompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetClientByNameAndPIDForMIB2CompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
        
        /// <remarks/>
        public string fld_session_id {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[1]));
            }
        }
    }
}

#pragma warning restore 1591