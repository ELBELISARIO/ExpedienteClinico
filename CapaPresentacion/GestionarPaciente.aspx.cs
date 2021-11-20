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
using System.Data;
using System.Data.SqlClient;

namespace CapaPresentacion
{
    public partial class frmGestionarPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                IniciarLLenadoDropDown();
                // Page.ClientScript.RegisterClientScriptInclude("pacientejs", "js/paciente.js");
            }
        }

        private void IniciarLLenadoDropDown()
        {
            ddlEstadoNacimiento.DataSource = Consultar("SELECT * FROM ESTADOS");
            ddlEstadoNacimiento.DataTextField = "ENTIDAD_FEDERATIVA";
            ddlEstadoNacimiento.DataValueField = "ENTIDAD_FEDERATIVA";
            ddlEstadoNacimiento.DataBind();
            ddlEstadoNacimiento.Items.Insert(0, new ListItem("[Seleccionar]", "0"));

            ddlNacionalidad.DataSource = Consultar("SELECT * FROM NACIONALIDAD");
            ddlNacionalidad.DataTextField = "PAIS";
            ddlNacionalidad.DataValueField = "PAIS";
            ddlNacionalidad.DataBind();
            ddlNacionalidad.Items.Insert(0, new ListItem("[Seleccionar]", "0"));

            ddlEstado.DataSource = Consultar("SELECT * FROM ESTADOS");
            ddlEstado.DataTextField = "ENTIDAD_FEDERATIVA";
            ddlEstado.DataValueField = "ENTIDAD_FEDERATIVA";
            ddlEstado.DataBind();
            ddlEstado.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            //ddlMunicipio.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            //ddlEstado.Items.Insert(0, new ListItem("[Seleccionar]", "0"))

            ddlMunicipio.DataSource = Consultar("SELECT * FROM MUNICIPIOS");
            ddlMunicipio.DataTextField = "MUNICIPIO";
            ddlMunicipio.DataValueField = "MUNICIPIO";
            ddlMunicipio.DataBind();
            ddlMunicipio.Items.Insert(0, new ListItem("[Seleccionar]", "0"));

            ddlLocalidad.DataSource = Consultar("SELECT * FROM LOCALIDADES");
            ddlLocalidad.DataTextField = "LOCALIDAD";
            ddlLocalidad.DataValueField = "LOCALIDAD";
            ddlLocalidad.DataBind();
            ddlLocalidad.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        }

        protected void EstadoSeleccionado(object sender, EventArgs e)
        {
            /*String CATALOG_KEY = ddlEstado.SelectedValue;
            ddlMunicipio.DataSource = Consultar("SELECT * FROM MUNICIPIOS WHERE EFE_KEY="+CATALOG_KEY);
            ddlMunicipio.DataTextField = "MUNICIPIO";
            ddlMunicipio.DataValueField = "CATALOG_KEY";
            ddlMunicipio.DataBind();
            ddlMunicipio.Items.Insert(0, new ListItem("[Seleccionar]", "0"));*/
        }

        private Paciente GetEntity()
        {
            Paciente objPaciente = new Paciente();
            objPaciente.Curp = txtCurp.Text;
            objPaciente.Nombres = txtNombres.Text;
            objPaciente.ApPaterno = txtApPaterno.Text;
            objPaciente.ApMaterno = txtApMaterno.Text;
            objPaciente.FecNac = txtFechaNac.Text;
            objPaciente.EdoNac = txtFechaNac.Text;
            objPaciente.Sexo = (ddlSexo.SelectedValue == "Femenino") ? 'F' : 'M'; // Masculino , Femenino
            objPaciente.NacOrigen = ddlNacionalidad.SelectedValue;
            objPaciente.Estado = ddlEstado.SelectedValue;
            objPaciente.Municipio = ddlMunicipio.SelectedValue;
            objPaciente.Localidad = ddlLocalidad.Text;
            objPaciente.TipoBeneficiario = ddlTipoBeneficiario.SelectedValue;
            objPaciente.ClaveDependencia = txtClaveDependencia.Text;
            objPaciente.ClavePrograma = txtClavePrograma.Text;
            objPaciente.Folio = txtFolio.Text;
            return objPaciente;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            // Registro del paciente
            Paciente objPaciente = GetEntity();
            // enviar a la capa de logica de negocio
            bool response = PacienteLN.getInstance().RegistrarPaciente(objPaciente);
            if (response)
            {
                Response.Write("<script>alert('REGISTRO CORRECTO.')</script>");

            }
            else
            {
                Response.Write("<script>alert('REGISTRO INCORRECTO.')</script>");
            }
        }

        public DataSet Consultar(string strSQL)
        {
            string strconn = "Server=DELL\\SQLEXPRESS;Database=dbExpedienteClinico;Integrated Security=true";
            SqlConnection con = new SqlConnection(strconn);
            con.Open();
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            return ds;
         }

        [WebMethod]
        public static List<Paciente> ListarPacientes()
        {
            List<Paciente> Lista = null;
            try
            {
                Lista = PacienteLN.getInstance().ListarPacientes();
            }
            catch (Exception ex)
            {
                Lista = null;
            }
            return Lista;
        }
    }
}