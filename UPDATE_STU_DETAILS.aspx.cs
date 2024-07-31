using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.OleDb;
using System.IO;

public partial class UPDATE_STU_DETAILS : System.Web.UI.Page
{
    //OleDbConnection cn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=F:\TTSSK\TTSSK.mdb");
    OleDbConnection cn;
    OleDbCommand cmd;
    OleDbDataAdapter ad;
    DataSet ds;
    string STRSTD, STRGRP, FPRESENT, MPRESENT, PHYSICAL, TABLE, FILE_PATH;

    protected void Page_Load(object sender, EventArgs e)
    {
        string db_path = Server.MapPath("~/TTSSK.mdb");
        cn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + db_path);
        cn.Open();
        if (Session["USERNAME"] == null || Session["PASSWORD"] == null)
        {
            Session["SELECT"] = "UPDATE_DELECT";
            Response.Redirect("LOGIN.aspx");
        }
        if (!IsPostBack)
        {
            Panel1.Visible = false;
        }
        //FOR FILE UPLOAD CREATE DIRECTORY
        FILE_PATH = Server.MapPath("~/img/");
        if (!Directory.Exists(FILE_PATH))
        {
            Directory.CreateDirectory(FILE_PATH);
        }
    }
    protected void BTN_SEARCH_Click(object sender, EventArgs e)
    {
        try
        {
            STRSTD = RADIO_STD.SelectedItem.Value;
            STRGRP = RADIO_GRP.SelectedItem.Value;

            TABLE = "STUDENT_" + STRSTD + "_" + STRGRP;
            ad = new OleDbDataAdapter("select * from " + TABLE + " where ROLLNO = " + TXTROLLNO.Text, cn);
            ds = new DataSet();
            ad.Fill(ds);
            if (ds.Tables[0].Rows.Count >= 1)
            {
                TXTNAME.Text = ds.Tables[0].Rows[0]["NAME"].ToString();
                TXTMNO.Text = ds.Tables[0].Rows[0]["MOBILENO"].ToString();
                TXTWNO.Text = ds.Tables[0].Rows[0]["WHATSAPPNO"].ToString();
                TXTUID.Text = ds.Tables[0].Rows[0]["UID"].ToString();
                TXTAADHAR.Text = ds.Tables[0].Rows[0]["AADHARNO"].ToString();
                TXTGOAL.Text = ds.Tables[0].Rows[0]["GOAL"].ToString();
                TXTHOBBY.Text = ds.Tables[0].Rows[0]["HOBBY"].ToString();
                TXT10PER.Text = ds.Tables[0].Rows[0]["10THPER"].ToString();
                TXT10SCHOOL.Text = ds.Tables[0].Rows[0]["10THSCHOOL"].ToString();
                TXTMEMBERS.Text = ds.Tables[0].Rows[0]["FAMILYMEMBER"].ToString();
                TXTFDETAIL.Text = ds.Tables[0].Rows[0]["FAMILYDETAILS"].ToString();
                RADIO_FATHER.SelectedValue = ds.Tables[0].Rows[0]["FATHERPRESENT"].ToString();
                RADIO_MOTHER.SelectedValue = ds.Tables[0].Rows[0]["MOTHERPRESENT"].ToString();
                TXTOCCUPATION.Text = ds.Tables[0].Rows[0]["GUARDIANOCCUPATION"].ToString();
                RADIO_PHYSICAL.SelectedValue = ds.Tables[0].Rows[0]["PHYSICAL_DISABILITY"].ToString();
                TXTADDRESS.Text = ds.Tables[0].Rows[0]["ADDRESS"].ToString();
                TXT_PATH_PHOTO.Text = ds.Tables[0].Rows[0]["PHOTO"].ToString();
                IMG_PHOTO.ImageUrl = @TXT_PATH_PHOTO.Text;
                TXT_PATH_SIGN.Text = ds.Tables[0].Rows[0]["SIGN"].ToString();
                IMG_SIGN.ImageUrl = @TXT_PATH_SIGN.Text;
                Panel1.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('NO RECORD FOUND')</script>");
                Panel1.Visible = false;
            }
        }
        catch (Exception x)
        {
            Response.Write("<script>alert('" + x.Message + "')</script>");
        }
    }
    protected void BTN_UPDATE_Click(object sender, EventArgs e)
    {
        try
        {
            //FOR NEW PHOTO
            if (UPLOAD_PHOTO.HasFile==true)
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
                }
            }
            //FOR NEW SIGN
            if (UPLOAD_SIGN.HasFile==true)
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
                }
            }
            //UPDATE DATABASE
            //MAKE NEEDED VALUES
            FPRESENT = RADIO_FATHER.SelectedItem.Value;
            MPRESENT = RADIO_MOTHER.SelectedItem.Value;
            PHYSICAL = RADIO_PHYSICAL.SelectedItem.Value;
            STRSTD = RADIO_STD.SelectedItem.Value;
            STRGRP = RADIO_GRP.SelectedItem.Value;
            TABLE = "STUDENT_" + STRSTD + "_" + STRGRP;
            //FIRE QUERY
            cmd = new OleDbCommand("update " + TABLE + " set NAME='" + TXTNAME.Text.ToUpper() + "',MOBILENO='" + TXTMNO.Text + "',WHATSAPPNO='" + TXTWNO.Text + "',UID='" + TXTUID.Text + "',AADHARNO='" + TXTAADHAR.Text + "',GOAL='" + TXTGOAL.Text.ToUpper() + "',HOBBY='" + TXTHOBBY.Text.ToUpper() + "',10THPER='" + TXT10PER.Text + "',10THSCHOOL='" + TXT10SCHOOL.Text.ToUpper() + "',FAMILYMEMBER='" + TXTMEMBERS.Text + "',FAMILYDETAILS='" + TXTFDETAIL.Text.ToUpper() + "',FATHERPRESENT='" + FPRESENT + "',MOTHERPRESENT='" + MPRESENT + "',GUARDIANOCCUPATION='" + TXTOCCUPATION.Text.ToUpper() + "',PHYSICAL_DISABILITY='" + PHYSICAL + "',ADDRESS='" + TXTADDRESS.Text.ToUpper() + "',PHOTO='" + TXT_PATH_PHOTO.Text.ToString() + "',SIGN='" + TXT_PATH_SIGN.Text.ToString() + "' WHERE ROLLNO=" + TXTROLLNO.Text, cn);
            int result;
            result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                //Response.Write("<script>alert('Record Updated')</script>");
                MyPlaceholder.Controls.Add(new Literal() { Text = "<div class='alert alert-warning alert-dismissible fade show my-3' role='alert'>  <strong>Record Updated!</strong> Roll Number " + TXTROLLNO.Text + " for " + STRSTD + " Group " + STRGRP + " <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button> </div>" });
                   
            }
        }
        catch (Exception x)
        {
            Response.Write("<script>alert('" + x.Message + "')</script>");
        }
    }
    protected void BTN_DELETE_Click(object sender, EventArgs e)
    {
        try
        {
            STRSTD = RADIO_STD.SelectedItem.Value;
            STRGRP = RADIO_GRP.SelectedItem.Value;
            TABLE = "STUDENT_" + STRSTD + "_" + STRGRP;
            //FIRE QUERY
            cmd = new OleDbCommand("delete from " + TABLE + " WHERE ROLLNO=" + TXTROLLNO.Text, cn);
            int result;
            result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                //Response.Write("<script>alert('Record Deleted')</script>");
                MyPlaceholder.Controls.Add(new Literal() { Text = "<div class='alert alert-danger alert-dismissible fade show my-3' role='alert'>  <strong>Record Deleted!</strong> Roll Number " + TXTROLLNO.Text + " for " + STRSTD + " Group " + STRGRP + "  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button> </div>" });
                   
            }
            else
            {
                Response.Write("<script>alert('No Record Exist')</script>");
            }
        }
        catch (Exception x)
        {
            Response.Write("<script>alert('" + x.Message + "')</script>");
        }
    }
}