using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Usuario
    {
        public int idUser { get; set; }
        public String userName { get; set; }
        public String email { get; set; }
        public String password { get; set; }
        public int rol { get; set; }
        public String telefono { get; set; }
        public String direccion { get; set; }
        public Usuario() { }

        public Usuario(int idUser, String userName, String email, String password, int rol, String telefono, string direccion)
        {
            this.idUser = idUser;
            this.userName = userName;
            this.email = email;
            this.password = password;
            this.rol = rol;
            this.telefono = telefono;
            this.direccion = direccion;
        }
    }
}
