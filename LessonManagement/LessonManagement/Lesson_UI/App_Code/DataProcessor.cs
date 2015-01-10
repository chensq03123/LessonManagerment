using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// DataProcessor 的摘要说明
/// </summary>
public class DataProcessor
{
    public DataProcessor()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public static String Dataset2String(DataSet dataset)
    {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < dataset.Tables.Count; i++)
        {
            sb.Append("{");
            sb.Append(string.Format("\"{0}\":[",dataset.Tables[i].TableName));
            for (int j = 0; j < dataset.Tables[i].Rows.Count; j++)
            {
                sb.Append("{");
                for (int k = 0; k < dataset.Tables[i].Columns.Count; k++)
                {
                    sb.Append(string.Format("\"{0}\":\"{1}\",", dataset.Tables[i].Columns[k].ColumnName, dataset.Tables[i].Rows[j][k].ToString()));
                }
                sb.Remove(sb.Length - 1,1);
                sb.Append("},");
            }
            sb.Remove(sb.Length - 1, 1);
            sb.Append("]},");
        }

        sb.Remove(sb.Length-1,1);
        sb.Append("]");
        return sb.ToString();
    }
}