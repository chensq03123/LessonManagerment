using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;

public partial class excel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User_LoginID"] == null)
            {
                Response.Redirect("MainPage.aspx", false);
            }
        }
        DropDownList1.DataSource = Query("select Teacher_Name from [teacher_info]");
        DropDownList1.DataTextField = "Teacher_Name";
        DropDownList1.DataValueField = "Teacher_Name";
        DropDownList1.DataBind();


    }

    DataProcessHelper DPH = new DataProcessHelper();
    public static string connectionString = ConfigurationManager.AppSettings["LessonManagement"];

    protected string strExcelPath = ConfigurationManager.AppSettings["ExcelPath"].ToString();
    public static int ExecuteSql(string SQLString)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(SQLString, connection))
            {
                try
                {
                    connection.Open();
                    int rows = cmd.ExecuteNonQuery();
                    return rows;
                }
                catch (System.Data.SqlClient.SqlException e)
                {
                    connection.Close();
                    throw e;
                }
            }
        }
    }


    public static DataSet Query(string SQLString)
    {
        
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            //connection.ConnectionTimeout = 360;
            DataSet ds = new DataSet();


            try
            {
                connection.Open();
                SqlDataAdapter command = new SqlDataAdapter(SQLString, connection);
                command.SelectCommand.CommandTimeout = 360;
                command.Fill(ds, "ds");
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                throw new Exception(ex.Message);
            }

            return ds;
        }

    }
    
    
    //导入excel到网页表格
    protected void import_Click(object sender, EventArgs e)
    {
        string strFullPath = String.Empty;
        if (this.FileUpload1.HasFile)
        {
            //string fileExtension = System.IO.Path.GetExtension(FileUploadBasicIndex.FileName).ToLower();
            string strPathServer = Server.MapPath(strExcelPath);
            string strpath = FileUpload1.PostedFile.FileName;
            string strFileName = FileUpload1.FileName;
            if (strpath == strFileName)
            {
                strFullPath = strPathServer + "\\" + strFileName;
            }
            else
            {
                strFullPath = strpath;
            }
            DataTable dtExcel = DPH.exportExcelToDataTable(strFullPath);
            this.GridView1.DataSource = dtExcel;
            this.GridView1.DataBind();
        }
        else
        {
            string text = "请导入文件！";
            this.ClientScript.RegisterStartupScript(this.GetType(), string.Empty, "{alert('" + text + "')}", true);
        }       
    }

    //导出表格到excel
    protected void export_Click(object sender, EventArgs e)
    {
        /*DataTable dt = new DataTable();
        dt = DPH.GridViewToDataTable(this.GridView1);
        if (dt.Rows.Count>0)
        {
            DPH.dataTableExportToExcel(dt, "c:\\exportExcel.xls");
            Response.Write("<script>alert('成功!')</script>");
        } 
        else
        {
            string text = "没有数据源！";
            this.ClientScript.RegisterStartupScript(this.GetType(), string.Empty, "{alert('" + text + "')}", true);
        } */
        SqlConnection sqlconn = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sqlconn;
        cmd.CommandText = "addplan";
        cmd.CommandType = CommandType.StoredProcedure;
        IDataParameter[] parameters={
            new SqlParameter("@T_id", SqlDbType.Int, 4),
             new SqlParameter("@L_id", SqlDbType.Int, 4),
             new SqlParameter("@w_begin", SqlDbType.Int, 4),
             new SqlParameter("@w_end", SqlDbType.Int, 4),
            new SqlParameter("@classnum", SqlDbType.Int, 4),
            new SqlParameter("@weeknum", SqlDbType.Int, 4)
        };

        parameters[0].Value = 1004;
        parameters[1].Value = 2;
        parameters[2].Value = 4;
        parameters[3].Value = 12;
        parameters[4].Value = 1;
        parameters[5].Value = 4;

        foreach(IDbDataParameter i in parameters)
        {
            cmd.Parameters.Add(i);
        }

        sqlconn.Open();
        TextBox1.Text = cmd.ExecuteNonQuery().ToString();
        sqlconn.Close();



               
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ExecuteSql("insert  INTO [teacher_info]([Teacher_Name]) values (N' "+TextBox1.Text.ToString()+" ' )");
        Response.Write("<script>alert('添加成功!"+TextBox1.Text.ToString()+"')</script>");
        DropDownList1.DataSource = Query("select Teacher_Name from [teacher_info]");
        DropDownList1.DataTextField = "Teacher_Name";
        DropDownList1.DataValueField = "Teacher_Name";
        DropDownList1.DataBind();
    }
}