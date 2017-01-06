using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace Nicescrum_homepage
{
    public partial class Profiles : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Upload(object sender, EventArgs e)
        {
            String From = Session["Name"].ToString();
            String Skills = txtskills.Text.Replace("'", "''");
            string Filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string Content_type = FileUpload1.PostedFile.ContentType;
            string connectioninfo;
            SqlConnection db;

            connectioninfo = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

            db = new SqlConnection(connectioninfo);
            db.Open();

            int currnum = 0;
            string sql2 = String.Format(@"select max(id) from profile");
            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = db;
            cmd2.CommandText = sql2;
            try
            {
                object result = new object();
                result = cmd2.ExecuteScalar();
                string maxVal = Convert.ToString(result);
                currnum = Convert.ToInt32(maxVal) + 1;
            }
            catch { }
            using (Stream fs = FileUpload1.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {   
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "insert into profile values (@Id, @Name, @Skills, @Filename, @Content_type, @Data)";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@Id", currnum);
                            cmd.Parameters.AddWithValue("@Name", From);
                            cmd.Parameters.AddWithValue("@Skills", Skills);
                            cmd.Parameters.AddWithValue("@Filename", Filename);
                            cmd.Parameters.AddWithValue("@Content_type", Content_type);
                            cmd.Parameters.AddWithValue("@Data", bytes);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            Label1.Visible = true;
                            Label1.Text = "Your data stored successfully!";
                        }
                    }
                }
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string myString = e.Row.Cells[1].Text;

                string result = string.Empty;

                for (int i = 0; i < myString.Length; i++)
                    result += (i % 165 == 0 && i != 0) ? (myString[i].ToString() + "<br/>") : myString[i].ToString();

                e.Row.Cells[1].Text = result;
            }
        }
        protected void DownloadFile(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string Filename, Content_type;
            string constr = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select Filename, Data, Content_type from tblFiles where Id=@Id";
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["Data"];
                        Content_type = sdr["Content_type"].ToString();
                        Filename = sdr["Filename"].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = Content_type;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Filename);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }
    }
}