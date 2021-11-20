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
    public class UsuarioDAO
    {
        #region"PATRON SINGLETON"
        private static UsuarioDAO daoUsuario = null;
        private UsuarioDAO() { }
        public static UsuarioDAO getInstance()
        {
            if (daoUsuario == null)
            {
                daoUsuario = new UsuarioDAO();
            }
            return daoUsuario;
        }
        #endregion

        //Metodo para poder loguearse a través de la base de datos.
        public Usuario AccesoSistema(String user, String pass)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            Usuario objUsuario = null;
            SqlDataReader dr = null;
            try
            {
                conexion = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spAccesoSistema", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmUser", user);
                cmd.Parameters.AddWithValue("@prmPass", pass);
                conexion.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    objUsuario = new Usuario();
                    //objUsuario.ID = Convert.ToInt32(dr["idEmpleado"].ToString());
                    objUsuario.userName = dr["userName"].ToString();
                    objUsuario.password = dr["userName"].ToString();
                }
            }
            catch (Exception ex)
            {
                objUsuario = null;
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return objUsuario;
        }

        //Metodo para registrar usuario al sistema a la base de datos.
        public bool RegistrarUsuario(Usuario objUsuario)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spRegistrarUsuario", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmUserName", objUsuario.userName);
                cmd.Parameters.AddWithValue("@prmEmail", objUsuario.email);
                cmd.Parameters.AddWithValue("@prmPassword", objUsuario.password);
                cmd.Parameters.AddWithValue("@prmRol", objUsuario.rol);
                cmd.Parameters.AddWithValue("@prmTelefono", objUsuario.telefono);
                cmd.Parameters.AddWithValue("@prmDireccion", objUsuario.direccion);
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

        //Metodo para listar Usuarios de la base de datos.
        public List<Usuario> ListarUsuarios()
        {
            List<Usuario> Lista = new List<Usuario>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spListarUsuarios", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                dr = cmd.ExecuteReader();
                //While para iterar sobre varios elementos mientras haya dato.
                while (dr.Read())
                {
                    // Crear objetos de tipo Paciente
                    Usuario objUsuario = new Usuario();
                    objUsuario.idUser = Convert.ToInt32(dr["idUser"].ToString());
                    objUsuario.userName = dr["userName"].ToString();
                    objUsuario.email = dr["email"].ToString();
                    objUsuario.password = dr["password"].ToString();
                    objUsuario.rol = Convert.ToInt32(dr["rol"].ToString());
                    objUsuario.telefono = dr["telefono"].ToString();
                    objUsuario.direccion = dr["direccion"].ToString();
                    // añadir a la lista de objetos
                    Lista.Add(objUsuario);
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

        //Metodo para actualizar usuario en la base de datos.
        public bool ActualizarUsuario(Usuario objUsuario)
        {
            bool ok = false;
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            try
            {
                conexion = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spActualizarPasswordUsuario", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdUsuario", objUsuario.idUser);
                cmd.Parameters.AddWithValue("@prmPassword", objUsuario.password);
                conexion.Open();
                cmd.ExecuteNonQuery();
                ok = true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return ok;
        }

        //Metodo para eliminar un usuario de la base de datos.
        public bool EliminarUsuario(int idUser)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            bool ok = false;
            try
            {
                conexion = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spEliminarUsuario", conexion);
                cmd.Parameters.AddWithValue("@prmIdUsuario", idUser);
                cmd.CommandType = CommandType.StoredProcedure;

                conexion.Open();

                cmd.ExecuteNonQuery();

                ok = true;

            }
            catch (Exception ex)
            {
                ok = false;
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return ok;
        }


    }
}
