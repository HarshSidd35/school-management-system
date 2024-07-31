using System;
using System.Collections;
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

public partial class CHANGEPASS : System.Web.UI.Page
{
    //OleDbConnection cn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=F:\TTSSK\TTSSK.mdb");
    OleDbConnection cn;
    OleDbCommand com = new OleDbCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        string db_path = Server.MapPath("~/TTSSK.mdb");
        cn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + db_path);
        cn.Open();
        if (Session["USERNAME"] == null || Session["PASSWORD"] == null)
        {
            Session["SELECT"] = "CHANGEPASSWORD";
            Response.Redirect("LOGIN.aspx");
        }
    }
    protected void BTN_UPDATE_Click(object sender, EventArgs e)
    {
        try
        {
            com = new OleDbCommand("UPDATE ADMIN_TABLE SET ADMIN_TABLE.[PASSWORD] = '"+ TXT_CONFORM_PASSWORD.Text +"'", cn);
            //com = new OleDbCommand("update ADMIN_TABLE set PASSWORD='" + TXT_NEW_PASSWORD.Text + "'", cn);
            //com = new OleDbCommand("update ADMIN_TABLE set PASSWORD='" + TXT_NEW_PASSWORD.Text + "' where USERNAME='" + Session["USERNAME"] + "'", cn);
            //com = new OleDbCommand("update ADMIN_TABLE set PASSWORD=" + TXT_NEW_PASSWORD.Text , cn);
            int result;
            result = com.ExecuteNonQuery();
            if (result > 0)
            {
                Response.Write("<script>alert('PASSWORD CHANGED')</script>");
                Response.Redirect("HOME.aspx");
            }
        }
        catch (Exception x)
        {
            Response.Write("<script>alert('" + x.Message + "')</script>");
        }
    }
}
