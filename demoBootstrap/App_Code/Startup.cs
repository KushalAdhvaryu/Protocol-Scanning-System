using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(demoBootstrap.Startup))]
namespace demoBootstrap
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
