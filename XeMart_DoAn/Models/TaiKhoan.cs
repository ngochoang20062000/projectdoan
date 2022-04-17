namespace XeMart_DoAn.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TaiKhoan()
        {
            GioHangs = new HashSet<GioHang>();
        }

        [Key]
        public int MaTK { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        [Required]
        [StringLength(50)]
        public string MatKhau { get; set; }

        [Required]
        [StringLength(50)]
        public string HoTen { get; set; }

        [Column(TypeName = "ntext")]
        public string DiaChi { get; set; }

        [StringLength(10)]
        public string SoDienThoai { get; set; }

        [StringLength(50)]
        public string Anh { get; set; }

        public bool TinhTrang { get; set; }

        public int MaQuyen { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GioHang> GioHangs { get; set; }

        public virtual PhanQuyen PhanQuyen { get; set; }
    }
}
