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

public partial class REPORT : System.Web.UI.Page
{
    //OleDbConnection cn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=F:\TTSSK\TTSSK.mdb");
    OleDbConnection cn;
    OleDbCommand com = new OleDbCommand();
    OleDbDataAdapter ad = new OleDbDataAdapter();
    DataSet ds = new DataSet();
    int obj_phy, tot_phy, obj_chem, tot_chem, obj_mb, tot_mb, marks;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string db_path = Server.MapPath("~/TTSSK.mdb");
        cn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + db_path);
        cn.Open();
    }
    protected void BTN_SUBMIT_Click(object sender, EventArgs e)
    {
        try
        {
            string STRSTD, STRGRP, TABLE;
            int COUNTER, ROW = 0;
            string[] TEST_ARRAY = new string[4];
            if (CHECK_LECTURE_TEST.Checked)
                TEST_ARRAY[0] = "LECTURE_TEST";
            if (CHECK_WEET_TEST.Checked)
                TEST_ARRAY[1] = "WEEK_TEST";
            if (CHECK_GUJCET_TEST.Checked)
                TEST_ARRAY[2] = "GUJCET_TEST";
            if (CHECK_JEE_NEET_TEST.Checked)
                TEST_ARRAY[3] = "JEE_NEET_TEST";
            STRSTD = RADIO_STD.SelectedItem.Value;
            STRGRP = RADIO_GRP.SelectedItem.Value;

            //add name and roll no
            ad = new OleDbDataAdapter("select NAME from STUDENT_" + STRSTD + "_" + STRGRP + " where ROLLNO=" + TXTROLLNO.Text, cn);
            ad.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                Response.Write("<script>alert('NO RECORDS FOUND')</script>");
            }
            else
            {
                Table1.Caption = "NAME : " + ds.Tables[0].Rows[0]["NAME"].ToString() + " ROLLNO : " + TXTROLLNO.Text;
            }
            ds.Clear();

            foreach (string TEST_NAME in TEST_ARRAY)
            {
                obj_phy = tot_phy = obj_chem = tot_chem = obj_mb = tot_mb = marks = 0;
                if (TEST_NAME != null)
                {
                    TABLE = TEST_NAME + "_" + STRSTD + "_" + STRGRP;
                    ad = new OleDbDataAdapter("select * from " + TABLE + " where ROLLNO = " + TXTROLLNO.Text, cn);
                    ad.Fill(ds);
                    COUNTER = ds.Tables[0].Rows.Count;
                    if (COUNTER == 0)
                        Response.Write("<script>alert('NO RECORDS FOUND')</script>");
                    else
                    {
                        Table1.Visible = true;
                        string SUBJECT_OB = null, SUBJECT_TOT = null;
                        if (STRGRP == "A")
                        {
                            SUBJECT_OB = "MATHS_OB";
                            SUBJECT_TOT = "MATHS_TOT";
                        }
                        else if (STRGRP == "B")
                        {
                            SUBJECT_OB = "BIOLOGY_OB";
                            SUBJECT_TOT = "BIOLOGY_TOT";
                        }

                        TableRow tr = new TableRow();
                        TableCell tc = new TableCell();


                        tc.ColumnSpan = 8;
                        tc.Text = TEST_NAME;
                        tr.Cells.Add(tc);
                        Table1.Rows.Add(tr);
                        while (ROW < COUNTER)
                        {
                            tr = new TableRow();

                            tc = new TableCell();
                            tc.Text = ds.Tables[0].Rows[ROW]["DATE_OF_EXAM"].ToString();
                            tr.Cells.Add(tc);

                            tc = new TableCell();
                            tc.Text = ds.Tables[0].Rows[ROW]["PHYSICS_OB"].ToString();
                            if (tc.Text != "AB")
                                obj_phy += Convert.ToInt32(tc.Text);
                            tr.Cells.Add(tc);

                            tc = new TableCell();
                            tc.Text = ds.Tables[0].Rows[ROW]["PHYSICS_TOT"].ToString();
                            if (tc.Text != "AB")
                                tot_phy += Convert.ToInt32(tc.Text);
                            tr.Cells.Add(tc);

                            tc = new TableCell();
                            tc.Text = ds.Tables[0].Rows[ROW]["CHEM_OB"].ToString();
                            if (tc.Text != "AB")
                                obj_chem += Convert.ToInt32(tc.Text);
                            tr.Cells.Add(tc);

                            tc = new TableCell();
                            tc.Text = ds.Tables[0].Rows[ROW]["CHEM_TOT"].ToString();
                            if (tc.Text != "AB")
                                tot_chem += Convert.ToInt32(tc.Text);
                            tr.Cells.Add(tc);

                            tc = new TableCell();
                            tc.Text = ds.Tables[0].Rows[ROW][SUBJECT_OB].ToString();
                            if (tc.Text != "AB")
                                obj_mb += Convert.ToInt32(tc.Text);
                            tr.Cells.Add(tc);

                            tc = new TableCell();
                            tc.Text += ds.Tables[0].Rows[ROW][SUBJECT_TOT].ToString();
                            if (tc.Text != "AB")
                                tot_mb = Convert.ToInt32(tc.Text);
                            tr.Cells.Add(tc);

                            tc = new TableCell();
                            tc.Text += ds.Tables[0].Rows[ROW]["TOTAL"].ToString();
                            if (tc.Text != "AB")
                                marks = Convert.ToInt32(tc.Text);
                            tr.Cells.Add(tc);

                            Table1.Rows.Add(tr);
                            ROW++;
                        }
                        //CREATE NEW ROW FOR RESULT
                        tr = new TableRow();


                        tc = new TableCell();
                        tc.ColumnSpan = 2;
                        tc.Text = "PHYSICS : " + obj_phy + "(" + tot_phy + ")";
                        tr.Cells.Add(tc);

                        tc = new TableCell();
                        tc.ColumnSpan = 2;
                        tc.Text = "CHEMISTRY : " + obj_chem + "(" + tot_chem + ")";
                        tr.Cells.Add(tc);

                        tc = new TableCell();
                        tc.ColumnSpan = 2;
                        if (STRGRP == "A")
                            tc.Text = "MATHS : " + obj_mb + "(" + tot_mb + ")";
                        else if (STRGRP == "B")
                            tc.Text = "BIOLOGY : " + obj_mb + "(" + tot_mb + ")";
                        tr.Cells.Add(tc);

                        tc = new TableCell();
                        tc.ColumnSpan = 2;
                        tc.Text = "TOTAL MARKS : " + marks + "(" + (tot_phy + tot_chem + tot_mb) + ")";
                        tr.Cells.Add(tc);

                        //TD ROW
                        Table1.Rows.Add(tr);
                    }
                }
            }
        }
        catch (Exception x)
        {
            Response.Write("<script>alert('" + x.Message + "')</script>");
        }
    }
}
