using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaAccesoDatos;

namespace CapaLogicaNegocio
{
    public class UsuarioLN
    {
        #region "PATRON SINGLETON"
        private static UsuarioLN objUsuario = null;
        private UsuarioLN() { }
        public static UsuarioLN getInstance()
        {
            if (objUsuario == null)
            {
                objUsuario = new UsuarioLN();
            }
            return objUsuario;
        }
        #endregion

        public Usuario AccesoSistema(String user, String pass)
        {
            try
            {
                return UsuarioDAO.getInstance().AccesoSistema(user, pass);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool RegistrarUsuario(Usuario objUsuario)
        {
            try
            {
                return UsuarioDAO.getInstance().RegistrarUsuario(objUsuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Usuario> ListarUsuarios()
        {
            try
            {
                return UsuarioDAO.getInstance().ListarUsuarios();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool ActualizarUsuario(Usuario objUsuario)
        {
            try
            {
                return UsuarioDAO.getInstance().ActualizarUsuario(objUsuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool EliminarUsuario(int idUser)
        {
            try
            {
                return UsuarioDAO.getInstance().EliminarUsuario(idUser);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
