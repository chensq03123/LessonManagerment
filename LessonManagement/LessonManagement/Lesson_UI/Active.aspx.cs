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
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

/// <summary>
/// Add by Wangwei
/// </summary>
public partial class Active : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
          //显示验证码
          Session["image"] = this.GenCode(4);
          this.GenImg(Session["image"].ToString());  
          string Code = Session["image"].ToString().Trim();
          Server.Transfer("MainPage.aspx");
          //Console.WriteLine(this.GenCode(4));   
      }  
      private string GenCode(int num)  
     {
         string[] source = {   "2", "3", "4", "5", "6",  "8", "9", "A", "B", "C", "D", "E", "F", "G", "H",  "J", "K", "L", "M", "N",  "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };  
          string code = "";  
          //创建Random类的实例   
          Random rnd = new Random();  
          //获取验证码   
          for (int i = 0; i < num; i++)  
          {  
              code += source[rnd.Next(0, source.Length)];  
          }  
          //返回产生的验证码   
          return code;  
      }  
     
      //生成图片
      private void GenImg(string code)  
      {

        

          //颜色列表，用于验证码、噪线、噪点

          Color[] color ={ Color.Black, Color.Red, Color.Blue, Color.Green, Color.Orange,
 
Color.Brown, Color.DarkBlue };

          //字体列表，用于验证码

          string[] font ={ "Times New Roman", "MS Mincho", "Book Antiqua", "Gungsuh",
 
"PMingLiU", "Impact" };

          //验证码的字符集，去掉了一些容易混淆的字符


          Random rnd = new Random();

       

          //保存验证码的Cookie

          HttpCookie anycookie = new HttpCookie("validateCookie");

          anycookie.Values.Add("code", code);

          HttpContext.Current.Response.Cookies["validateCookie"].Values["code"] =

  code;

          Bitmap bmp = new Bitmap(65, 26);

          Graphics g = Graphics.FromImage(bmp);

          g.Clear(Color.White);

          //画噪线

          for (int i = 0; i < 2; i++)
          {

              int x1 = rnd.Next(65);

              int y1 = rnd.Next(26);

              int x2 = rnd.Next(65);

              int y2 = rnd.Next(26);

              Color clr = color[rnd.Next(color.Length)];

              g.DrawLine(new Pen(clr), x1, y1, x2, y2);

          }

          //画验证码字符串

          for (int i = 0; i < code.Length; i++)
          {

              string fnt = font[rnd.Next(font.Length)];

              Font ft = new Font(fnt, 14);

              Color clr = color[rnd.Next(color.Length)];

              g.DrawString(code[i].ToString(), ft, new SolidBrush(clr), (float)i * 13+7 , (float)1);

          }

          //画噪点

          for (int i = 0; i < 100; i++)
          {

              int x = rnd.Next(bmp.Width);

              int y = rnd.Next(bmp.Height);

              Color clr = color[rnd.Next(color.Length)];

              bmp.SetPixel(x, y, clr);

          }

          //清除该页输出缓存，设置该页无缓存

          Response.Buffer = true;

          Response.ExpiresAbsolute = System.DateTime.Now.AddMilliseconds(0);

          Response.Expires = 0;

          Response.CacheControl = "no-cache";

          Response.AppendHeader("Pragma", "No-Cache");

          //将验证码图片写入内存流，并将其以"image/Png" 格式输出

          MemoryStream ms = new MemoryStream();
          try
          {
              bmp.Save(ms, ImageFormat.Png);

              Response.ClearContent();

              Response.ContentType = "image/Png";

              Response.BinaryWrite(ms.ToArray());

          }

          finally
          {
              //显式释放资源

              bmp.Dispose();

              g.Dispose();

          }
      }
}