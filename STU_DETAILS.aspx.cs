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
    string STRSTD, STRGRP, FPRESENT, MPRESENT, PHYSICAL, TABLE, FILE_PATH, STRYEAR;
    protected void Page_Load(object sender, EventArgs e)
    {
        string db_path = Server.MapPath("~/TTSSK.mdb");
        cn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + db_path);
        cn.Open();
        if (Session["USERNAME"] == null || Session["PASSWORD"] == null)
        {
            Session["SELECT"] = "STUDENT_DETAILS";
            Response.Redirect("LOGIN.aspx");
        }
        LBL_PHOTO.Visible = false;
        LBL_SIGN.Visible = false;
        LBL_DATE.Visible = false;
        //FOR FILE UPLOAD CREATE DIRECTORY
        FILE_PATH = Server.MapPath("~/img/");
        if (!Directory.Exists(FILE_PATH))
        {
            Directory.CreateDirectory(FILE_PATH);
        }
    }
    protected void BTN_SUBMIT_Click(object sender, EventArgs e)
    {
        try
        {
            //PHOTO
            if (UPLOAD_PHOTO.HasFile)
            {
                if (UPLOAD_PHOTO.PostedFile.ContentType == "image/jpeg" && UPLOAD_PHOTO.PostedFile.ContentLength < 204800)
                {
                    //GET THE FILE NAME
                    string FILE_NAME_PHOTO = Path.GetFileName(UPLOAD_PHOTO.FileName);
                    //SAVE THE FILE
                    UPLOAD_PHOTO.SaveAs(FILE_PATH + FILE_NAME_PHOTO);
                    //DISPLAY FILE AND PATH
                    IMG_PHOTO.ImageUrl = "~/img/" + FILE_NAME_PHOTO;
                    TXT_PATH_PHOTO.Text = IMG_PHOTO.ImageUrl.ToString();
                    //MAINTAIN FLAG
                    LBL_PHOTO.Visible = false;
                }
                else
                {
                    //ERROR IN SIZE AND TYPE GIVES ERROR MESSAGE
                    LBL_PHOTO.Visible = true;
                    UPLOAD_PHOTO.Focus();
                }
            }
            //SIGN
            if (UPLOAD_SIGN.HasFile)
            {
                if (UPLOAD_SIGN.PostedFile.ContentType == "image/jpeg" && UPLOAD_SIGN.PostedFile.ContentLength < 51200)
                {
                    //GET FILE NAME
                    string FILE_NAME_SIGN = Path.GetFileName(UPLOAD_SIGN.FileName);
                    //SAVE FILE
                    UPLOAD_SIGN.SaveAs(FILE_PATH + FILE_NAME_SIGN);
                    //SHOW IMAGE AND PATH
                    IMG_SIGN.ImageUrl = "~/img/" + FILE_NAME_SIGN;
                    TXT_PATH_SIGN.Text = IMG_SIGN.ImageUrl.ToString();
                    //MAINTAIN FLAG
                    LBL_SIGN.Visible = false;
                }
                else
                {
                    //ERROR IN SIZE AND TYPE GIVES ERROR MESSAGE
                    LBL_SIGN.Visible = true;
                    UPLOAD_SIGN.Focus();
                }
            }
            //CONNECTIVITY
            /* CHECK FOR DIFFERENT ABSENCE */
            string STRDATE = Request["TXTDOB"];
            if (STRDATE == "")
            {
                LBL_DATE.Text = "PLEASE SELECT DATA";
                LBL_DATE.Visible = true;
                LBL_DATE.Focus();
            }
            if (!UPLOAD_PHOTO.HasFile)
            {
                TXT_PATH_PHOTO.Text = "-";
            }
            if (!UPLOAD_SIGN.HasFile)
            {
                TXT_PATH_SIGN.Text = "-";
            }
            //SAVE RECORD IF ALL THINGS ARE OK
            if (LBL_DATE.Visible == false && LBL_PHOTO.Visible == false && LBL_SIGN.Visible == false)
            {
                try
                {
                    STRYEAR = DROP_DOWN_ADMISSION_YEAR.SelectedValue;
                    STRSTD = RADIO_STD.SelectedItem.Value;
                    STRGRP = RADIO_GRP.SelectedItem.Value;
                    FPRESENT = RADIO_FATHER.SelectedItem.Value;
                    MPRESENT = RADIO_MOTHER.SelectedItem.Value;
                    PHYSICAL = RADIO_PHYSICAL.SelectedItem.Value;

                    if (TXTUID.Text == "")
                    {
                        TXTUID.Text = "-";
                    }
                    TABLE = "STUDENT_" + STRSTD + "_" + STRGRP;
                    com = new OleDbCommand("insert into " + TABLE + " values('" + STRYEAR + TXTROLLNO.Text + "','" + TXTNAME.Text.ToUpper() + "','" + STRDATE + "','" + TXTMNO.Text + "','" + TXTWNO.Text + "','" + TXTUID.Text + "','" + TXTAADHAR.Text + "','" + TXTGOAL.Text.ToUpper() + "','" + TXTHOBBY.Text.ToUpper() + "','" + TXT10PER.Text + "','" + TXT10SCHOOL.Text.ToUpper() + "','" + TXTMEMBERS.Text + "','" + TXTFDETAIL.Text.ToUpper() + "','" + FPRESENT + "','" + MPRESENT + "','" + TXTOCCUPATION.Text.ToUpper() + "','" + PHYSICAL + "','" + TXTADDRESS.Text.ToUpper() + "','" + TXT_PATH_PHOTO.Text.ToString() + "','" + TXT_PATH_SIGN.Text.ToString() + "')", cn);
                    int result;
                    result = com.ExecuteNonQuery();
                    if (result > 0)
                    {
                        // Response.Write("<script>alert('Record Saved')</script>");

                        MyPlaceholder.Controls.Add(new Literal() { Text = "<div class='alert alert-success alert-dismissible fade show my-3' role='alert'>  <strong>Record Saved!</strong> Name " + TXTNAME.Text + " for " + STRSTD + " Group " + STRGRP + " Taking Admission In Year " + STRYEAR + " <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button> </div>" });
                        FUNCTION_CLEAR();
                    }
                }
                catch (Exception x)
                {
                    Response.Write("<script>alert('" + x.Message + "')</script>");
                }
            }
        }
        catch (Exception x)
        {
            Response.Write("<script>alert('" + x.Message + "')</script>");
        }
    }
    private void FUNCTION_CLEAR()
    {
        DROP_DOWN_ADMISSION_YEAR.ClearSelection();
        TXTROLLNO.Text = "";
        TXTNAME.Text = "";
        RADIO_STD.ClearSelection();
        RADIO_GRP.ClearSelection();
        TXTMNO.Text = "";
        TXTWNO.Text = "";
        TXTUID.Text = "";
        TXTAADHAR.Text = "";
        TXTGOAL.Text = "";
        TXTHOBBY.Text = "";
        TXT10PER.Text = "";
        TXT10SCHOOL.Text = "";
        TXTMEMBERS.Text = "";
        TXTFDETAIL.Text = "";
        RADIO_FATHER.ClearSelection();
        RADIO_MOTHER.ClearSelection();
        TXTOCCUPATION.Text = "";
        RADIO_PHYSICAL.ClearSelection();
        TXTADDRESS.Text = "";
        TXT_PATH_PHOTO.Text = "";
        IMG_PHOTO.ImageUrl = "";
        IMG_SIGN.ImageUrl = "";
        TXT_PATH_SIGN.Text = "";
    }
}