 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MainPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.TBTempForValid.Text = this.txt_LoginPwd.Text;
        this.txt_LoginPwd.Attributes.Add("value", this.TBTempForValid.Text);
        if (!IsPostBack)
        {
            this.ImaBtnVerPic.ImageUrl = "Active.aspx";
        }
        //SetDefEnterControl(ImaBtnLogin);
        this.lblLoginErrorValid.Visible = false;
    }

    /// <summary>
    /// 验证码图片按钮
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ImaBtnVerPic_Click(object sender, ImageClickEventArgs e)
    {
        this.ImaBtnVerPic.ImageUrl = "Active.aspx";
    }

    public static string connectionString = ConfigurationManager.AppSettings["LessonManagement"];
    /// <summary>
    /// 登录按钮事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ImaBtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        //随机验证码验证
        string Code = Session["image"].ToString().Trim().ToUpper();
        string txtBox = this.TBValidCode.Text.ToString().Trim();
        if (txtBox == "")
        {
            this.lblLoginErrorValid.Text = "请输入验证码！";
            this.lblLoginErrorValid.Visible = true;
            return;
        }
        if (Code == txtBox.ToUpper())
        {
            string userName = this.txt_LoginUserName.Text.ToString().Trim();
            string password = this.txt_LoginPwd.Text.ToString().Trim();            

            using (SqlConnection sqlconn = new SqlConnection(connectionString))
            {
                sqlconn.Open();
                string str = @"select User_ID,User_LoginPwd from User_Info where User_LoginName = '" + userName + "'";
                SqlDataAdapter ada = new SqlDataAdapter(str, sqlconn);
                DataSet ds = new DataSet();
                ada.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0][1].ToString() != password)
                    {
                        this.lblLoginError.Text = "登录名或密码错误，请重新输入";
                    }
                    else
                    {
                        Session["User_LoginID"] = ds.Tables[0].Rows[0][0].ToString();
                        Response.Redirect("excel.aspx", false);
                    }
                }
                else
                {
                    this.lblLoginError.Text = "该用户不存在！";
                }
                sqlconn.Close();
            }                        
            
        }
        else
        {
            this.lblLoginErrorValid.Text = "验证码输入错误，请重新输入！";
            this.lblLoginErrorValid.Visible=true;
            return;
        }
    }

    /// <summary>
    /// 注册按钮事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ImaBtnReg_Click(object sender, ImageClickEventArgs e)
    {
        string text = "目前只有管理员权限可根据需求注册新用户！";
        this.ClientScript.RegisterStartupScript(this.GetType(), string.Empty, "{alert('" + text + "')}", true);
    }

    /// <summary>
    /// 回车点击事件设置按钮事件
    /// </summary>
    /// <param name="Ctrl"></param>
    private static void SetDefEnterControl(System.Web.UI.Control Ctrl)
    {
        Page mPage = Ctrl.Page;
        string mScript;
        mScript = @"<script language=""javascript"">";
        mScript += "function document.onkeydown(){";
        mScript += "var e=event.srcElement;";
        mScript += "var k=event.keyCode;";
        mScript += @"if(k==13&&document.all[""TBValidCode""].value != ""){";
        mScript += "document.all." + Ctrl.ClientID + ".click();";
        mScript += "event.cancelBubble=true;";
        mScript += "event.returnValue=false;";
        mScript += "}}</script>";

        if (mPage.ClientScript.IsClientScriptBlockRegistered(mPage.GetType(), "SetEnterControl") == false)
        {
            mPage.ClientScript.RegisterClientScriptBlock(mPage.GetType(), "SetEnterControl", mScript);
        }
    }
}