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

public partial class LOGIN : System.Web.UI.Page
{
    //OleDbConnection cn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=F:\TTSSK\TTSSK.mdb");
    OleDbConnection cn;
    OleDbCommand com = new OleDbCommand();
    OleDbDataAdapter ad = new OleDbDataAdapter();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        string db_path = Server.MapPath("~/TTSSK.mdb");
        cn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + db_path);
        cn.Open();
        /*
        ADD WHEN MASTER PAGE IS BASED ON <ASP:MENU> CONTROL
        IF SESSION IS ALREADY THERE SO GO TO PARTICULAR PAGE
        BECAUSE <ASP:MENU> ALWAYS TAKE US TO LOG IN EVEN ADMIN IS THERE
        */
        if (Session["USERNAME"] != null && Session["PASSWORD"] != null)
        {
            if (Session["SELECT"] == "TEST")
                Response.Redirect("TEST.aspx");
            else if (Session["SELECT"] == "STUDENT_DETAILS")
                Response.Redirect("STU_DETAILS.aspx");
            else if (Session["SELECT"] == "CHANGEPASSWORD")
                Response.Redirect("CHANGEPASSWORD.aspx");
            else if (Session["SELECT"] == "CHANGEUSERNAME")
                Response.Redirect("CHANGEUSERNAME.aspx");
            else if (Session["SELECT"] == "UPDATE_DELECT")
                Response.Redirect("UPDATE_STU_DETAILS.aspx");
            else
                Response.Redirect("HOME.aspx");
        }
    }
    protected void BTN_LOGIN_Click(object sender, EventArgs e)
    {
        try
        {
            //SELECT USERNAME AND PASSWORD
            ad = new OleDbDataAdapter("select * from ADMIN_TABLE", cn);
            ad.Fill(ds);
            string user, password;
            user = ds.Tables[0].Rows[0]["USERNAME"].ToString();
            password = ds.Tables[0].Rows[0]["PASSWORD"].ToString();
            //IF CORRECT GIVE SPECIFIC PAGE
            if (TXT_USERNAME.Text == user && TXT_PASSWORD.Text == password)
            {
                Session["USERNAME"] = user;
                Session["PASSWORD"] = password;
                if (Session["SELECT"] == "TEST")
                    Response.Redirect("TEST.aspx");
                else if (Session["SELECT"] == "STUDENT_DETAILS")
                    Response.Redirect("STU_DETAILS.aspx");
                else if (Session["SELECT"] == "CHANGEPASSWORD")
                    Response.Redirect("CHANGEPASSWORD.aspx");
                else if (Session["SELECT"] == "CHANGEUSERNAME")
                    Response.Redirect("CHANGEUSERNAME.aspx");
                else if (Session["SELECT"] == "UPDATE_DELECT")
                    Response.Redirect("UPDATE_STU_DETAILS.aspx");
                else
                    Response.Redirect("HOME.aspx");
            }
            else
            {
                Response.Write("<script>alert('SORRY :( ONLY ADMIN CAN ENTER')</script>");
            }
        }
        catch (Exception x)
        {
            Response.Write("<script>alert('" + x.Message + "')</script>");
        }
    }
}
