using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

public partial class Change_Ext : System.Web.UI.Page
{




    protected void Page_Load(object sender, EventArgs e)
    {
        calendar1.Visible = false;
        if (!IsPostBack)
        {
            llenar_combo_box_def_imapct();
            

        }

        //if (Session["dtprogcambiosextraccion"] != null)

    }

    public SqlConnection cnx = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
    public SqlCommand cmd = new SqlCommand();

    public void conexion()
    {
        DataTable dt = new DataTable();


        cnx.Open();
        cmd = new SqlCommand("select maquina, referencia, fecha, peso_plano, peso_desplazamiento, velocidad_historica, velocidad_objetivo, equipo_prensado " +
                             "from registro_plan_mejoramiento_pmp where maquina = '"+texbox_maquina.Text+"' and referencia = '"+texbox_referencia.Text+"' and  fecha = '"+texbox_fecha_hist.Text+"' ", cnx);
        SqlDataAdapter dp2 = new SqlDataAdapter(cmd);
        dp2.Fill(dt);

        //GridView1.DataSource = dt;
        //GridView1.DataBind();
        cnx.Close();
    }


    public void insertar_ref()
    {
        DataTable dt = new DataTable();

        string sentencia_gen = "";
        string consulta = "select id_registro_pln, maquina, referencia, CONVERT(date, fecha) as fecha" +
                          " from registro_plan_mejoramiento_pmp where maquina = '" + texbox_maquina.Text + "' and referencia = '" + texbox_referencia.Text + "' and fecha = '" + texbox_fecha_hist.Text + "' ";

        cmd = new SqlCommand(consulta, cnx);
        SqlDataAdapter dp2 = new SqlDataAdapter(cmd);
        dp2.Fill(dt);

        if (dt.Rows.Count != 0)
        {
            sentencia_gen = "insert into pln_accion_pmp values ('" + texbox_observaciones.Text + "','" + dt.Rows[0]["id_registro_pln"] + "','" + texbox_necesidades.SelectedValue + "','on')";

            cnx.Open();
            cmd = new SqlCommand(sentencia_gen, cnx);
            cmd.ExecuteNonQuery();
            cnx.Close();

            mensajeGrowl("Se insertaron las observaciones // plan Accion ", "success", "grow");
        }
        else
        {
            string sentencia_gen1 = "insert into registro_plan_mejoramiento_pmp values('" + texbox_maquina.Text + "','"+texbox_fecha_hist.Text+"','" + texbox_peso_plano.Text.Replace(',','.').Trim() + "','" + texbox_peso_despla.Text.Replace(',', '.').Trim() + "','" + "" + texbox_velocida_hist.Text.Replace(',', '.').Trim() + "','" + texbox_velocida_objet.Text.Replace(',', '.').Trim() + "','" + texbox_equipo_prensa.Text.Replace(',', '.').Trim() +"',GETDATE(),'" + texbox_referencia.Text.ToUpper().Trim()+"')";

            cnx.Open();
            cmd = new SqlCommand(sentencia_gen1, cnx);
            cmd.ExecuteNonQuery();
            cnx.Close();

            DataTable dt2 = new DataTable();
            cmd = new SqlCommand(consulta, cnx);
            SqlDataAdapter dp3 = new SqlDataAdapter(cmd);
            dp3.Fill(dt2);

            mensajeGrowl("Campos ingresados con Exito", "success","grow");
            

            if (dt2.Rows.Count != 0)
            {
              string sentencia_gen2 = "insert into pln_accion_pmp values ('" + texbox_observaciones.Text + "','" + dt2.Rows[0]["id_registro_pln"] + "','" + texbox_necesidades.SelectedValue + "','on')";

                cnx.Open();
                cmd = new SqlCommand(sentencia_gen2, cnx);
                cmd.ExecuteNonQuery();
                cnx.Close();

              

            }

        }
        #region ..............
        //foreach (DataRow dtr in dt.Rows) 
        //{

        //    string id_reg = dtr["id_registro_pln"].ToString();
        //    string maquina = dtr["maquina"].ToString();
        //    string referencia = dtr["referencia"].ToString();
        //    var fecha = DateTime.Parse(dtr["fecha"].ToString());

        //    if (maquina == texbox_maquina.Text & referencia == texbox_referencia.Text & fecha == Convert.ToDateTime(texbox_fecha_hist.Text))
        //    {
        //        sentencia_gen = "insert into pln_accion_pmp values ('"+texbox_observaciones.Text+"','"+id_reg+"','"+ texbox_necesidades .SelectedValue+ "','on')";
        //    }
        //    else 
        //    {
        //       sentencia_gen = "insert into registro_plan_mejoramiento_pmp values('" + texbox_maquina.Text + "',GETDATE()," + texbox_peso_plano.Text + "," + texbox_peso_despla.Text + "," + "" + texbox_velocida_hist.Text + "," + texbox_velocida_objet.Text + ",'" + texbox_equipo_prensa.Text + "',GETDATE(),'" + texbox_referencia.Text + "')";

        //    }

        //}

        #endregion
    }


    #region llenarComboBox-------------------

    public void llenar_combo_box_def_imapct()
    {
        DataTable dtcmbo = new DataTable();
        cnx.Open();
        cmd = new SqlCommand("select id_def_imp , defectos_impactan from def_impac_pmp", cnx);
        SqlDataAdapter dp = new SqlDataAdapter(cmd);
        dp.Fill(dtcmbo);
        texbox_defec_imapc.DataSource = dtcmbo;
        texbox_defec_imapc.DataTextField = "defectos_impactan";
        texbox_defec_imapc.DataValueField = "id_def_imp";
        texbox_defec_imapc.DataBind();
        cnx.Close();

    }
    public void llenas_combo_box_necesidades_ref()
    {
        DataTable dt = new DataTable();
        cnx.Open();
        cmd = new SqlCommand("select  relacion_def_impact_necesidades_ref.id_relacion_def_nece as id,nece_ref_pmp.necesidades_referencia " +
                            " from relacion_def_impact_necesidades_ref " +
                            " inner join nece_ref_pmp on nece_ref_pmp.id_pln_acciones = relacion_def_impact_necesidades_ref.tbl_necesi_refere " +
                            " where relacion_def_impact_necesidades_ref.tbl_defec_impact  = " + texbox_defec_imapc.SelectedValue + "", cnx);
        SqlDataAdapter dp = new SqlDataAdapter(cmd);
        dp.Fill(dt);
        texbox_necesidades.DataSource = dt;
        texbox_necesidades.DataTextField = "necesidades_referencia";
        texbox_necesidades.DataValueField = "id";
        texbox_necesidades.DataBind();
        cnx.Close();
        ;

    }
    #endregion


    protected void Unnamed_Click(object sender, EventArgs e)
    {
        mensajeGrowl("Campos ingresados con Exito", "success", "grow");
        //   conexion();
    }


    protected void texbox_defec_imapc_SelectedIndexChanged(object sender, EventArgs e)
    {
        llenas_combo_box_necesidades_ref();
    }


    protected void insertar(object sender, EventArgs e)
    {
       // conexion();
        insertar_ref();
    }

    protected void lbtag_Click(object sender, EventArgs e)
    {
        calendar1.Visible = true;
    }

    protected void calendar1_SelectionChanged(object sender, EventArgs e)
    {
        texbox_fecha_hist.Text = calendar1.SelectedDate.ToString("yyy-MM-dd");
        calendar1.Visible = false;
    }

    public void mensajeGrowl(string mensaje, string tipom, string nomscript)
    {
        //(null, 'info', 'error', 'success','warning')
        string script = "$.bootstrapGrowl('" + mensaje + "',{ type:'" + tipom + "',offset: {from: 'bottom', amount: 20},width:400});";
        ScriptManager.RegisterStartupScript(this, typeof(Page), nomscript, script, true);
    }
}
