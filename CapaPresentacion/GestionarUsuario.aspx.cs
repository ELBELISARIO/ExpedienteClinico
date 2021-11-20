using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaLogicaNegocio;
using System.Web.Services;
using System.Web.Script.Serialization;

namespace CapaPresentacion
{
    public partial class GestionarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Page.ClientScript.RegisterClientScriptInclude("pacientejs", "js/paciente.js");
            }
        }

        private Usuario GetEntity()
        {
            Usuario objUsuario = new Usuario();
            objUsuario.userName = txtUsername.Text;
            objUsuario.email = txtEmail.Text;
            objUsuario.password = txtPassword.Text;
            objUsuario.telefono = txtTelefono.Text;
            objUsuario.direccion = txtDireccion.Text;
            objUsuario.rol = Convert.ToInt32(ddlRol.SelectedValue);
            return objUsuario;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            // Registro del paciente
            Usuario objUsuario = GetEntity();
            // enviar a la capa de logica de negocio
            bool response = UsuarioLN.getInstance().RegistrarUsuario(objUsuario);
            if (response)
            {
                Response.Write("<script>alert('REGISTRO CORRECTO.')</script>");
            }
            else
            {
                Response.Write("<script>alert('REGISTRO INCORRECTO.')</script>");
            }
        }

        [WebMethod]
        public static List<Usuario> ListarUsuarios()
        {
            List<Usuario> Lista = null;
            try
            {
                Lista = UsuarioLN.getInstance().ListarUsuarios();
            }
            catch (Exception ex)
            {
                Lista = null;
            }
            return Lista;
        }

        [WebMethod]
        public static bool ActualizarDatosUsuario(String id, String password)
        {
            Usuario objUsuario = new Usuario()
            {
                idUser = Convert.ToInt32(id),
                password = password
            };

            bool ok = UsuarioLN.getInstance().ActualizarUsuario(objUsuario);
            return ok;
        }

        [WebMethod]
        public static bool EliminarDatosUsuario(String id)
        {
            Int32 idUsurio= Convert.ToInt32(id);

            bool ok = UsuarioLN.getInstance().EliminarUsuario(idUsurio);

            return ok;
        }
    }
}