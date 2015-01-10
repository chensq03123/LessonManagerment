using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// WebService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
 [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        string connectionString = ConfigurationManager.AppSettings["LessonManagement"];
        SqlConnection sqlconn = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sqlconn;
        cmd.CommandText = "querylesson";
        cmd.CommandType = CommandType.StoredProcedure;
        IDataParameter[] parameters ={
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

        foreach (IDbDataParameter i in parameters)
        {
            // cmd.Parameters.Add(i);
        }

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        DataProcessor.Dataset2String(ds);
        return DateTime.Now.ToString() + DataProcessor.Dataset2String(ds); ;
    }

}
