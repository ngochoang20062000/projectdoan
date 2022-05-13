namespace XeMart_DoAn.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoaDon")]
    public partial class HoaDon
    {
        [Key]
        public int MaHD { get; set; }

        [DisplayName("Ngày tạo")]
        public DateTime NgayTao { get; set; }

        [Required]
        [StringLength(100)]
        [DisplayName("Hình thức vận chuyển")]
        public string HinhThucVanChuyen { get; set; }

        [Required]
        [StringLength(100)]
        [DisplayName("Hình thức thanh toán")]
        public string HinhThucThanhToan { get; set; }

        public int MaGioHang { get; set; }

        [DisplayName("Ghi chú")]
        [Column(TypeName = "ntext")]
        public string GhiChu { get; set; }

        [Required]
        [StringLength(50)]
        [DisplayName("Họ tên")]
        public string HoTen { get; set; }

        [DisplayName("Địa chỉ")]
        [Column(TypeName = "ntext")]
        public string DiaChi { get; set; }

        [DisplayName("Số điện thoại")]
        [StringLength(10)]
        public string SoDienThoai { get; set; }

        [DisplayName("Tình trạng")]
        [Required]
        [StringLength(100)]
        public string TinhTrang { get; set; }

        public virtual GioHang GioHang { get; set; }
    }
}
