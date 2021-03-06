﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace mtl_MIB
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkID=303951
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
                            "~/Scripts/WebForms/WebForms.js",
                            "~/Scripts/WebForms/WebUIValidation.js",
                            "~/Scripts/WebForms/MenuStandards.js",
                            "~/Scripts/WebForms/Focus.js",
                            "~/Scripts/WebForms/GridView.js",
                            "~/Scripts/WebForms/DetailsView.js",
                            "~/Scripts/WebForms/TreeView.js",
                            "~/Scripts/WebForms/WebParts.js"));

            // Order is very important for these files to work, they have explicit dependencies
            bundles.Add(new ScriptBundle("~/bundles/MsAjaxJs").Include(
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"));

            // Use the Development version of Modernizr to develop with and learn from. Then, when you’re
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                            "~/Scripts/modernizr-*"));

            ScriptManager.ScriptResourceMapping.AddDefinition(
                "respond",
                new ScriptResourceDefinition
                {
                    Path = "~/Scripts/respond.min.js",
                    DebugPath = "~/Scripts/respond.js",
                });
            ScriptManager.ScriptResourceMapping.AddDefinition(
               "inputmask",
               new ScriptResourceDefinition
               {
                   Path = "~/Scripts/jquery.inputmask.js",
                   DebugPath = "~/Scripts/jquery.inputmask.js",
               });
            ScriptManager.ScriptResourceMapping.AddDefinition(
              "validate",
              new ScriptResourceDefinition
              {
                  Path = "~/Scripts/jquery.validate.min.js",
                  DebugPath = "~/Scripts/jquery.validate.min.js",
              });

            ScriptManager.ScriptResourceMapping.AddDefinition(
             "dataTables",
             new ScriptResourceDefinition
             {
                 Path="~/Scripts/dataTables.min.js",
                 DebugPath = "~/Scripts/dataTables.min.js",
             });
            ScriptManager.ScriptResourceMapping.AddDefinition(
               "jquery",
               new ScriptResourceDefinition
               {
                   Path = "~/Scripts/jquery-1.11.3.min.js",
                   DebugPath = "~/Scripts/jquery-1.11.3.min.js",
               });
        }
    }
}