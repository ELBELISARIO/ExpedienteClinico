USE [master]
GO
/****** Object:  Database [dbExpedienteClinico]    Script Date: 12/02/2021 09:24:35 a. m. ******/
CREATE DATABASE [dbExpedienteClinico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbExpedienteClinico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbExpedienteClinico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbExpedienteClinico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbExpedienteClinico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbExpedienteClinico] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbExpedienteClinico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbExpedienteClinico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbExpedienteClinico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbExpedienteClinico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbExpedienteClinico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbExpedienteClinico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbExpedienteClinico] SET  MULTI_USER 
GO
ALTER DATABASE [dbExpedienteClinico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbExpedienteClinico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbExpedienteClinico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbExpedienteClinico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbExpedienteClinico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbExpedienteClinico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbExpedienteClinico] SET QUERY_STORE = OFF
GO
USE [dbExpedienteClinico]
GO
/****** Object:  Table [dbo].[ESTADOS]    Script Date: 12/02/2021 09:24:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADOS](
	[CATALOG_KEY] [char](2) NOT NULL,
	[ENTIDAD_FEDERATIVA] [text] NOT NULL,
	[ABREVIATURA] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CATALOG_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCALIDADES]    Script Date: 12/02/2021 09:24:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCALIDADES](
	[EFE_KEY] [char](2) NOT NULL,
	[MUN_KEY] [char](3) NOT NULL,
	[CATALOG_KEY] [char](4) NOT NULL,
	[LOCALIDAD] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MUNICIPIOS]    Script Date: 12/02/2021 09:24:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MUNICIPIOS](
	[CATALOG_KEY] [char](3) NOT NULL,
	[MUNICIPIO] [varchar](255) NULL,
	[EFE_KEY] [char](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NACIONALIDAD]    Script Date: 12/02/2021 09:24:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NACIONALIDAD](
	[CODIGO_PAIS] [char](3) NOT NULL,
	[PAIS] [text] NOT NULL,
	[CLAVE_NACIONALIDAD] [char](3) NOT NULL,
 CONSTRAINT [PK_NACIONALIDAD] PRIMARY KEY CLUSTERED 
(
	[CODIGO_PAIS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 12/02/2021 09:24:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[CURP] [varchar](18) NOT NULL,
	[PRIMER_APELLIDO] [varchar](50) NOT NULL,
	[SEGUNDO_APELLIDO] [varchar](50) NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[FECNAC] [varchar](15) NOT NULL,
	[EDONAC] [varchar](2) NOT NULL,
	[SEXO] [char](1) NOT NULL,
	[NACORIGEN] [varchar](3) NOT NULL,
	[FOLIO] [varchar](18) NOT NULL,
	[EDO] [varchar](2) NOT NULL,
	[MUN] [varchar](3) NOT NULL,
	[LOC] [varchar](4) NOT NULL,
	[TIPO_BENEFICIARIO] [varchar](20) NOT NULL,
	[CLAVE_DEPENDENCIA] [varchar](3) NOT NULL,
	[CLAVE_PROGRAMA] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CURP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 12/02/2021 09:24:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[rol] [int] NOT NULL,
	[telefono] [varchar](10) NULL,
	[direccion] [varchar](100) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spAccesoSistema]    Script Date: 12/02/2021 09:24:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAccesoSistema]
( @prmUser varchar(50),
  @prmPass varchar(50)
)
AS
	BEGIN
		SELECT E.idUser, E.userName, E.email, E.password, E.rol, E.telefono, E.direccion
		FROM Usuarios E
		WHERE E.userName = @prmUser AND E.password = @prmPass
	END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarPasswordUsuario]    Script Date: 12/02/2021 09:24:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarPasswordUsuario]
(@prmIdUsuario int,
@prmPassword varchar(50))
as
	begin
		update Usuarios
		set Usuarios.password = @prmPassword
		where Usuarios.idUser = @prmIdUsuario
	end
GO
/****** Object:  StoredProcedure [dbo].[spEliminarUsuario]    Script Date: 12/02/2021 09:24:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarUsuario]
(@prmIdUsuario int)
AS
	BEGIN
		DELETE Usuarios
		WHERE idUser = @prmIdUsuario
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarPacientes]    Script Date: 12/02/2021 09:24:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarPacientes]
AS
	BEGIN
		SELECT P.CURP
		     , P.PRIMER_APELLIDO
			 , P.SEGUNDO_APELLIDO
			 , P.NOMBRE
			 , P.FECNAC
			 , P.EDONAC
			 , P.SEXO
			 , P.NACORIGEN
			 , P.FOLIO
			 , p.EDO
			 , p.MUN
			 , p.LOC
			 , p.TIPO_BENEFICIARIO
			 , p.CLAVE_DEPENDENCIA
			 , p.CLAVE_PROGRAMA
		FROM Pacientes P
		ORDER BY P.SEXO
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarUsuarios]    Script Date: 12/02/2021 09:24:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarUsuarios]
AS
	BEGIN
		SELECT P.idUser
		     , P.userName
			 , P.email
			 , P.password
			 , P.rol
			 , P.telefono
			 , P.direccion
		FROM Usuarios P
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarPaciente]    Script Date: 12/02/2021 09:24:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarPaciente]
(
@prmCurp VARCHAR(18),
@prmApPaterno VARCHAR(50),
@prmApMaterno VARCHAR(50),
@prmNombres VARCHAR(50),
@prmFecNac VARCHAR(15),
@prmEdoNac VARCHAR(2),
@prmSexo CHAR(1),
@prmNacOrigen VARCHAR(3),
@prmFolio VARCHAR(18),
@prmEstado VARCHAR(2),
@prmMunicipio VARCHAR(3),
@prmLocalidad VARCHAR(4),
@prmTipoBeneficiario VARCHAR(20),
@prmClaveDependencia VARCHAR(3),
@prmClavePrograma VARCHAR(20)
)
AS
	BEGIN
		INSERT INTO Pacientes(CURP,PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE, FECNAC, EDONAC, SEXO, NACORIGEN, FOLIO, EDO, MUN, LOC, TIPO_BENEFICIARIO, CLAVE_DEPENDENCIA, CLAVE_PROGRAMA)
		VALUES(@prmCurp, @prmApPaterno, @prmApMaterno, @prmNombres, @prmFecNac, @prmEdoNac, @prmSexo, @prmNacOrigen, @prmFolio, @prmEstado, @prmMunicipio, @prmLocalidad, @prmTipoBeneficiario, @prmClaveDependencia,@prmClavePrograma);
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarUsuario]    Script Date: 12/02/2021 09:24:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarUsuario]
(
@prmUserName VARCHAR(50),
@prmEmail VARCHAR(50),
@prmPassword VARCHAR(50),
@prmRol INT,
@prmTelefono VARCHAR(10), 
@prmDireccion VARCHAR(100)
)
AS
	BEGIN
		INSERT INTO Usuarios(userName, email, password, rol, telefono, direccion)
		VALUES(@prmUserName, @prmEmail, @prmPassword, @prmRol, @prmTelefono, @prmDireccion);
	END
GO
USE [master]
GO
ALTER DATABASE [dbExpedienteClinico] SET  READ_WRITE 
GO
