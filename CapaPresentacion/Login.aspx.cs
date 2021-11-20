using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaLogicaNegocio;

namespace CapaPresentacion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario objUsuario = UsuarioLN.getInstance().AccesoSistema(txtUserName.Text, txtPassword.Text);
            if(objUsuario != null)
            {
                Response.Write("<script> alert('USUARIO CORRECTO')</script>");
                Response.Redirect("Administrador.aspx");
            }
            else
            {
                Response.Write("<script> alert('USUARIO INCORRECTO')</script>");
            }
        }
    }
}