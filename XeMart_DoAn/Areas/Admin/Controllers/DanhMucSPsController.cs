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
    public class DanhMucSPsController : Controller
    {
        private DienThoai db = new DienThoai();

        // GET: Admin/DanhMucSPs
        public ActionResult Index(int? page, string error)
        {
            if (error != null)
                ViewBag.Error = error;
            var danhmuc = db.DanhMucSPs.OrderBy(s => s.MaDM);
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return View(danhmuc.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/DanhMucSPs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DanhMucSP danhMucSP = db.DanhMucSPs.Find(id);
            if (danhMucSP == null)
            {
                return HttpNotFound();
            }
            return View(danhMucSP);
        }

        // GET: Admin/DanhMucSPs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/DanhMucSPs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaDM,TenDM")] DanhMucSP danhMucSP)
        {
            if (ModelState.IsValid)
            {
                db.DanhMucSPs.Add(danhMucSP);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(danhMucSP);
        }

        // GET: Admin/DanhMucSPs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DanhMucSP danhMucSP = db.DanhMucSPs.Find(id);
            if (danhMucSP == null)
            {
                return HttpNotFound();
            }
            return View(danhMucSP);
        }

        // POST: Admin/DanhMucSPs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaDM,TenDM")] DanhMucSP danhMucSP)
        {
            if (ModelState.IsValid)
            {
                db.Entry(danhMucSP).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(danhMucSP);
        }

        // GET: Admin/DanhMucSPs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DanhMucSP danhMucSP = db.DanhMucSPs.Find(id);
            if (danhMucSP == null)
            {
                return HttpNotFound();
            }
            return View(danhMucSP);
        }

        // POST: Admin/DanhMucSPs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {

            DanhMucSP danhMucSP = db.DanhMucSPs.Find(id);
            try
            {
                db.DanhMucSPs.Remove(danhMucSP);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index", "DanhMucSPs", new { error = "Không xóa được bản ghi này !!!" });
            }
        }
        public ActionResult DeleteConfirmedCustom(int id)
        {
            DanhMucSP danhMucSP = db.DanhMucSPs.Find(id);
            try
            {
                db.DanhMucSPs.Remove(danhMucSP);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index", "DanhMucSPs", new { error = "Không xóa được bản ghi này !!!" });
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
