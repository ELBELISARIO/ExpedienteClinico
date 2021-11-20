using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaAccesoDatos
{
    public class Conexion
    {
        #region "PATRON SINGLETON"
        private static Conexion conexion = null;
        private Conexion(){}
        public static Conexion getInstance()
        {
            if(conexion == null){
                conexion = new Conexion();
            }
            return conexion;
        }
        #endregion

        public SqlConnection ConexionBD()
        {
            SqlConnection conexion = new SqlConnection();
            //conexion.ConnectionString = "Data Source=12.0.159.62; Initial Catalog=DBClinica_test; User ID=DELL\\unsito; Password=windows10";
            //conexion.ConnectionString = "Data Source =.; Initial Catalog = master; Integrated Security = True";
            conexion.ConnectionString = "Server=DELL\\SQLEXPRESS;Database=dbExpedienteClinico;Integrated Security=true;";
            return conexion;
        }
    }
}
