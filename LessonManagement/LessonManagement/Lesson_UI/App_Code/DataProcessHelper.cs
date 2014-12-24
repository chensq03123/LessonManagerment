using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using System.Web.UI;
using Microsoft.Office;
using Microsoft.Office.Interop;
using System.Data.OleDb;
using System.Runtime.InteropServices;
using System.Reflection;

/// <summary>
/// 处理一些数据以及数据类型的转换
/// </summary>
public class DataProcessHelper
{
    public DataProcessHelper()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    /// <summary>
    /// 从GridView的数据生成DataTable
    /// </summary>
    public DataTable GridViewToDataTable(GridView GV)
    {
        DataTable dt = new DataTable();
        int rowIndex = 0;
        List<string> cols = new List<string>();
        if (!GV.ShowHeader && GV.Columns.Count == 0)
        {
            return dt;
        }
        GridViewRow headerRow = GV.HeaderRow;
        int columnCount = headerRow.Cells.Count;
        for (int i = 0; i < columnCount; i++)
        {
            string text = GetCellText(headerRow.Cells[i]);
            cols.Add(text);
        }
        foreach (GridViewRow r in GV.Rows)
        {
            if (r.RowType == DataControlRowType.DataRow)
            {
                DataRow row = dt.NewRow();
                int j = 0;
                for (int i = 0; i < columnCount; i++)
                {
                    string text = GetCellText(r.Cells[i]);
                    if (!String.IsNullOrEmpty(text))
                    {
                        if (rowIndex == 0)
                        {
                            string columnName = cols[i];
                            if (String.IsNullOrEmpty(columnName))
                            {
                                continue;
                            }
                            if (dt.Columns.Contains(columnName))
                            {
                                continue;
                            }
                            DataColumn dc = dt.Columns.Add();
                            dc.ColumnName = columnName;
                            dc.DataType = typeof(string);
                        }
                        row[j] = text;
                        j++;
                    }
                }
                rowIndex++;
                dt.Rows.Add(row);
            }
        }
        return dt;
    }

    public static string GetCellText(TableCell cell)
    {
        string text = cell.Text;
        if (!string.IsNullOrEmpty(text))
        {
            return text;
        }
        foreach (System.Web.UI.Control control in cell.Controls)
        {
            if (control != null && control is IButtonControl)
            {
                IButtonControl btn = control as IButtonControl;
                text = btn.Text.Replace("/r/n", "").Trim();
                break;
            }
            if (control != null && control is ITextControl)
            {
                LiteralControl lc = control as LiteralControl;
                if (lc != null)
                {
                    continue;
                }
                ITextControl l = control as ITextControl;

                text = l.Text.Replace("/r/n", "").Trim();
                break;
            }
        }
        return text;
    }

    /// <summary>
    /// 将DataTable数据输出到指定的TXT文件
    /// </summary>
    public void DateTableToText(DataTable dt, String fileName)
    {
        StringBuilder sb = new StringBuilder();
        StreamWriter streamWrite = null;

        try
        {
            //如果存在要保存的文件，则删除
            if (File.Exists(fileName))
            {
                File.Delete(fileName);
            }
            //创建文件
            FileInfo file = new FileInfo(fileName);
            streamWrite = file.CreateText();
            if (dt != null)
            {
                //写数据
                string dataLine = null;
                string value = null;
                int columnCount = dt.Columns.Count;
                foreach (DataRow dr in dt.Rows)
                {
                    for (int j = 0; j < columnCount;j++ )
                    {
                        value = dr[j].ToString().Trim();
                        if (value==null||value==string.Empty)
                        {
                            value = "?";
                        }
                        sb.Append(value + ",");
                    }
                    dataLine = sb.ToString().Trim();
                    //按行写入数据
                    streamWrite.WriteLine(dataLine.Substring(0, dataLine.Length - 1));
                    sb.Remove(0,sb.Length);
                }
            }
        }
        catch (IOException ioEx)
        {
            throw ioEx;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            streamWrite.Close();
        }
    }

    /// <summary>
    /// 将DataTable中的数据导出成Excel文件格式,其代码如下：
    /// </summary>
    /// <param name="dt">将被到处的DataTable</param>
    /// <param name="fileName">到处的Excel文件路径</param>
    public void dataTableExportToExcel(DataTable dt, string fileName)
    {
        Microsoft.Office.Interop.Excel.Application m_objExcel = null;
        Microsoft.Office.Interop.Excel.Workbooks m_objWorkBooks = null;
        Microsoft.Office.Interop.Excel.Workbook m_objWorkBook = null;
        Microsoft.Office.Interop.Excel.Sheets m_objWorkSheets = null;
        Microsoft.Office.Interop.Excel.Worksheet m_objWorkSheet = null;
        try
        {
            // 查找是否有Excel的进程被打开                
            /*System.Diagnostics.Process[] arrProcesses;
            arrProcesses = System.Diagnostics.Process.GetProcessesByName("Excel");
            // 如果有打开的Excel进程,那么就关掉该进程                
            foreach (System.Diagnostics.Process myProcess in arrProcesses)
            {
                myProcess.Kill();
            }*/
            // 给变量赋值                
            Object missing = Missing.Value;
            m_objExcel = new Microsoft.Office.Interop.Excel.Application();
            m_objWorkBooks = m_objExcel.Workbooks;
            m_objWorkBook = m_objWorkBooks.Add(true);
            m_objWorkSheets = m_objWorkBook.Sheets; 
            m_objWorkSheet = (Microsoft.Office.Interop.Excel.Worksheet)m_objWorkSheets[1];
            // 在Excel表中第一行写入列名                
            int intFeildCount = dt.Columns.Count;
            for (int col = 0; col < intFeildCount; col++)
            {
                m_objWorkSheet.Cells[1, col + 1] = dt.Columns[col].ToString();
            }
            // 在列名下对应写入数据                
            for (int intRowCount = 0; intRowCount < dt.Rows.Count; intRowCount++)
            {
                for (int intCol = 0; intCol < dt.Columns.Count; intCol++)
                {
                    m_objWorkSheet.Cells[intRowCount + 2, intCol + 1] = dt.Rows[intRowCount][intCol].ToString();
                }
            }
            // 如果存在要保存的文件,则删除                
            if (File.Exists(fileName))
            {
                File.Delete(fileName);
            }
            // 保存Excel文件                
            m_objWorkBook.SaveAs(fileName, missing, missing, missing, missing,
            missing, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlNoChange, missing, missing, missing, missing, missing);
        }
        catch (COMException comEx)
        {
            throw comEx;
        }
        catch (Exception ex)
        {
            if (File.Exists(fileName))
            {
                File.Delete(fileName);
            }
            throw ex;
        }
        finally
        {
            m_objExcel.Quit();
            System.Runtime.InteropServices.Marshal.ReleaseComObject(m_objExcel);
            m_objExcel = null;
            GC.Collect();
        }
    }

    /// <summary>
    /// 将Excel数据读取或者导入DataTable中
    /// </summary>
    /// <param name="filePath">表格的路径</param>
    /// <param name="dataTable">将Excel数据存入DataTable</param>
　  public DataTable exportExcelToDataTable(string filePath)
    {
       DataTable dt=new DataTable();      
       OleDbConnection conn = null;
       //List<DataTable>
       // 查找是否有Excel的进程被打开     
       //System.Diagnostics.Process[] arrProcesses;
       //arrProcesses = System.Diagnostics.Process.GetProcessesByName("Excel");
       // 如果有打开的Excel进程,那么就关掉该进程
       //foreach (System.Diagnostics.Process myProcess in arrProcesses)
       //{
       //    myProcess.Kill();
       //}     
       try            
       {                
           //// 连接到Excel数据                
           //string strSource = "Provider=Microsoft.Jet.Oledb.4.0;Data Source=" + filePath+ ";Extended Properties=Excel 8.0;Persist Security Info=true;";
           string strSource = OleDbHelper.GetOleDbConnectionString(filePath);
           // 打开连接                
           conn = new OleDbConnection(strSource);                
           conn.Open();
            // 取数据并将其放入dataTable中
            DataTable dtt = conn.GetSchema("Tables");
            List<string> ls = new List<string>();
            foreach (DataRow dr in dtt.Rows)
            {
                ls.Add(dr["Table_Name"].ToString());
            }
            string sqlstring = @"SELECT * FROM ["+ls[0]+"]";               
            OleDbDataAdapter adapter = new OleDbDataAdapter(sqlstring, conn);                
            adapter.Fill(dt);
            return dt;
       }            
       catch (IOException ioEx)            
       {                
           throw ioEx;           
       }
       catch (Exception ex)
       {
           throw ex;
       }            
       finally           
       {               
           conn.Close();   
       }        
   }

}

