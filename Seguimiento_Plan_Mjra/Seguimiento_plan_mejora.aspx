<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Seguimiento_plan_mejora.aspx.cs" Inherits="Seguimiento_Plan_Mjra_Seguimiento_plan_mejora" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


    <link type="text/css" href="../bootstrap_1/bootstrap.min.css" rel="stylesheet" />
    <script src="../scripts/jquery-1.9.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/jquery.bootstrap-growl.min.js"></script>

    <link href="../dist/Notifier.min.js" rel="stylesheet" />
    <script src="../dist/Notifier.min.js"></script>

    <style type="text/css">
        .tabla_combo {
            border-collapse: separate;
            border-spacing: 3px;
            border: 1px solid darkgray;
            border-radius: 5px !important;
            width: 50%;
            -moz-border-radius: 5px;
            padding: 1px;
            -webkit-border-radius: 5px;
        }

        .tabla_combo2 {
            border-collapse: separate;
            border-spacing: 3px;
            border: 1px solid darkgray;
            border-radius: 5px !important;
            width: 70%;
            -moz-border-radius: 5px;
            padding: 1px;
            -webkit-border-radius: 5px;
        }

        #Calendar1 {
            position: absolute;
            z-index: 3;
            background-color: white;
        }.alert-success {
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
                <%--  <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li class="active">
                            <a href="#">
                                <h3>Menu
                                    <span class="sr-only">(current)</span>
                                </h3>
                            </a>
                        </li>
                        <li class="active">
                            <a href="#">Cargar Referencia</a>
                        </li>
                        <li class="active">
                            <a href="#">Seguimiento</a>
                        </li>
                    </ul>
                </div>--%>
                <!--Jumbotrom-->
                <main class="col-md-9 col-x1-8 py-md-3 pl-md-1 bd-sidebar" role="main">
                    <div class="jumbotron" style="top: 100px; width: 134%">
                        <h4>Seguimiento Referencia</h4>
                        <div class="bs-example" data-example-id="simple-breadcrumbs">
                            <ol class="breadcrumb">
                                <li>
                                    <a href="../Change_Ext.aspx">Cargar</a>
                                </li>

                            </ol>
                        </div>
                        <table class="tabla_combo">
                            <tr style="height: 60px;">
                                <td>
                                    <asp:Label Text="Fecha:" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="texbox_fecha" CssClass="form-control" Width="100px" />
                                </td>
                                <td>
                                    <asp:LinkButton ID="lbtag" runat="server" CausesValidation="false" OnClick="lbtag_Click">
                                        <asp:Image ID="imgdelete" runat="server" ImageUrl="~/imagenes/calendar.png" />
                                    </asp:LinkButton>
                                    <asp:Calendar ID="Calendar1" OnSelectionChanged="Calendar1_SelectionChanged" runat="server"></asp:Calendar>
                                </td>

                                <td style="height: 50px">
                                    <asp:Label Text="Referencia:" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="texbox_Referencia" Width="100px" CssClass="form-control" />
                                </td>


                                <td>
                                    <asp:Label Text="Maquina  :" runat="server" />
                                </td>

                                <td colspan="3">
                                    <asp:DropDownList CssClass="form-control" ID="DropDowlist_maquina" Width="100px" runat="server">
                                        <asp:ListItem Text="" />
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
                                    <asp:Button Text="Consultar" CssClass="btn btn-success" runat="server" OnClick="Unnamed_Click" />
                                </td>
                            </tr>
                        </table>
                        <p></p>
                        <div>
                        </div>
                        <p></p>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <asp:GridView runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" ID="gridView">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Maquina">
                                            <ItemTemplate>
                                                <asp:LinkButton Text='<%# Eval("maquina") %>' runat="server" OnClick="Unnamed_Click1" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Referencia" DataField="referencia" />
                                        <asp:BoundField HeaderText="Fecha" DataField="fecha" DataFormatString="{0:yyy/MM/dd}" />
                                        <asp:BoundField HeaderText="Peso Plano" DataField="peso_plano" />
                                        <asp:BoundField HeaderText="Peso Desplazamiento" DataField="peso_desplazamiento" ItemStyle-Width="1%" />
                                        <asp:BoundField HeaderText="Velocidad Historica" DataField="velocidad_historica" />
                                        <asp:BoundField HeaderText="Velocidad Objetivo" DataField="velocidad_objetivo" />
                                        <asp:BoundField HeaderText="Equipo Prensado" DataField="equipo_prensado" />
                                        <asp:BoundField HeaderText="Defectos Impactantes" DataField="defectos_impactan" />
                                        <asp:BoundField HeaderText="Necesidades Referencia" DataField="necesidades_referencia" />
                                        <asp:BoundField HeaderText="Observaciones" DataField="Observaviones" ItemStyle-Width="100%" />
                                    </Columns>
                                </asp:GridView>

                            </div>
                        </div>
                    </div>
                </main>
            </main>
        </div>
        <%--Bootstrap Modal Dialog--%>
        <div style="width: 100%" class="modal fade" id="myModal2" role="dialog">
            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" runat="server">Maquina
                            <asp:Label runat="server" ID="lbltittlemodal"></asp:Label>
                            <asp:Label runat="server" ID="Label1" Visible="false" ></asp:Label>
                             <asp:Label runat="server" ID="Label2" Visible ="false"></asp:Label>
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <table id="tabla_combo2">
                                <tr style="height: 60px;">
                                    <td>
                                        <label>Peso_Plano :</label>
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="texbox_peso_plano" runat="server" Width="40%" />
                                    </td>
                                    <td>
                                        <label>Peso_desplazamiento :</label>
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="texbox_peso_desplazamiento" runat="server" Width="40%" />
                                    </td>
                                </tr>
                                <tr style="height: 60px;">
                                    <td>
                                        <label>Velocidad_Historica :</label>
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="texbox_veloc_hist" runat="server" Width="40%" />
                                    </td>
                                    <td>
                                        <label>Velocida Objetivo : </label>
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="form-control" ID="texbox_velo_objetiv" runat="server" Width="40%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Observaciones*</label>
                                    </td>
                                    <td colspan="8">
                                        <asp:TextBox CssClass="form-control" ID="TextBox_observaciones"  runat="server" Width="60%" Height="100px" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="Button1" CssClass="btn btn-danger" OnClick="Button1_Click" runat="server" Text="Actualizar Registro" />
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
