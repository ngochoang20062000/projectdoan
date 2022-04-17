namespace XeMart_DoAn.Models
{
    using System;
    using System.Collections.Generic;
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
        public int MaSP { get; set; }

        [Required]
        [StringLength(80)]
        public string TenSP { get; set; }

        [Column(TypeName = "money")]
        public decimal Gia { get; set; }

        public int? MaHSX { get; set; }

        [StringLength(80)]
        public string TinhTrang { get; set; }

        [StringLength(128)]
        public string HinhAnh { get; set; }

        [StringLength(128)]
        public string ManHinh { get; set; }

        [StringLength(128)]
        public string HDH { get; set; }

        [StringLength(128)]
        public string CPU { get; set; }

        [StringLength(128)]
        public string Camera { get; set; }

        [StringLength(128)]
        public string Pin { get; set; }

        [StringLength(128)]
        public string Ram { get; set; }

        [StringLength(128)]
        public string BoNhoTrong { get; set; }

        [StringLength(128)]
        public string TheNhoNgoai { get; set; }

        [StringLength(128)]
        public string CameraTruoc { get; set; }

        public int SoLuongTon { get; set; }

        public int MaMau { get; set; }

        public int MaDM { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Chi_Tiet_Gio_Hang> Chi_Tiet_Gio_Hang { get; set; }

        public virtual DanhMucSP DanhMucSP { get; set; }

        public virtual HangSanXuat HangSanXuat { get; set; }

        public virtual MauSac MauSac { get; set; }
    }
}
