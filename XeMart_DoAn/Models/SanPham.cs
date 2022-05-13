namespace XeMart_DoAn.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            Chi_Tiet_Gio_Hang = new HashSet<Chi_Tiet_Gio_Hang>();
        }

        [Key]
        [DisplayName("Mã sản phẩm")]
        public int MaSP { get; set; }

        [Required(ErrorMessage = "Tên sản phẩm không được để trống!")]
        [DisplayName("Tên sản phẩm")]
        public string TenSP { get; set; }

        [Required(ErrorMessage = "Giá không được để trống!")]
        [Column(TypeName = "money")]
        [DisplayName("Giá")]
        public decimal Gia { get; set; }

        [Required(ErrorMessage = "Mã hãng sản xuất không được để trống!")]
        [DisplayName("Mã hãng sản xuất")]
        public int? MaHSX { get; set; }

        [StringLength(80)]
        [DisplayName("Tình trạng")]
        public string TinhTrang { get; set; }


        [StringLength(128)]
        [DisplayName("Hình ảnh")]
        public string HinhAnh { get; set; }

        [StringLength(128)]
        [Required(ErrorMessage = "Màn hình không được để trống!")]
        [DisplayName("Màn hình")]
        public string ManHinh { get; set; }

        [StringLength(128)]
        [Required(ErrorMessage = "Hệ điều hành không được để trống!")]
        [DisplayName("Hệ điều hành")]
        public string HDH { get; set; }

        [StringLength(128)]
        [Required(ErrorMessage = "Cpu không được để trống!")]
        [DisplayName("Cpu")]
        public string CPU { get; set; }

        [StringLength(128)]
        [Required(ErrorMessage = "Camera không được để trống!")]
        [DisplayName("Camera")]
        public string Camera { get; set; }

        [StringLength(128)]
        [DisplayName("Pin")]
        [Required(ErrorMessage = "Pin không được để trống!")]
        public string Pin { get; set; }

        [StringLength(128)]
        [DisplayName("Ram")]
        [Required(ErrorMessage = "Ram không được để trống!")]
        public string Ram { get; set; }

        [Required(ErrorMessage = "Bộ nhớ trong không được để trống!")]
        [DisplayName("Bộ nhớ trong")]
        [StringLength(128)]
        public string BoNhoTrong { get; set; }

        [StringLength(128)]
        [DisplayName("Thẻ nhớ ngoài")]
        public string TheNhoNgoai { get; set; }

        [StringLength(128)]
        [Required(ErrorMessage = "Camera trước không được để trống!")]
        [DisplayName("Camera trước")]
        public string CameraTruoc { get; set; }

        [Required(ErrorMessage = "Số lượng tồn không được để trống!")]
        [DisplayName("Số lượng tồn")]
        public int SoLuongTon { get; set; }

        [DisplayName("Mã màu")]
        [Required(ErrorMessage = "Mã màu không được để trống!")]
        public int MaMau { get; set; }

        [Required(ErrorMessage = "Mã danh mục không được để trống!")]
        [DisplayName("Mã danh mục")]
        public int MaDM { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Chi_Tiet_Gio_Hang> Chi_Tiet_Gio_Hang { get; set; }

        public virtual DanhMucSP DanhMucSP { get; set; }

        public virtual HangSanXuat HangSanXuat { get; set; }

        public virtual MauSac MauSac { get; set; }
    }
}
