using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using XeMart_DoAn.Models;

namespace XeMart_DoAn.Controllers
{
    public class HomeController : Controller
    {
        DienThoai db = new DienThoai();
        public ActionResult Index(int? page, string id, string loc)
        {
            List<SanPham> dienthoais = new List<SanPham>();           
            dienthoais = db.SanPhams.Select(ma => ma).ToList();

            var sanpham = db.SanPhams.Where(s => s.MaDM.ToString().Equals(id)).Select(s => s);

            if (loc != null)
            {
                if (loc.Equals("tang"))
                {
                    dienthoais = db.SanPhams.Select(ma => ma).OrderBy(s=> s.Gia).ToList();
                    ViewBag.Loc = loc;
                }
                else if (loc.Equals("giam"))
                {
                    dienthoais = db.SanPhams.Select(ma => ma).OrderByDescending(s => s.Gia).ToList();
                    ViewBag.Loc = loc;
                }
            }

            int pageSize = 20;
            int pageNumber = (page ?? 1);
            
            return View(dienthoais.ToPagedList(pageNumber, pageSize));
        }
        
        public ActionResult TimKiem(string strSearch, int? page)
        {
            var sanpham = db.SanPhams.ToList();
            if (strSearch != null)
            {
                sanpham = db.SanPhams.Where(s => s.TenSP.ToUpper().Trim().Contains(strSearch.ToUpper().Trim()) || s.Gia.ToString().Contains(strSearch.ToUpper().Trim())).ToList();
            }
            ViewBag.strSearch = strSearch;
            if (sanpham.Count > 0)
            {
                int pageSize = 12;
                int pageNumber = (page ?? 1);
                return View(sanpham.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                ViewBag.Thongbao = "Không có sản phẩm nào";
                return View();
            }
        }
        public ActionResult SanPham(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sp = db.SanPhams.Find(int.Parse(id));
            if (sp == null)
            {
                return HttpNotFound();
            }
            int madm = db.SanPhams.Find(int.Parse(id)).MaDM;
            ViewBag.ma = madm;

            List<SanPham> Sp = new List<SanPham>();
            Sp = db.SanPhams.Select(ma => ma).ToList();
            ViewBag.sp = Sp;


            List<DanhMucSP> s = new List<DanhMucSP>();
            s = db.DanhMucSPs.Where(h => h.MaDM == madm).ToList();
            ViewBag.TenDM = s[0].TenDM;

            return View(sp);
        }
        public PartialViewResult _Nav()
        {
            var danhmuc = db.DanhMucSPs.Select(d => d);
            return PartialView(danhmuc);
        }
        public ActionResult XemSanPhamTheoDanhMuc(string id)
        {
            List<SanPham> dienthoais = new List<SanPham>();
            if (id == null)
            {
                dienthoais = db.SanPhams.Select(ma => ma).ToList();
            }
            else
            {
                dienthoais = db.SanPhams.Where(ma => ma.MaDM.Equals(id)).Select(ma => ma).ToList();
            }
            return View(dienthoais);
        }
        public PartialViewResult HSX()
        {
            var hangsx = db.HangSanXuats.Select(d => d);
            return PartialView(hangsx);
        }
        public ActionResult XemSanPhamTheoHSX(string id)
        {
            List<SanPham> dienthoais = new List<SanPham>();
            if (id == null)
            {
                dienthoais = db.SanPhams.Select(ma => ma).ToList();
            }
            else
            {
                dienthoais = db.SanPhams.Where(ma => ma.MaHSX.Equals(id)).Select(ma => ma).ToList();
            }
            return View(dienthoais);
        }
        
    }
}