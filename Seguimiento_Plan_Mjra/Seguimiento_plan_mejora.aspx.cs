using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Seguimiento_Plan_Mjra_Seguimiento_plan_mejora : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Calendar1.Visible = false;
        }
        if (Session["dtseguimiento_plan_mejora"] != null)
        {
            dt = (DataTable)Session["dtseguimiento_plan_mejora"];
        }
     
    }

    public SqlConnection cnx = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
    public SqlCommand cmd = new SqlCommand();

    public void conexion()
    {

        dt = new DataTable();


        string sentencia = "select id_pln_accion,registro_plan_mejoramiento_pmp.id_registro_pln,maquina,referencia,fecha,peso_plano,peso_desplazamiento,velocidad_historica,velocidad_objetivo,equipo_prensado," +
            " pln_accion_pmp.Observaviones, def_impac_pmp.defectos_impactan, nece_ref_pmp.necesidades_referencia" +
            " from registro_plan_mejoramiento_pmp" +
            " inner join pln_accion_pmp on registro_plan_mejoramiento_pmp.id_registro_pln = pln_accion_pmp.tb_registro_plan_mejoramiento" +
            " inner join relacion_def_impact_necesidades_ref on relacion_def_impact_necesidades_ref.id_relacion_def_nece = pln_accion_pmp.tb_relacion_impac_neces_ref" +
            " inner join def_impac_pmp on def_impac_pmp.id_def_imp = relacion_def_impact_necesidades_ref.tbl_defec_impact" +
            " inner join nece_ref_pmp on nece_ref_pmp.id_pln_acciones = relacion_def_impact_necesidades_ref.tbl_necesi_refere where ";



        if (!string.IsNullOrEmpty(DropDowlist_maquina.Text))
        {
            sentencia = sentencia + " maquina = '" + DropDowlist_maquina.Text.Trim() + "' AND";
        }
        if (!string.IsNullOrEmpty(texbox_Referencia.Text))
        {
            sentencia = sentencia + " referencia = '" + texbox_Referencia.Text.Trim() + "' AND ";
        }
        if (!string.IsNullOrEmpty(texbox_fecha.Text))
        {
            sentencia = sentencia + " fecha = '" + texbox_fecha.Text.Trim() + "' AND ";
        }
        sentencia = sentencia + " 1=1";

        cnx.Open();
        cmd = new SqlCommand(sentencia, cnx);
        SqlDataAdapter dp2 = new SqlDataAdapter(cmd);
        dp2.Fill(dt);
        Session.Add("dtseguimiento_plan_mejora", dt);

        gridView.DataSource = dt;
        gridView.DataBind();
        cnx.Close();
    }



    protected void Unnamed_Click(object sender, EventArgs e)
    {
        conexion();
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

        texbox_fecha.Text = Calendar1.SelectedDate.ToString("yyy-MM-dd");
        Calendar1.Visible = false;
    }

    protected void lbtag_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }

    protected void Unnamed_Click1(object sender, EventArgs e)
    {

        LinkButton lb = (LinkButton)sender;
        GridViewRow row = (GridViewRow)lb.NamingContainer;
        lbltittlemodal.Text = row.RowIndex + " : " + dt.Rows[row.RowIndex]["id_registro_pln"] + " : " + dt.Rows[row.RowIndex]["id_pln_accion"];



        texbox_peso_plano.Text = dt.Rows[row.RowIndex]["peso_plano"].ToString();
        texbox_peso_desplazamiento.Text = dt.Rows[row.RowIndex]["peso_desplazamiento"].ToString();
        texbox_veloc_hist.Text = dt.Rows[row.RowIndex]["velocidad_historica"].ToString();
        texbox_velo_objetiv.Text = dt.Rows[row.RowIndex]["velocidad_objetivo"].ToString();
        TextBox_observaciones.Text = dt.Rows[row.RowIndex]["Observaviones"].ToString();

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "$('#myModal2').modal();", true);

    }

    public void UpdateDB( string sentencia )
    {
        string var = "update registro_plan_mejoramiento_pmp  set peso_plano = " + texbox_peso_plano + ", peso_desplazamiento =" + texbox_peso_desplazamiento.Text + ", velocidad_historica=" + texbox_veloc_hist + ", velocidad_objetivo=" + texbox_velo_objetiv + " where id_registro_pln = " + dt.Rows[row.RowIndex]["id_registro_pln"] + "";

        cnx.Open();
        cmd = new SqlCommand(sentencia, cnx);
        cmd.ExecuteNonQuery();
        cnx.Close();

    }


    protected void Unnamed_Load(object sender, EventArgs e)
    {
        Label lb = (Label)sender;
        Label1.Text = Label1.Text + lb.Text;
    }
}
