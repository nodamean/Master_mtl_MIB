using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(mtl_MIB.Startup))]
namespace mtl_MIB
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
