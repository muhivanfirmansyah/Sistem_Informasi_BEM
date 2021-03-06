﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Sistem_Informasi_BEM.Models;

namespace Sistem_Informasi_BEM.Controllers
{
    public class LoginController : Controller
    {
        //object database
        private DBSIBEMEntities db = new DBSIBEMEntities();

        //Menampilkan Data
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(msanggotabem model)
        {
            using (DBSIBEMEntities objContext = new DBSIBEMEntities())
            {
                var objUser = objContext.msanggotabems.FirstOrDefault(x => x.nim == model.nim && x.password == model.password);
                if (objUser == null)
                {
                    ViewBag.Login = "Username dan Password yang anda masukan salah";
                    ModelState.Clear();
                    return View("Index");
                }
                else
                {
                    if (objUser.status == 0)
                    {
                        ViewBag.Login = "Anda sudah tidak aktif dan tidak mempunyai hak akses lagi";
                        ModelState.Clear();
                        return View("Index");
                    }
                    else
                    {
                        FormsAuthentication.SetAuthCookie(objUser.nama, true);
                        string role = objContext.msanggotabems.Where(m => m.nim == model.nim).FirstOrDefault().msjabatan.namajabatan;
                        string idukmhima = objContext.msanggotabems.Where(m => m.nim == model.nim).FirstOrDefault().msjabatan.idukm_hima.ToString();
                        string idDept = objContext.msanggotabems.Where(m => m.nim == model.nim).FirstOrDefault().msdeparteman.iddepartemen.ToString();
                        string departemen = objContext.msanggotabems.Where(m => m.nim == model.nim).FirstOrDefault().msdeparteman.namadepartemen.ToString();
                        Session["idUKM_Hima"] = idukmhima;
                        Session["idDept"] = idDept;
                        Session["Departemen"] = departemen;
                        Session["Jabatan"] = role;
                        Session["modiby"] = objUser.nama;
                        ViewBag.role = role;
                        this.Session["idanggota"] = objUser.idanggota;
                        if (role.Equals("Admin"))
                        {
                            return RedirectToAction("MenuAdmin");
                        }
                        else if (role.Contains("PIC"))
                        {
                            return RedirectToAction("MenuPIC");
                        }
                        else if (role.Contains("Departemen"))
                        {
                            return RedirectToAction("MenuBPH");
                        }
                        else
                        {
                            return RedirectToAction("MenuBPHUmum");
                        }
                    }
                }
            }
        }

        public ActionResult GetData()
        {
            //diagram 1
            int bph = db.msanggotabems.Where(x => x.iddepartemen == 1 && x.status == 1).Count();
            int spm = db.msanggotabems.Where(x => x.iddepartemen == 2 && x.status == 1).Count();
            int tik = db.msanggotabems.Where(x => x.iddepartemen == 3 && x.status == 1).Count();
            int orkes = db.msanggotabems.Where(x => x.iddepartemen == 4 && x.status == 1).Count();
            int hia = db.msanggotabems.Where(x => x.iddepartemen == 5 && x.status == 1).Count();

            //diagaram 2
            var avg = db.trkas.Where(x => x.idanggota == 23).Sum(x => x.nominal);
            int i = Convert.ToInt32(avg);
            var avg1 = db.trkas.Where(x => x.idanggota == 22).Sum(x => x.nominal);
            int i1 = Convert.ToInt32(avg1);
            var avg2 = db.trkas.Where(x => x.idanggota == 24).Sum(x => x.nominal);
            int i2 = Convert.ToInt32(avg2);

            Ratio obj = new Ratio();
            obj.BPH_UMUM = bph;
            obj.SPM = spm;
            obj.TIK = tik;
            obj.ORKES = orkes;
            obj.HIA = hia;

            obj.shifa = i;
            obj.puji = i1;
            obj.yusuf = i2;

            return Json(obj, JsonRequestBehavior.AllowGet);
        }

        public class Ratio
        {
            public int BPH_UMUM { get; set; }
            public int SPM { get; set; }
            public int TIK { get; set; }
            public int ORKES { get; set; }
            public int HIA { get; set; }
            public int shifa { get; set; }
            public int puji { get; set; }
            public int yusuf { get; set; }

        }

        public ActionResult ProfilAnggota()
        {
            ViewBag.Jabatan = this.Session["Jabatan"];
            ViewBag.Departemen = this.Session["Departemen"];
            var idanggota_ = Session["idanggota"];
            int idAgt = Convert.ToInt32(idanggota_);
            var msanggotas = db.msanggotabems.Include(m => m.msdeparteman).Include(m => m.msjabatan).Include(m => m.msperiode).Where(m => m.idanggota == idAgt);
            return View(msanggotas.ToList());
        }

        public ActionResult ProfilAnggotaPIC()
        {
            ViewBag.Jabatan = this.Session["Jabatan"];
            ViewBag.Departemen = this.Session["Departemen"];
            var idanggota_ = Session["idanggota"];
            int idAgt = Convert.ToInt32(idanggota_);
            var msanggotas = db.msanggotabems.Include(m => m.msdeparteman).Include(m => m.msjabatan).Include(m => m.msperiode).Where(m => m.idanggota == idAgt);
            return View(msanggotas.ToList());
        }

        public ActionResult ProfilAnggotaDept()
        {
            ViewBag.Jabatan = this.Session["Jabatan"];
            ViewBag.Departemen = this.Session["Departemen"];
            var idanggota_ = Session["idanggota"];
            int idAgt = Convert.ToInt32(idanggota_);
            var msanggotas = db.msanggotabems.Include(m => m.msdeparteman).Include(m => m.msjabatan).Include(m => m.msperiode).Where(m => m.idanggota == idAgt);
            return View(msanggotas.ToList());
        }

        public ActionResult ProfilAnggotaBPH()
        {
            ViewBag.Jabatan = this.Session["Jabatan"];
            ViewBag.Departemen = this.Session["Departemen"];
            var idanggota_ = Session["idanggota"];
            int idAgt = Convert.ToInt32(idanggota_);
            var msanggotas = db.msanggotabems.Include(m => m.msdeparteman).Include(m => m.msjabatan).Include(m => m.msperiode).Where(m => m.idanggota == idAgt);
            return View(msanggotas.ToList());
        }

        public ActionResult Home()
        {
            var news = db.msnews.Where(m => m.status == 1);
            return View(news.ToList());
        }

        public ActionResult MenuAdmin()
        {
            ViewBag.jumlah = db.msanggotabems.Where(x => x.status == 1).Count();
            ViewBag.Jabatan = this.Session["Jabatan"];
            ViewBag.Departemen = this.Session["Departemen"];
            return View();
        }
        public ActionResult MenuPIC()
        {
            ViewBag.jumlah = db.msanggotabems.Where(x => x.status == 1).Count();
            ViewBag.Jabatan = this.Session["Jabatan"];
            ViewBag.Departemen = this.Session["Departemen"];
            ViewBag.idanggota = this.Session["idanggota"];
            return View();
        }

        public ActionResult MenuBPH()
        {
            ViewBag.jumlah = db.msanggotabems.Where(x => x.status == 1).Count();
            ViewBag.Jabatan = this.Session["Jabatan"];
            ViewBag.Departemen = this.Session["Departemen"];
            return View();
        }

        public ActionResult MenuBPHUmum()
        {
            ViewBag.jumlah = db.msanggotabems.Where(x => x.status == 1).Count();
            ViewBag.Jabatan = this.Session["Jabatan"];
            ViewBag.Departemen = this.Session["Departemen"];
            return View();
        }

        public string uploadimage(HttpPostedFileBase file)
        {
            Random r = new Random();
            string path = "-1";
            int random = r.Next();
            if (file != null && file.ContentLength > 0)
            {
                string extension = Path.GetExtension(file.FileName);
                if (extension.ToLower().Equals(".jpg") || extension.ToLower().Equals(".jpeg") || extension.ToLower().Equals(".png"))
                {
                    try
                    {
                        path = Path.Combine(Server.MapPath("~/SaveImage"), random + Path.GetFileName(file.FileName));
                        file.SaveAs(path);
                        path = "~/SaveImage/" + random + Path.GetFileName(file.FileName);
                    }
                    catch
                    {
                        path = "";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Format Harus Sesuai');</script");
                }
            }
            else
            {
                path = "";
            }
            return path;
        }

        public ActionResult Lupapass()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Lupapass(msanggotabem msanggota)
        {
            using (DBSIBEMEntities objContext = new DBSIBEMEntities())
            {
                var objUser = objContext.msanggotabems.FirstOrDefault(x => x.email == msanggota.email);
                if (objUser != null)
                {
                    if (objUser.status == 0)
                    {
                        ViewBag.Login = "Akun anda tidak aktif dan tidak punya hak akses";
                        ModelState.Clear();
                        return View("Lupapass");
                    }
                    else
                    {
                        msanggotabem anggota = objContext.msanggotabems.Find(objUser.idanggota);
                        objContext.SaveChanges();
                        using (MailMessage mail = new MailMessage())
                        {
                            mail.From = new MailAddress("bempolmanasta@gmail.com");
                            mail.To.Add(msanggota.email);
                            mail.Subject = "Bem Polman Astra";
                            mail.Body = "<h2>Hello, " + objUser.nama +
                                "</h2>Berkaitan dengan website Sistem Informasi Bem, Berikut Terlampir detail informasi akun anda<br>"
                                + "Username : <b>" + objUser.nim + "</b><br>Password   : <b>" + objUser.password +
                                "</b><br>Sekian info yang dapat kami sampaikan atas perhatiannya kami ucapkan terimakasih." +
                                "<br><br>Admin";
                            mail.IsBodyHtml = true;

                            using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                            {
                                smtp.Credentials = new NetworkCredential("bempolmanasta@gmail.com", "bempolman");
                                smtp.EnableSsl = true;
                                smtp.Send(mail);
                            }
                        }
                    }
                    ViewBag.Login = "Username dan Password sudah terkirim, Cek Email anda";
                    ModelState.Clear();
                    return View("Lupapass");
                }
                else
                {
                    ViewBag.Login = "Email yang anda masukan Tidak sesuai";
                    ModelState.Clear();
                    return View("Lupapass");
                }
            }
        }


        public ActionResult EditPass()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EditPass(msanggotabem msanggota)
        {
            using (DBSIBEMEntities objContext = new DBSIBEMEntities())
            {
                var objUser = objContext.msanggotabems.FirstOrDefault(x => x.email == msanggota.email || x.password == msanggota.password);
                if (objUser != null)
                {
                    if (msanggota.creaby.Equals(msanggota.modiby))
                    {
                        msanggotabem anggota = objContext.msanggotabems.Find(objUser.idanggota);
                        anggota.password = msanggota.creaby;
                        objContext.SaveChanges();
                        using (MailMessage mail = new MailMessage())
                        {
                            mail.From = new MailAddress("bempolmanasta@gmail.com");
                            mail.To.Add(msanggota.email);
                            mail.Subject = "Bem Polman Astra";
                            mail.Body = "<h2>Hello, " + objUser.nama +
                                "</h2>Berkaitan dengan website Sistem Informasi Bem, Berikut Terlampir detail informasi akun anda<br>"
                                + "Username : <b>" + objUser.nim + "</b><br>Password   : <b>" + msanggota.creaby +
                                "</b><br>Sekian info yang dapat kami sampaikan atas perhatiannya kami ucapkan terimakasih." +
                                "<br><br>Admin";
                            mail.IsBodyHtml = true;

                            using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                            {
                                smtp.Credentials = new NetworkCredential("bempolmanasta@gmail.com", "bempolman");
                                smtp.EnableSsl = true;
                                smtp.Send(mail);
                            }
                        }
                        //
                        string role = objContext.msanggotabems.Where(m => m.email == anggota.email).FirstOrDefault().msjabatan.namajabatan;
                        ViewBag.role = role;
                        this.Session["idanggota"] = objUser.idanggota;
                        if (role.Equals("Admin"))
                        {
                            return RedirectToAction("MenuAdmin");
                        }
                        else if (role.Contains("PIC"))
                        {
                            return RedirectToAction("MenuPIC");
                        }
                        else if (role.Contains("Departemen"))
                        {
                            return RedirectToAction("MenuBPH");
                        }
                        else
                        {
                            return RedirectToAction("MenuBPHUmum");
                        }
                    }
                    else
                    {
                        ViewBag.Login = "Password Tidak Sama";
                        ModelState.Clear();
                        return View("EditPass");
                    }
                }
                else
                {
                    ViewBag.Login = "Data Tidak sesuai";
                    ModelState.Clear();
                    return View("EditPass");
                }
            }
        }

        public ActionResult EditAdmin(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            msanggotabem msanggotabem = db.msanggotabems.Find(id);
            if (msanggotabem == null)
            {
                return HttpNotFound();
            }
            ViewBag.Jabatan = this.Session["Jabatan"];
            ViewBag.Departemen = this.Session["Departemen"];
            ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
            ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
            ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
            return View(msanggotabem);
        }

        //mengedit data
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditAdmin(msanggotabem msanggotabem, string cek_email, string cek_nim, HttpPostedFileBase imgfile)
        {
            string path = uploadimage(imgfile);
            var cek = db.msanggotabems.FirstOrDefault(x => x.email == msanggotabem.email);
            if (msanggotabem.email == cek_email)
            {
                var cek2 = db.msanggotabems.FirstOrDefault(x => x.nim == msanggotabem.nim);
                if (msanggotabem.nim == cek_nim)
                {
                    if (ModelState.IsValid)
                    {
                        msanggotabem msanggotabems = db.msanggotabems.Find(msanggotabem.idanggota);
                        msanggotabems.nama = msanggotabem.nama;
                        msanggotabems.nim = msanggotabem.nim;
                        msanggotabems.no_telp = msanggotabem.no_telp;
                        msanggotabems.alamat = msanggotabem.alamat;
                        msanggotabems.email = msanggotabem.email;
                        msanggotabems.iddepartemen = msanggotabem.iddepartemen;
                        msanggotabems.idjabatan = msanggotabem.idjabatan;
                        msanggotabems.idperiode = msanggotabem.idperiode;
                        msanggotabems.modiby = msanggotabem.modiby;
                        msanggotabems.modidate = DateTime.Now;
                        if (path != "")
                        {
                            msanggotabems.foto = path;
                        }
                        db.SaveChanges();
                        return RedirectToAction("ProfilAnggota");
                    }
                }
                else
                {
                    if (cek2 != null)
                    {
                        ViewBag.Message = "NIM YANG ANDA MASUKAN SUDAH ADA";
                        ViewBag.Jabatan = this.Session["Jabatan"];
                        ViewBag.Departemen = this.Session["Departemen"];
                        ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                        ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                        ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                        return View(msanggotabem);
                    }
                    else
                    {
                        if (ModelState.IsValid)
                        {
                            msanggotabem msanggotabems = db.msanggotabems.Find(msanggotabem.idanggota);
                            msanggotabems.nama = msanggotabem.nama;
                            msanggotabems.nim = msanggotabem.nim;
                            msanggotabems.no_telp = msanggotabem.no_telp;
                            msanggotabems.alamat = msanggotabem.alamat;
                            msanggotabems.email = msanggotabem.email;
                            msanggotabems.iddepartemen = msanggotabem.iddepartemen;
                            msanggotabems.idjabatan = msanggotabem.idjabatan;
                            msanggotabems.idperiode = msanggotabem.idperiode;
                            msanggotabems.modiby = msanggotabem.modiby;
                            msanggotabems.modidate = DateTime.Now;
                            if (path != "")
                            {
                                msanggotabems.foto = path;
                            }
                            db.SaveChanges();
                            return RedirectToAction("ProfilAnggota");
                        }
                    }
                }
                ViewBag.Jabatan = this.Session["Jabatan"];
                ViewBag.Departemen = this.Session["Departemen"];
                ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                return View(msanggotabem);
            }
            else
            {
                if (cek != null)
                {
                    ViewBag.Message = "EMAIL YANG ANDA MASUKAN SUDAH ADA";
                    ViewBag.Jabatan = this.Session["Jabatan"];
                    ViewBag.Departemen = this.Session["Departemen"];
                    ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                    ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                    ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                    return View(msanggotabem);
                }
                else
                {
                    if (ModelState.IsValid)
                    {
                        msanggotabem msanggotabems = db.msanggotabems.Find(msanggotabem.idanggota);
                        msanggotabems.nama = msanggotabem.nama;
                        msanggotabems.nim = msanggotabem.nim;
                        msanggotabems.no_telp = msanggotabem.no_telp;
                        msanggotabems.alamat = msanggotabem.alamat;
                        msanggotabems.email = msanggotabem.email;
                        msanggotabems.iddepartemen = msanggotabem.iddepartemen;
                        msanggotabems.idjabatan = msanggotabem.idjabatan;
                        msanggotabems.idperiode = msanggotabem.idperiode;
                        msanggotabems.modiby = msanggotabem.modiby;
                        msanggotabems.modidate = DateTime.Now;
                        if (path != "")
                        {
                            msanggotabems.foto = path;
                        }
                        db.SaveChanges();
                        return RedirectToAction("ProfilAnggota");
                    }
                    ViewBag.Jabatan = this.Session["Jabatan"];
                    ViewBag.Departemen = this.Session["Departemen"];
                    ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                    ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                    ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                    return View(msanggotabem);
                }
            }
        }

        public ActionResult EditPIC(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            msanggotabem msanggotabem = db.msanggotabems.Find(id);
            if (msanggotabem == null)
            {
                return HttpNotFound();
            }
            ViewBag.Jabatan = this.Session["Jabatan"];
            ViewBag.Departemen = this.Session["Departemen"];
            ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
            ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
            ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
            return View(msanggotabem);
        }

        //mengedit data
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPIC(msanggotabem msanggotabem, string cek_email, string cek_nim, HttpPostedFileBase imgfile)
        {
            string path = uploadimage(imgfile);
            var cek = db.msanggotabems.FirstOrDefault(x => x.email == msanggotabem.email);
            if (msanggotabem.email == cek_email)
            {
                var cek2 = db.msanggotabems.FirstOrDefault(x => x.nim == msanggotabem.nim);
                if (msanggotabem.nim == cek_nim)
                {
                    if (ModelState.IsValid)
                    {
                        msanggotabem msanggotabems = db.msanggotabems.Find(msanggotabem.idanggota);
                        msanggotabems.nama = msanggotabem.nama;
                        msanggotabems.nim = msanggotabem.nim;
                        msanggotabems.no_telp = msanggotabem.no_telp;
                        msanggotabems.alamat = msanggotabem.alamat;
                        msanggotabems.email = msanggotabem.email;
                        msanggotabems.iddepartemen = msanggotabem.iddepartemen;
                        msanggotabems.idjabatan = msanggotabem.idjabatan;
                        msanggotabems.idperiode = msanggotabem.idperiode;
                        msanggotabems.modiby = msanggotabem.modiby;
                        msanggotabems.modidate = DateTime.Now;
                        if (path != "")
                        {
                            msanggotabems.foto = path;
                        }
                        db.SaveChanges();
                        return RedirectToAction("ProfilAnggotaPIC");
                    }
                }
                else
                {
                    if (cek2 != null)
                    {
                        ViewBag.Message = "NIM YANG ANDA MASUKAN SUDAH ADA";
                        ViewBag.Jabatan = this.Session["Jabatan"];
                        ViewBag.Departemen = this.Session["Departemen"];
                        ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                        ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                        ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                        return View(msanggotabem);
                    }
                    else
                    {
                        if (ModelState.IsValid)
                        {
                            msanggotabem msanggotabems = db.msanggotabems.Find(msanggotabem.idanggota);
                            msanggotabems.nama = msanggotabem.nama;
                            msanggotabems.nim = msanggotabem.nim;
                            msanggotabems.no_telp = msanggotabem.no_telp;
                            msanggotabems.alamat = msanggotabem.alamat;
                            msanggotabems.email = msanggotabem.email;
                            msanggotabems.iddepartemen = msanggotabem.iddepartemen;
                            msanggotabems.idjabatan = msanggotabem.idjabatan;
                            msanggotabems.idperiode = msanggotabem.idperiode;
                            msanggotabems.modiby = msanggotabem.modiby;
                            msanggotabems.modidate = DateTime.Now;
                            if (path != "")
                            {
                                msanggotabems.foto = path;
                            }
                            db.SaveChanges();
                            return RedirectToAction("ProfilAnggotaPIC");
                        }
                    }
                }
                ViewBag.Jabatan = this.Session["Jabatan"];
                ViewBag.Departemen = this.Session["Departemen"];
                ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                return View(msanggotabem);
            }
            else
            {
                if (cek != null)
                {
                    ViewBag.Message = "EMAIL YANG ANDA MASUKAN SUDAH ADA";
                    ViewBag.Jabatan = this.Session["Jabatan"];
                    ViewBag.Departemen = this.Session["Departemen"];
                    ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                    ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                    ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                    return View(msanggotabem);
                }
                else
                {
                    if (ModelState.IsValid)
                    {
                        msanggotabem msanggotabems = db.msanggotabems.Find(msanggotabem.idanggota);
                        msanggotabems.nama = msanggotabem.nama;
                        msanggotabems.nim = msanggotabem.nim;
                        msanggotabems.no_telp = msanggotabem.no_telp;
                        msanggotabems.alamat = msanggotabem.alamat;
                        msanggotabems.email = msanggotabem.email;
                        msanggotabems.iddepartemen = msanggotabem.iddepartemen;
                        msanggotabems.idjabatan = msanggotabem.idjabatan;
                        msanggotabems.idperiode = msanggotabem.idperiode;
                        msanggotabems.modiby = msanggotabem.modiby;
                        msanggotabems.modidate = DateTime.Now;
                        if (path != "")
                        {
                            msanggotabems.foto = path;
                        }
                        db.SaveChanges();
                        return RedirectToAction("ProfilAnggotaPIC");
                    }
                    ViewBag.Jabatan = this.Session["Jabatan"];
                    ViewBag.Departemen = this.Session["Departemen"];
                    ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                    ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                    ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                    return View(msanggotabem);
                }
            }
        }

        public ActionResult EditBPH(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            msanggotabem msanggotabem = db.msanggotabems.Find(id);
            if (msanggotabem == null)
            {
                return HttpNotFound();
            }
            ViewBag.Jabatan = this.Session["Jabatan"];
            ViewBag.Departemen = this.Session["Departemen"];
            ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
            ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
            ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
            return View(msanggotabem);
        }

        //mengedit data
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditBPH(msanggotabem msanggotabem, string cek_email, string cek_nim, HttpPostedFileBase imgfile)
        {
            string path = uploadimage(imgfile);
            var cek = db.msanggotabems.FirstOrDefault(x => x.email == msanggotabem.email);
            if (msanggotabem.email == cek_email)
            {
                var cek2 = db.msanggotabems.FirstOrDefault(x => x.nim == msanggotabem.nim);
                if (msanggotabem.nim == cek_nim)
                {
                    if (ModelState.IsValid)
                    {
                        msanggotabem msanggotabems = db.msanggotabems.Find(msanggotabem.idanggota);
                        msanggotabems.nama = msanggotabem.nama;
                        msanggotabems.nim = msanggotabem.nim;
                        msanggotabems.no_telp = msanggotabem.no_telp;
                        msanggotabems.alamat = msanggotabem.alamat;
                        msanggotabems.email = msanggotabem.email;
                        msanggotabems.iddepartemen = msanggotabem.iddepartemen;
                        msanggotabems.idjabatan = msanggotabem.idjabatan;
                        msanggotabems.idperiode = msanggotabem.idperiode;
                        msanggotabems.modiby = msanggotabem.modiby;
                        msanggotabems.modidate = DateTime.Now;
                        if (path != "")
                        {
                            msanggotabems.foto = path;
                        }
                        db.SaveChanges();
                        return RedirectToAction("ProfilAnggotaDept");
                    }
                }
                else
                {
                    if (cek2 != null)
                    {
                        ViewBag.Message = "NIM YANG ANDA MASUKAN SUDAH ADA";
                        ViewBag.Jabatan = this.Session["Jabatan"];
                        ViewBag.Departemen = this.Session["Departemen"];
                        ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                        ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                        ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                        return View(msanggotabem);
                    }
                    else
                    {
                        if (ModelState.IsValid)
                        {
                            msanggotabem msanggotabems = db.msanggotabems.Find(msanggotabem.idanggota);
                            msanggotabems.nama = msanggotabem.nama;
                            msanggotabems.nim = msanggotabem.nim;
                            msanggotabems.no_telp = msanggotabem.no_telp;
                            msanggotabems.alamat = msanggotabem.alamat;
                            msanggotabems.email = msanggotabem.email;
                            msanggotabems.iddepartemen = msanggotabem.iddepartemen;
                            msanggotabems.idjabatan = msanggotabem.idjabatan;
                            msanggotabems.idperiode = msanggotabem.idperiode;
                            msanggotabems.modiby = msanggotabem.modiby;
                            msanggotabems.modidate = DateTime.Now;
                            if (path != "")
                            {
                                msanggotabems.foto = path;
                            }
                            db.SaveChanges();
                            return RedirectToAction("ProfilAnggotaDept");
                        }
                    }
                }
                ViewBag.Jabatan = this.Session["Jabatan"];
                ViewBag.Departemen = this.Session["Departemen"];
                ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                return View(msanggotabem);
            }
            else
            {
                if (cek != null)
                {
                    ViewBag.Message = "EMAIL YANG ANDA MASUKAN SUDAH ADA";
                    ViewBag.Jabatan = this.Session["Jabatan"];
                    ViewBag.Departemen = this.Session["Departemen"];
                    ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                    ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                    ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                    return View(msanggotabem);
                }
                else
                {
                    if (ModelState.IsValid)
                    {
                        msanggotabem msanggotabems = db.msanggotabems.Find(msanggotabem.idanggota);
                        msanggotabems.nama = msanggotabem.nama;
                        msanggotabems.nim = msanggotabem.nim;
                        msanggotabems.no_telp = msanggotabem.no_telp;
                        msanggotabems.alamat = msanggotabem.alamat;
                        msanggotabems.email = msanggotabem.email;
                        msanggotabems.iddepartemen = msanggotabem.iddepartemen;
                        msanggotabems.idjabatan = msanggotabem.idjabatan;
                        msanggotabems.idperiode = msanggotabem.idperiode;
                        msanggotabems.modiby = msanggotabem.modiby;
                        msanggotabems.modidate = DateTime.Now;
                        if (path != "")
                        {
                            msanggotabems.foto = path;
                        }
                        db.SaveChanges();
                        return RedirectToAction("ProfilAnggotaDept");
                    }
                    ViewBag.Jabatan = this.Session["Jabatan"];
                    ViewBag.Departemen = this.Session["Departemen"];
                    ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                    ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                    ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                    return View(msanggotabem);
                }
            }
        }

        public ActionResult EditBPHUmum(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            msanggotabem msanggotabem = db.msanggotabems.Find(id);
            if (msanggotabem == null)
            {
                return HttpNotFound();
            }
            ViewBag.Jabatan = this.Session["Jabatan"];
            ViewBag.Departemen = this.Session["Departemen"];
            ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
            ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
            ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
            return View(msanggotabem);
        }

        //mengedit data
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditBPHUmum(msanggotabem msanggotabem, string cek_email, string cek_nim, HttpPostedFileBase imgfile)
        {
            string path = uploadimage(imgfile);
            var cek = db.msanggotabems.FirstOrDefault(x => x.email == msanggotabem.email);
            if (msanggotabem.email == cek_email)
            {
                var cek2 = db.msanggotabems.FirstOrDefault(x => x.nim == msanggotabem.nim);
                if (msanggotabem.nim == cek_nim)
                {
                    if (ModelState.IsValid)
                    {
                        msanggotabem msanggotabems = db.msanggotabems.Find(msanggotabem.idanggota);
                        msanggotabems.nama = msanggotabem.nama;
                        msanggotabems.nim = msanggotabem.nim;
                        msanggotabems.no_telp = msanggotabem.no_telp;
                        msanggotabems.alamat = msanggotabem.alamat;
                        msanggotabems.email = msanggotabem.email;
                        msanggotabems.iddepartemen = msanggotabem.iddepartemen;
                        msanggotabems.idjabatan = msanggotabem.idjabatan;
                        msanggotabems.idperiode = msanggotabem.idperiode;
                        msanggotabems.modiby = msanggotabem.modiby;
                        msanggotabems.modidate = DateTime.Now;
                        if (path != "")
                        {
                            msanggotabems.foto = path;
                        }
                        db.SaveChanges();
                        return RedirectToAction("ProfilAnggotaBPH");
                    }
                }
                else
                {
                    if (cek2 != null)
                    {
                        ViewBag.Message = "NIM YANG ANDA MASUKAN SUDAH ADA";
                        ViewBag.Jabatan = this.Session["Jabatan"];
                        ViewBag.Departemen = this.Session["Departemen"];
                        ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                        ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                        ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                        return View(msanggotabem);
                    }
                    else
                    {
                        if (ModelState.IsValid)
                        {
                            msanggotabem msanggotabems = db.msanggotabems.Find(msanggotabem.idanggota);
                            msanggotabems.nama = msanggotabem.nama;
                            msanggotabems.nim = msanggotabem.nim;
                            msanggotabems.no_telp = msanggotabem.no_telp;
                            msanggotabems.alamat = msanggotabem.alamat;
                            msanggotabems.email = msanggotabem.email;
                            msanggotabems.iddepartemen = msanggotabem.iddepartemen;
                            msanggotabems.idjabatan = msanggotabem.idjabatan;
                            msanggotabems.idperiode = msanggotabem.idperiode;
                            msanggotabems.modiby = msanggotabem.modiby;
                            msanggotabems.modidate = DateTime.Now;
                            if (path != "")
                            {
                                msanggotabems.foto = path;
                            }
                            db.SaveChanges();
                            return RedirectToAction("ProfilAnggotaBPH");
                        }
                    }
                }
                ViewBag.Jabatan = this.Session["Jabatan"];
                ViewBag.Departemen = this.Session["Departemen"];
                ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                return View(msanggotabem);
            }
            else
            {
                if (cek != null)
                {
                    ViewBag.Message = "EMAIL YANG ANDA MASUKAN SUDAH ADA";
                    ViewBag.Jabatan = this.Session["Jabatan"];
                    ViewBag.Departemen = this.Session["Departemen"];
                    ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                    ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                    ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                    return View(msanggotabem);
                }
                else
                {
                    if (ModelState.IsValid)
                    {
                        msanggotabem msanggotabems = db.msanggotabems.Find(msanggotabem.idanggota);
                        msanggotabems.nama = msanggotabem.nama;
                        msanggotabems.nim = msanggotabem.nim;
                        msanggotabems.no_telp = msanggotabem.no_telp;
                        msanggotabems.alamat = msanggotabem.alamat;
                        msanggotabems.email = msanggotabem.email;
                        msanggotabems.iddepartemen = msanggotabem.iddepartemen;
                        msanggotabems.idjabatan = msanggotabem.idjabatan;
                        msanggotabems.idperiode = msanggotabem.idperiode;
                        msanggotabems.modiby = msanggotabem.modiby;
                        msanggotabems.modidate = DateTime.Now;
                        if (path != "")
                        {
                            msanggotabems.foto = path;
                        }
                        db.SaveChanges();
                        return RedirectToAction("ProfilAnggotaBPH");
                    }
                    ViewBag.Jabatan = this.Session["Jabatan"];
                    ViewBag.Departemen = this.Session["Departemen"];
                    ViewBag.iddepartemen = new SelectList(db.msdepartemen, "iddepartemen", "namadepartemen", msanggotabem.iddepartemen);
                    ViewBag.idjabatan = new SelectList(db.msjabatans, "idjabatan", "namajabatan", msanggotabem.idjabatan);
                    ViewBag.idperiode = new SelectList(db.msperiodes, "idperiode", "tahunperiode", msanggotabem.idperiode);
                    return View(msanggotabem);
                }
            }
        }
    }
}