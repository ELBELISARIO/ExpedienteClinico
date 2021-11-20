using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Paciente
    {
        public String Curp { get; set; }
        public String Nombres { get; set; }
        public String ApPaterno { get; set; }
        public String ApMaterno { get; set; }
        public String FecNac { get; set; }
        public String EdoNac { get; set; }
        public char Sexo { get; set; }
        public String NacOrigen { get; set; }
        public String Folio { get; set; }
        public String Estado { get; set; }
        public String Municipio { get; set; }
        public String Localidad { get; set; }
        public String TipoBeneficiario { get; set; }
        public String ClaveDependencia { get; set; }
        public String ClavePrograma { get; set; }

        public Paciente() { }

        public Paciente(string curp, string nombres, string apPaterno, string apMaterno, string fecNac, string edoNac, char sexo, string nacOrigen, string folio, string estado, string municipio, string localidad, string tipoBeneficiario, string claveDependencia, string clavePrograma)
        {
            this.Curp = curp;
            this.Nombres = nombres;
            this.ApPaterno = apPaterno;
            this.ApMaterno = apMaterno;
            this.FecNac = fecNac;
            this.EdoNac = edoNac;
            this.Sexo = sexo;
            this.NacOrigen = nacOrigen;
            this.Folio = folio;
            this.Estado = estado;
            this.Municipio = municipio;
            this.Localidad = localidad;
            this.TipoBeneficiario = tipoBeneficiario;
            this.ClaveDependencia = claveDependencia;
            this.ClavePrograma = clavePrograma;
        }
    }
}
