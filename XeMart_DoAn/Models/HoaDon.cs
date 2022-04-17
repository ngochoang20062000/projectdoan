namespace XeMart_DoAn.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoaDon")]
    public partial class HoaDon
    {
        [Key]
        public int MaHD { get; set; }

        public DateTime NgayTao { get; set; }

        [Required]
        [StringLength(100)]
        public string HinhThucVanChuyen { get; set; }

        [Required]
        [StringLength(100)]
        public string HinhThucThanhToan { get; set; }

        public int MaGioHang { get; set; }

        [Column(TypeName = "ntext")]
        public string GhiChu { get; set; }

        [Required]
        [StringLength(50)]
        public string HoTen { get; set; }

        [Column(TypeName = "ntext")]
        public string DiaChi { get; set; }

        [StringLength(10)]
        public string SoDienThoai { get; set; }

        [Required]
        [StringLength(100)]
        public string TinhTrang { get; set; }

        public virtual GioHang GioHang { get; set; }
    }
}
