//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sistem_Informasi_BEM.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class msdeparteman
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public msdeparteman()
        {
            this.msanggotabems = new HashSet<msanggotabem>();
            this.trrapats = new HashSet<trrapat>();
        }
    
        public int iddepartemen { get; set; }
        [Required(ErrorMessage = "Departemen tidak boleh kosong")]
        [StringLength(50)]
        [RegularExpression(@"^[a-zA-Z\s]+$", ErrorMessage = "Format Nama Salah")]
        public string namadepartemen { get; set; }
        public Nullable<int> status { get; set; }
        public string creaby { get; set; }
        public Nullable<System.DateTime> creadate { get; set; }
        public string modiby { get; set; }
        public Nullable<System.DateTime> modidate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<msanggotabem> msanggotabems { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<trrapat> trrapats { get; set; }
    }
}
