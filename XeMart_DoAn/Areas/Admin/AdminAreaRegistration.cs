using System.Web.Mvc;

namespace XeMart_DoAn.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "DangNhap", controller = "DangNhapAdmin", id = UrlParameter.Optional }
            );
        }
    }
}