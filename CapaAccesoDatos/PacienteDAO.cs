using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using System.Data;
using System.Data.SqlClient;

namespace CapaAccesoDatos
{
    public class PacienteDAO
    {
        #region "PATRON SINGLETON"
        private static PacienteDAO daoPaciente = null;
        private PacienteDAO() { }
        public static PacienteDAO getInstance()
        {
            if (daoPaciente == null)
            {
                daoPaciente = new PacienteDAO();
            }
            return daoPaciente;
        }
        #endregion
        
        //Metodo para Registrar paciente.
        public bool RegistrarPaciente(Paciente objPaciente)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spRegistrarPaciente", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmCurp", objPaciente.Curp);
                cmd.Parameters.AddWithValue("@prmNombres", objPaciente.Nombres);
                cmd.Parameters.AddWithValue("@prmApPaterno", objPaciente.ApPaterno);
                cmd.Parameters.AddWithValue("@prmApMaterno", objPaciente.ApMaterno);
                cmd.Parameters.AddWithValue("@prmFecNac", objPaciente.FecNac);
                cmd.Parameters.AddWithValue("@prmEdoNac", objPaciente.EdoNac);
                cmd.Parameters.AddWithValue("@prmSexo", objPaciente.Sexo);
                cmd.Parameters.AddWithValue("@prmNacOrigen", objPaciente.NacOrigen);
                cmd.Parameters.AddWithValue("@prmFolio", objPaciente.Folio);
                cmd.Parameters.AddWithValue("@prmEstado", objPaciente.Estado);
                cmd.Parameters.AddWithValue("@prmMunicipio", objPaciente.Municipio);
                cmd.Parameters.AddWithValue("@prmLocalidad", objPaciente.Localidad);
                cmd.Parameters.AddWithValue("@prmTipoBeneficiario", objPaciente.TipoBeneficiario);
                cmd.Parameters.AddWithValue("@prmClaveDependencia", objPaciente.ClaveDependencia);
                cmd.Parameters.AddWithValue("@prmClavePrograma", objPaciente.ClavePrograma);
                con.Open();

                int filas = cmd.ExecuteNonQuery();
                if (filas > 0) response = true;

            }
            catch (Exception ex)
            {
                response = false;
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return response;
        }

        //Metodo para listar paciente.
        public List<Paciente> ListarPacientes()
        {
            List<Paciente> Lista = new List<Paciente>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spListarPacientes", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                dr = cmd.ExecuteReader();
                //While para iterar sobre varios elementos mientras haya dato.
                while (dr.Read())
                {
                    // Crear objetos de tipo Paciente
                    Paciente objPaciente = new Paciente();
                    objPaciente.Curp = dr["CURP"].ToString();
                    objPaciente.ApPaterno = dr["PRIMER_APELLIDO"].ToString();
                    objPaciente.ApMaterno = dr["SEGUNDO_APELLIDO"].ToString();
                    objPaciente.Nombres = dr["NOMBRE"].ToString();
                    objPaciente.FecNac = dr["FECNAC"].ToString();
                    objPaciente.EdoNac = dr["EDONAC"].ToString();
                    objPaciente.Sexo = Convert.ToChar(dr["SEXO"].ToString());
                    objPaciente.NacOrigen = dr["NACORIGEN"].ToString();
                    objPaciente.Folio = dr["FOLIO"].ToString();
                    objPaciente.Estado = dr["EDO"].ToString();
                    objPaciente.Municipio = dr["MUN"].ToString();
                    objPaciente.Localidad = dr["LOC"].ToString();
                    objPaciente.TipoBeneficiario = dr["TIPO_BENEFICIARIO"].ToString();
                    objPaciente.ClaveDependencia = dr["CLAVE_DEPENDENCIA"].ToString();
                    objPaciente.ClavePrograma = dr["CLAVE_PROGRAMA"].ToString();
                    // añadir a la lista de objetos
                    Lista.Add(objPaciente);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return Lista;
        }
    }
}
