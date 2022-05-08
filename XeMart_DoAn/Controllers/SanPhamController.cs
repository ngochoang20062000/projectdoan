using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using XeMart_DoAn.Models;

namespace XeMart_DoAn.Controllers
{
    public class SanPhamController : Controller
    {
        DienThoai db = new DienThoai();
        // GET: SanPham
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
        public ActionResult XemSanPhamTheoDanhMuc(string id)
        {
            var sanphams = db.SanPhams.Where(s => s.MaDM.ToString().Equals(id)).Select(s => s);
            int madm = int.Parse(id);
            List<DanhMucSP> s1 = new List<DanhMucSP>();
            s1 = db.DanhMucSPs.Where(h => h.MaDM == madm).ToList();
            ViewBag.TenDM = s1[0].TenDM;
            return View(sanphams);
        }
        public ActionResult XemSanPhamTheoHSX(string id = "")
        {
            var sanphams = db.SanPhams.Where(s => s.MaHSX.ToString().Equals(id)).Select(s => s);
            int mahsx = int.Parse(id);
            List<HangSanXuat> s1 = new List<HangSanXuat>();
            s1 = db.HangSanXuats.Where(h => h.MaHSX == mahsx).ToList();
            ViewBag.TenDM = s1[0].TenHSX;
            return View(sanphams);
        }
        public ActionResult XemSanPhamTheoMauSac(string id)
        {
            var sanphams = db.SanPhams.Where(s => s.MaMau.ToString().Equals(id)).Select(s => s);
            int mamau = int.Parse(id);
            List<MauSac> s1 = new List<MauSac>();
            s1 = db.MauSacs.Where(h => h.MaMau == mamau).ToList();
            ViewBag.TenMau = s1[0].TenMau;
            return View(sanphams);
        }
    }
}