using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.OleDb;

/// <summary>
///OleDbHelper 的摘要说明
/// </summary>
public class OleDbHelper
{
	public OleDbHelper()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 将Excel表格数据存入DataSet
    /// </summary>
    /// <param name="strExcelPath"></param>
    /// <returns></returns>
    public static DataSet GetDataSetFromExcel(string strExcelPath)
    {
        DataSet ds = new DataSet();
        try
        {
            string strOleDbConn = GetOleDbConnectionString(strExcelPath);
            OleDbConnection connOleDb = new OleDbConnection(strOleDbConn);
            connOleDb.Open();
            DataTable sheetNames = connOleDb.GetOleDbSchemaTable(System.Data.OleDb.OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });
            //获取Sheet名称
            List<string> listSheetNames = new List<string>();
            foreach (DataRow dr in sheetNames.Rows)
            {
                listSheetNames.Add(dr[2].ToString());
            }
            //查询结果存入DataSet
            foreach (string strSheetName in listSheetNames)
            {
                OleDbDataAdapter adapterOleDb = new OleDbDataAdapter("select * from [" + strSheetName + "]", connOleDb);
                adapterOleDb.Fill(ds, strSheetName);
            }
            sheetNames.Dispose();
            connOleDb.Close();
            connOleDb.Dispose();
            return ds;
        }
        catch
        {
            throw;
        }
    }
    /// <summary>
    /// 获取OleDb的连接字符串
    /// </summary>
    /// <param name="strFilePath"></param>
    /// <returns></returns>
    public static string GetOleDbConnectionString(string strFilePath)
    {
        string strConn = string.Empty;
        string strFileExtension = strFilePath.Substring(strFilePath.LastIndexOf('.'));
        //不同的文件类型，不同的连接方式
        if (strFileExtension == ".xls")
        {
            strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + strFilePath + ";Extended Properties='Excel 8.0;IMEX=1';";
        }
        else if (strFileExtension == ".xlsx")
        {
          //  strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strFilePath + ";Extended Properties=\"Excel 12.0;HDR=YES;IMEX=1;\"";
            strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strFilePath + ";Extended Properties='Excel 12.0;HDR=Yes;IMEX=1;'";
        }
        else
        {
            throw new Exception("文件类型错误！");
        }
        return strConn;
    }
}