using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.IO;

public partial class _Default : System.Web.UI.Page 
{
    //OleDbConnection cn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=F:\TTSSK\TTSSK.mdb");
    OleDbConnection cn;
    OleDbCommand com = new OleDbCommand();
    string STRDATE, STRSTD, STRGRP, TABLE, STRTEST;
    int TOTAL;
    protected void Page_Load(object sender, EventArgs e)
    {
        string db_path = Server.MapPath("~/TTSSK.mdb");
        cn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + db_path);
        cn.Open();
        if (Session["USERNAME"] == null || Session["PASSWORD"] == null)
        {
            Session["SELECT"] = "TEST";
            Response.Redirect("LOGIN.aspx");
        }
    }
    protected void BTN_SUBMIT_Click(object sender, EventArgs e)
    {
        try
        {
            STRDATE = Request["TXT_DATE"];
            if (STRDATE == "")
            {
                LBL_DATE.Visible = true;
            }
            else
            {
                STRSTD = RADIO_STD.SelectedItem.Value;
                STRGRP = RADIO_GRP.SelectedItem.Value;
                STRTEST = DROP_DOWN_TEST.SelectedItem.Value;

                if (TXT_OB_PHY.Enabled == true)
                    TOTAL += Convert.ToInt32(TXT_OB_PHY.Text);
                if (TXT_OB_M_B.Enabled == true)
                    TOTAL += Convert.ToInt32(TXT_OB_M_B.Text);
                if (TXT_OB_CHE.Enabled == true)
                    TOTAL += Convert.ToInt32(TXT_OB_CHE.Text);
                TXT_TOTAL.Text = TOTAL.ToString();

                TABLE = STRTEST + "_" + STRSTD + "_" + STRGRP;
                com = new OleDbCommand("insert into " + TABLE + " values('" + TXTRNO.Text + "','" + TXT_OB_PHY.Text + "','" + TXT_TOT_PHY.Text + "','" + TXT_OB_CHE.Text + "','" + TXT_TOT_CHE.Text + "','" + TXT_OB_M_B.Text + "','" + TXT_TOT_M_B.Text + "','" + STRDATE + "','" + TOTAL + "')", cn);
                int result=0;
                try
                {
                    result = com.ExecuteNonQuery();
                }
                catch (Exception X)
                {
                    Response.Write("<script>alert('Record Not Found')</script>");
                }
                if (result > 0)
                {
                    //Response.Write("<script>alert('Record Saved')</script>");
                    MyPlaceholder.Controls.Add(new Literal() { Text = "<div class='alert alert-success alert-dismissible fade show my-3' role='alert'>  <strong>Record Saved!</strong> Roll Number " + TXTRNO.Text + " for " + STRSTD + " Group " + STRGRP + " <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button> </div>" });

                }
            }
        }
        catch (Exception X)
        {
            Response.Write("<script>alert('" + X.Message + "')</script>");
        }
    }
    protected void CHECHPHYSICS_CheckedChanged(object sender, EventArgs e)
    {
        if (CHECKPHYSICS.Checked == true)
        {
            TXT_OB_PHY.Text = "";
            TXT_OB_PHY.Enabled = true;
            TXT_TOT_PHY.Enabled = true;
            TXT_TOT_PHY.Text = "";
            REQUIRED_OB_PHY.Enabled = true;
            REQUIRED_TOT_PHY.Enabled = true;
            COMPARE_PHY.Enabled = true;
        }
        else
        {
            TXT_OB_PHY.Text = "AB";
            TXT_OB_PHY.Enabled = false;
            TXT_TOT_PHY.Text = "AB";
            TXT_TOT_PHY.Enabled=false;
            REQUIRED_OB_PHY.Enabled = false;
            REQUIRED_TOT_PHY.Enabled = false;
            COMPARE_PHY.Enabled = false;
        }
    }
    protected void CHECKCHEMISTRY_CheckedChanged1(object sender, EventArgs e)
    {
        if (CHECKCHEMISTRY.Checked == true)
        {
            TXT_OB_CHE.Text = "";
            TXT_OB_CHE.Enabled = true;
            TXT_TOT_CHE.Text = "";
            TXT_TOT_CHE.Enabled = true;
            REQUIRED_OB_CHEM.Enabled = true;
            REQUIRED_TOT_CHEM.Enabled = true;
            COMPARE_CHEM.Enabled = true;
        }
        else
        {
            TXT_OB_CHE.Text = "AB";
            TXT_OB_CHE.Enabled = false;
            TXT_TOT_CHE.Text = "AB";
            TXT_TOT_CHE.Enabled = false;
            REQUIRED_OB_CHEM.Enabled = false;
            REQUIRED_TOT_CHEM.Enabled = false;
            COMPARE_CHEM.Enabled = false;
        }
    }
    protected void CHECKM_B_CheckedChanged1(object sender, EventArgs e)
    {
         if (CHECKM_B.Checked == true)
        {
            TXT_OB_M_B.Text = "";
            TXT_OB_M_B.Enabled = true;
            TXT_TOT_M_B.Text = "";
            TXT_TOT_M_B.Enabled = true;
            REQUIRED_OB_M_B.Enabled = true;
            REQUIRED_TOT_M_B.Enabled = true;
            COMPARE_M_B.Enabled = true;
        }
        else
        {
            TXT_OB_M_B.Text = "AB";
            TXT_OB_M_B.Enabled = false;
            TXT_TOT_M_B.Text = "AB";
            TXT_TOT_M_B.Enabled = false;
            REQUIRED_OB_M_B.Enabled = false;
            REQUIRED_TOT_M_B.Enabled = false;
            COMPARE_M_B.Enabled = false;
        }
    }
}