<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Change_Ext.aspx.cs" Inherits="Change_Ext" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link type="text/css" href="bootstrap_1/bootstrap.min.css" rel="stylesheet" />
    <script src="scripts/jquery-1.9.1.min.js"></script>
    <script src="scripts/jquery.bootstrap-growl.min.js"></script>
    <script src="scripts/bootstrap.min.js"></script>

    <link href="dist/Notifier.min.css" rel="stylesheet" />
    <script src="dist/Notifier.min.js"></script>

    <style type="text/css">
        .tablecampos {
            border-collapse: separate;
            border-spacing: 5px;
            border: 1px solid darkgray;
            border-radius: 5px !important;
            width: 100%;
            -moz-border-radius: 5px;
            padding: 1px;
            -webkit-border-radius: 5px;
        }

        .tabla_combo {
            border-collapse: separate;
            border-spacing: 3px;
            border: 1px solid darkgray;
            border-radius: 5px !important;
            width: 100%;
            -moz-border-radius: 5px;
            padding: 1px;
            -webkit-border-radius: 5px;
        }

        .colocarmoradito:focus {
            border-color: #AB25EA !important;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(201,118,240,.6) !important;
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(201,118,240,.6) !important;
        }

        .scrolling-table-container {
            height: 130px;
            overflow-y: hidden;
            overflow-x: scroll;
        }

        #calendar1 {
            position: absolute;
            z-index: 3;
            background-color: white;
        }

        .alert-success {
            color: white;
            background-color:forestgreen;
            border-color: black;
        }

          
    </style>

    <title>Job_Change</title>

</head>
<body>
    <form id="form1" runat="server">


        <nav class="navbar panel-danger" style="background-color: #dc3545" id="nav">
            <a class="navbar-brand" style="color: white" href="#">Plan de Mejoramiento</a>
        </nav>

        <div class="container-fluid">
            <main class="row flex-xl-nowrap">
                <!--Menu_Bar-->
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li class="active">
                            <a href="#">
                                <h3>Menu
                                    <span class="sr-only">(current)</span>
                                </h3>
                            </a>
                        </li>

                        <li class="active">
                            <a href="Seguimiento_Plan_Mjra/Seguimiento_plan_mejora.aspx">Seguimiento</a>
                        </li>
                    </ul>
                </div>
                <!--Jumbotrom-->
                <main class="col-md-9 col-x1-8 py-md-3 pl-md-1 bd-sidebar" role="main">
                    <div class="jumbotron" style="top: 50px">
                        <h4>Ingresar Registro</h4>
                        <%--  <div class="bs-example" data-example-id="simple-breadcrumbs">
                            <ol class="breadcrumb">
                                <li>
                                    <a href="#">Maquinas</a>
                                </li>
                                <li class="active">
                                    <a href="#">Seguimientos</a>
                                </li>
                            </ol>
                        </div>--%>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <table class="tabla_combo">
                                    <tr style="height: 50px; border-bottom: 1px solid darkgray !important">
                                        <td>
                                            <asp:Label Text="Referencia:" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="texbox_referencia" runat="server" CssClass="form-control " Width="120" />
                                        </td>

                                        <td>
                                            <asp:Label Text="Maquina:" runat="server" />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="texbox_maquina" runat="server" CssClass="form-control" Width="70">
                                                <asp:ListItem Text="A0" />
                                                <asp:ListItem Text="A1" />
                                                <asp:ListItem Text="A2" />
                                                <asp:ListItem Text="A3" />
                                                <asp:ListItem Text="A4" />
                                                <asp:ListItem Text="A5" />
                                                <asp:ListItem Text="A6" />
                                                <asp:ListItem Text="A7" />
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label Text="Fecha: " runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="texbox_fecha_hist" runat="server" CssClass="form-control " Width="120" />
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lbtag" runat="server" CausesValidation="false" OnClick="lbtag_Click">
                                                <asp:Image ID="imgdelete" runat="server" ImageUrl="~/imagenes/calendar.png" />
                                            </asp:LinkButton>
                                            <asp:Calendar runat="server" OnSelectionChanged="calendar1_SelectionChanged" ID="calendar1"></asp:Calendar>
                                        </td>
                                    </tr>

                                </table>

                            </div>
                        </div>


                        <div class="panel panel-default">
                            <div class="panel-body">

                                <table class="tablecampos">

                                    <tr style="height: 20px; border-bottom: 1px solid darkgray !important">

                                        <td>
                                            <asp:Label Text="Peso Plano:" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="texbox_peso_plano" runat="server" CssClass="form-control " Width="100" />
                                        </td>
                                        <td>
                                            <asp:Label Text="Velocidad Historica:" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="texbox_velocida_hist" runat="server" CssClass="form-control " Width="100" />
                                        </td>
                                        <td>
                                            <asp:Label Text="Equipo Prensado:" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="texbox_equipo_prensa" runat="server" CssClass="form-control " Width="100" />
                                        </td>

                                    </tr>
                                    <tr style="height: 30px">
                                        <td>
                                            <asp:Label Text="Peso Desplazamiento" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="texbox_peso_despla" runat="server" CssClass="form-control" Width="100" />
                                        </td>
                                        <td>
                                            <asp:Label Text="Peso Historico" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="texbox_peso_histor" runat="server" CssClass="form-control " Width="100" />
                                        </td>
                                        <td>
                                            <asp:Label Text="Velocidad Objetivo" runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="texbox_velocida_objet" runat="server" CssClass="form-control " Width="100" />
                                        </td>


                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label Text="Defectos Impactan:" runat="server" Width="90" />
                                        </td>
                                        <td>
                                            <asp:DropDownList runat="server" CssClass="form-control" AutoPostBack="true" ID="texbox_defec_imapc" OnSelectedIndexChanged="texbox_defec_imapc_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td colspan="5" rowspan="2">Observaciones *<asp:TextBox ID="texbox_observaciones" runat="server" CssClass="form-control" Width="500" Height="70" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label Text="Necesidades Referencia" runat="server" Width="90" />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="texbox_necesidades" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="" />
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                <p></p>
                                <div>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button Text="Registar" CssClass="btn btn-success" OnClick="insertar" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Button Text="Buscar Referencia" CssClass="btn btn-primary" runat="server" OnClick="Unnamed_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                        </div>

                        <%--  <div class="scrolling-table-container">
                            <div class="panel-body">
                                <asp:GridView ID="GridView1" AutoGenerateColumns="false" CssClass="table table-bordered" runat="server">
                                    <Columns>
                                        <asp:BoundField HeaderText="Maquina" DataField="maquina" />
                                        <asp:BoundField HeaderText="Referencia" DataField="referencia" />
                                        <asp:BoundField HeaderText="Fecha" DataField="fecha" DataFormatString="{0:yyy/MM/dd}" />
                                        <asp:BoundField HeaderText="Peso Plano" DataField="peso_plano" />
                                        <asp:BoundField HeaderText="Peso Desplazamiento" DataField="peso_desplazamiento" />
                                        <asp:BoundField HeaderText="Velocidad Historica" DataField="velocidad_historica" />
                                        <asp:BoundField HeaderText="Velocidad Objetivo" DataField="velocidad_objetivo" />
                                        <asp:BoundField HeaderText="Equipo Prensado" DataField="equipo_prensado" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>--%>
                    </div>
                </main>
            </main>
        </div>
    </form>
</body>
</html>
