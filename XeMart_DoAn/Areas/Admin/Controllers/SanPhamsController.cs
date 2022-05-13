using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using XeMart_DoAn.Models;

namespace XeMart_DoAn.Areas.Admin.Controllers
{
    public class SanPhamsController : Controller
    {
        private DienThoai db = new DienThoai();

        // GET: Admin/SanPhams
        public ActionResult Index(int? page, string error, string maHSX)
        {

            if (error != null)
                ViewBag.Error = error;
            var sanPham = db.SanPhams.Include(s => s.HangSanXuat);
            ViewBag.HangSX = db.HangSanXuats.ToList();
            if (maHSX != null && maHSX != "macdinh")
            {
                sanPham = sanPham.Where(s => s.MaHSX.ToString().Equals(maHSX));
                ViewBag.MaHSX = maHSX;
            }
            sanPham = sanPham.OrderBy(s => s.MaSP);
            int pageSize = 7;
            int pageNumber = (page ?? 1);
            return View(sanPham.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult TimKiem(string strSearch, int? page)
        {
            var sanpham = db.SanPhams.ToList();
            if (strSearch != null)
            {
                sanpham = db.SanPhams.Where(s => s.TenSP.ToUpper().Trim().Contains(strSearch.ToUpper().Trim())).ToList();
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
        // GET: Admin/SanPhams/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // GET: Admin/SanPhams/Create
        public ActionResult Create()
        {
            ViewBag.MaDM = new SelectList(db.DanhMucSPs, "MaDM", "TenDM");
            ViewBag.MaHSX = new SelectList(db.HangSanXuats, "MaHSX", "TenHSX");
            ViewBag.MaMau = new SelectList(db.MauSacs, "MaMau", "TenMau");
            return View();
        }

        // POST: Admin/SanPhams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSP,TenSP,Gia,MaHSX,TinhTrang,HinhAnh,ManHinh,HDH,CPU,Camera,Pin,Ram,BoNhoTrong,TheNhoNgoai,CameraTruoc,SoLuongTon,MaMau,MaDM")] SanPham sanPham)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    sanPham.HinhAnh = "";
                    var f = Request.Files["ImageFile"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadPath = Server.MapPath("~/wwwroot/images/" + FileName);
                        f.SaveAs(UploadPath);
                        sanPham.HinhAnh = FileName;
                    }
                    db.SanPhams.Add(sanPham);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi nhập dữ liệu! " + ex.Message;
                ViewBag.MaDM = new SelectList(db.DanhMucSPs, "MaDM", "TenDM", sanPham.MaDM);
                return View(sanPham);
            }
        }

        // GET: Admin/SanPhams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaDM = new SelectList(db.DanhMucSPs, "MaDM", "TenDM", sanPham.MaDM);
            ViewBag.MaHSX = new SelectList(db.HangSanXuats, "MaHSX", "TenHSX", sanPham.MaHSX);
            ViewBag.MaMau = new SelectList(db.MauSacs, "MaMau", "TenMau", sanPham.MaMau);
            return View(sanPham);
        }

        // POST: Admin/SanPhams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSP,TenSP,Gia,MaHSX,TinhTrang,HinhAnh,ManHinh,HDH,CPU,Camera,Pin,Ram,BoNhoTrong,TheNhoNgoai,CameraTruoc,SoLuongTon,MaMau,MaDM")] SanPham sanPham)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var f = Request.Files["ImageFile"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadPath = Server.MapPath("~/wwwroot/images/" + FileName);
                        f.SaveAs(UploadPath);
                        sanPham.HinhAnh = FileName;
                    }
                    //else
                    //{
                    //    string UploadPath = Server.MapPath("~/wwwroot/image/" + sanPham.AnhSP);
                    //}
                    db.Entry(sanPham).State = EntityState.Modified;
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi nhập dữ liệu! " + ex.Message;
                ViewBag.MaDM = new SelectList(db.DanhMucSPs, "MaDM", "TenDM", sanPham.MaDM);
                return View(sanPham);
            }
        }

        // GET: Admin/SanPhams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: Admin/SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SanPham sanPham = db.SanPhams.Find(id);
            db.SanPhams.Remove(sanPham);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult DeleteConfirmedCustom(int id)
        {
            SanPham sanPham = db.SanPhams.Find(id);

            try
            {
                db.SanPhams.Remove(sanPham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index", "SanPhams", new { error = "Không  xóa  được  bản  ghi  này! " });
            }
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
