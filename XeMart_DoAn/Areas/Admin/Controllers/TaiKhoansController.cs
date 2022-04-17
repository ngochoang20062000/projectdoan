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
    public class TaiKhoansController : Controller
    {
        private DienThoai db = new DienThoai();

        // GET: Admin/TaiKhoans
        public ActionResult Index(int? page, string error)
        {
            if (error != null)
                ViewBag.Error = error;
            var taiKhoan = db.TaiKhoans.Include(t => t.PhanQuyen).ToList();
            int pageSize = 7;
            int pageNumber = (page ?? 1);
            return View(taiKhoan.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/TaiKhoans/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            if (taiKhoan == null)
            {
                return HttpNotFound();
            }
            return View(taiKhoan);
        }

        // GET: Admin/TaiKhoans/Create
        public ActionResult Create()
        {
            ViewBag.MaQuyen = new SelectList(db.PhanQuyens, "MaQuyen", "TenQuyen");
            return View();
        }

        // POST: Admin/TaiKhoans/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaTK,Email,MatKhau,HoTen,DiaChi,SoDienThoai,Anh,TinhTrang,MaQuyen")] TaiKhoan taiKhoan)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    taiKhoan.Anh = "";
                    var f = Request.Files["ImageFile"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UploadPath = Server.MapPath("~/wwwroot/images/" + FileName);
                        f.SaveAs(UploadPath);
                        taiKhoan.Anh = FileName;
                    }
                    db.TaiKhoans.Add(taiKhoan);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi nhập dữ liệu! " + ex.Message;
                ViewBag.MaQuyen = new SelectList(db.PhanQuyens, "MaQuyen", "TenQuyen", taiKhoan.MaQuyen);
                return View(taiKhoan);
            }

        }

        // GET: Admin/TaiKhoans/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            if (taiKhoan == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaQuyen = new SelectList(db.PhanQuyens, "MaQuyen", "TenQuyen", taiKhoan.MaQuyen);
            return View(taiKhoan);
        }

        // POST: Admin/TaiKhoans/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaTK,Email,MatKhau,HoTen,DiaChi,SoDienThoai,Anh,TinhTrang,MaQuyen")] TaiKhoan taiKhoan)
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
                        taiKhoan.Anh = FileName;
                    }
                    else
                    {
                        string UploadPath = Server.MapPath("~/wwwroot/images/" + taiKhoan.Anh);
                    }
                    db.Entry(taiKhoan).State = EntityState.Modified;
                    db.SaveChanges();
                    //if ((int)Session["idAdmin"] == taiKhoan.MaTK)
                    //{
                    //    Session["AnhAdmin"] = taiKhoan.Anh;
                    //    Session["HoTenAdmin"] = taiKhoan.HoTen;
                    //}

                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi nhập dữ liệu! " + ex.Message;
                ViewBag.MaQuyen = new SelectList(db.PhanQuyens, "MaQuyen", "TenQuyen", taiKhoan.MaQuyen);
                return View(taiKhoan);
            }
        }

        // GET: Admin/TaiKhoans/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            if (taiKhoan == null)
            {
                return HttpNotFound();
            }
            return View(taiKhoan);
        }

        // POST: Admin/TaiKhoans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            db.TaiKhoans.Remove(taiKhoan);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult DeleteConfirmedCustom(int id)
        {
            TaiKhoan taiKhoan = db.TaiKhoans.Find(id);
            db.TaiKhoans.Remove(taiKhoan);
            db.SaveChanges();
            return RedirectToAction("Index");
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
