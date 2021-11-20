<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="GestionarUsuario.aspx.cs" Inherits="CapaPresentacion.GestionarUsuario" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <section class="content-header">
        <h1 style="text-align: center">REGISTRO DE USUARIOS</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>USERNAME</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtUsername" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Campo obligatorio." ForeColor="Red" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>EMAIL</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtEmail" runat="server" Text="" TextMode="Email" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Campo obligatorio." ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>PASSWORD</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtPassword" runat="server" Text="" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Campo obligatorio." ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>CONFIRM PASSWORD</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtCPassword" runat="server" Text="" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtCPassword" ErrorMessage="La password y su confirmación deben ser las mismas." ForeColor="Red"></asp:CompareValidator>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <label>ROL</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">Paciente</asp:ListItem>
                                <asp:ListItem Value="1">Adminsitrador de clínica</asp:ListItem>
                                <asp:ListItem Value="2">Control de Farmacia</asp:ListItem>
                                <asp:ListItem Value="3">Control de laboratorio</asp:ListItem>
                                <asp:ListItem Value="4">Enfermera</asp:ListItem>
                                <asp:ListItem Value="5">Médico</asp:ListItem>
                                <asp:ListItem Value="6">Administrador de Sistema</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>TELEFONO</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtTelefono" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Campo obligatorio." ForeColor="Red" ControlToValidate="txtTelefono"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>DIRECCIÓN</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtDireccion" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Campo obligatorio." ForeColor="Red" ControlToValidate="txtDireccion"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div align="center">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Width="200px" Text="Ingresar" OnClick="btnRegistrar_Click" />
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-danger" Width="200px" Text="Limpiar" />
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
                        <h3 class="box-title">Lista de usuarios</h3>
                    </div>
                    <div class="box-body table-responsive">
                        <table id="tbl_usuarios" class="table table-bordered table-hover text-center">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>USERNAME</th>
                                    <th>EMAIL</th>
                                    <th>PASSWORD</th>
                                    <th>ROL</th>
                                    <th>TELEFONO</th>
                                    <th>DIRECCIÓN</th>
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
    <div class="modal fade" id="imodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Actualizar registro</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>USERNAME</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtModalUserName" runat="server" Text="" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>PASSWORD</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtModalPassword" runat="server" Text="" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorModalPassword" runat="server" ErrorMessage="*Campo obligatorio." ForeColor="Red" ControlToValidate="txtModalPassword"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>PASSWORD</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtModalPasswordC" runat="server" Text="" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToCompare="txtModalPassword" ControlToValidate="txtModalPasswordC" ErrorMessage="La password y su confirmación deben ser las mismas." ForeColor="Red"></asp:CompareValidator>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnactualizar">Actualizar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="js/usuario.js" type="text/javascript"></script>
</asp:Content>
