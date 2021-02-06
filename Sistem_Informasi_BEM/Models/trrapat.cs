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

    public partial class trrapat
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public trrapat()
        {
            this.trnotulensis = new HashSet<trnotulensi>();
        }
    
        public int idrapat { get; set; }
        public Nullable<int> iddepartemen { get; set; }

        [Required(ErrorMessage = "Judul Rapat tidak boleh kosong")]
        [Display(Name = "Judul Rapat")]
        public string judulrapat { get; set; }
        [Display(Name = "Tanggal Rapat")]
        [Required(ErrorMessage = "Tanggal Rapat tidak boleh kosong")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-ddThh:mm:ss}", ApplyFormatInEditMode = true)]
        public DateTime tglrapat { get; set; }
        public Nullable<int> status { get; set; }
        public string creaby { get; set; }
        public Nullable<System.DateTime> creadate { get; set; }
        public string modiby { get; set; }
        public Nullable<System.DateTime> modidate { get; set; }
    
        public virtual msdeparteman msdeparteman { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<trnotulensi> trnotulensis { get; set; }
    }
}
