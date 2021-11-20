<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="GestionarPaciente.aspx.cs" Inherits="CapaPresentacion.frmGestionarPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <section class="content-header">
        <h1 style="text-align: center">REGISTRO DE PACIENTES</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-4">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>CURP</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtCurp" runat="server" Text="" MaxLength="18" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>NOMBRES</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNombres" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>APELLIDO PATERNO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtApPaterno" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>APELLIDO MATERNO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtApMaterno" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>FECHA DE NACIMIENTO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtFechaNac" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>ESTADO DE NACIMIENTO</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlEstadoNacimiento" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>SEXO</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control">
                                <asp:ListItem>Masculino</asp:ListItem>
                                <asp:ListItem>Femenino</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>NACIONALIDAD DE ORIGEN</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlNacionalidad" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>ESTADO</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control" OnSelectedIndexChanged="EstadoSeleccionado">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>MUNICIPIO</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>LOCALIDAD</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                      <div class="form-group">
                            <label>TIPO DE BENEFICIARIO</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlTipoBeneficiario" runat="server" CssClass="form-control">
                                <asp:ListItem>Asegurado</asp:ListItem>
                                <asp:ListItem>Derechohabiente</asp:ListItem>
                                <asp:ListItem>Personal</asp:ListItem>
                                <asp:ListItem>Otro</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>CLAVE DE DEPENDENCIA</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtClaveDependencia" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>CLAVE DEL PROGRAMA</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtClavePrograma" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>FOLIO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtFolio" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div align="center">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Width="200px" Text="Registrar" OnClick="btnRegistrar_Click" />
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-danger" Width="200px" Text="Cancelar" />
                    </td>
                </tr>
            </table>
        </div>
        <br />

        <!-- Datatable Part -->

        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Lista de Pacientes</h3>
                    </div>
                    <div class="box-body table-responsive">
                        <table id="tbl_pacientes" class="table table-bordered table-hover text-center">
                            <thead>
                                <tr>
                                    <th>CURP</th>
                                    <th>1er Apellido</th>
                                    <th>2do Apellido</th>
                                    <th>Nombre(s)</th>
                                    <th>Fecha de Nacimiento</th>
                                    <th>Estado de Nacimiento</th> 
                                    <th>Sexo</th>
                                    <th>Nacionalidad</th>
                                    <th>Folio</th>
                                    <th>Estado</th>
                                    <th>Municipio</th>
                                    <th>Localidad</th>
                                    <th>Tipo de Beneficiario</th>
                                    <th>Clave de Dependencia</th>
                                    <th>Clave de programa</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody id="tbl_body_table">
                                <!-- DATA POR MEDIO DE AJAX-->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Datatable -->

    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="js/paciente.js" type="text/javascript"></script>
</asp:Content>