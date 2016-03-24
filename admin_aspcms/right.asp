<!--#include file="inc/AspCms_SettingClass.asp" -->
<%CheckLogin()	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>Home</title>
<link href="css/css_body.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		if($("#version").text().replace(" ","")==""){
			$("#version").text("网络连接失败");
		}
		if($("#developer").text().replace(" ","")==""){
			$("#developer").text("网络连接失败");
		}
		if($("#developer").text().replace(" ","")=="开源免费版"){
			$("#developer").html("开源免费版 <a href='http://www.aspcms.com/aspcms-3996-1-1.html' style='text-decoration:underline;' target='_blank'>版权声明</a>　<a href='http://www.aspcms.com/aspcms-29177-1-1.html' style='text-decoration:underline;' target='_blank'>购买授权</a>");
		}
	})
</script>
</script>
</head>

<body>
<%
if "admin_aspcms"=lcase(getAdminDir) then 
%>
<div class="bodytitle">
  <div class="bodytitleleft"></div>
  <div class="bodytitletxt">安全提示</div>
</div>
<div class="tab_bk1">
  <div class="txtbox1">
    <p class="red">您的后台管理目录为默认目录，请您使用ftp或者其他方式将后台目录重命名</p>
    <p class="red"><strong>如何提升您的网站安全性</strong>：<br />
      1、修改后台路径。<br />
      2、修改数据库路径及名称。<br />
      3、设置较为复杂的后台管理密码。</p>
  </div>
</div>
<%end if%>
<div class="bodytitle">
  <div class="bodytitleleft"></div>
  <div class="bodytitletxt">快捷功能</div>
</div>
<div class="tab_bk1">
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="60" align="center"><table width="96%" border="0" cellspacing="10" cellpadding="0" style="margin-top:5px;">
          <tr class="main_qbut">
            <td width="16%" align="center"><div style="background-position:center 10px;"><a href="_content/_Sort/AspCms_Sort.asp">栏目管理</a></div></td>
            <td width="16%" align="center"><div style="background-position:center -130px;"><a href="_content/_Content/AspCms_ContentAdd.asp?sortType=2&sortid=&keyword=&page=&psize=&order=&ordsc=">发布文档</a></div></td>
            <td width="16%" align="center"><div style="background-position:center -270px;"><a href="_content/_Content/AspCms_Recycling.asp">内容回收站</a></div></td>
            <td width="16%" align="center"><div style="background-position:center -414px;"><a href="_content/_Comments/AspCms_Comments.asp">评论管理 </a></div></td>
            <td width="16%" align="center"><div style="background-position:center -554px;"><a href="_seo/AspCms_MakeHtml.asp?actType=html">更新HTML</a></div></td>
            <td width="16%" align="center"><div style="background-position:center -694px;"><a href="_system/AspCms_SiteSetting.asp">更改系统参数 </a></div></td>
            <td width="4%" align="center">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<div class="bodytitle">
  <div class="bodytitleleft"></div>
  <div class="bodytitletxt">待处理事项</div>
</div>
<div class="tab_bk1">
  <div class="txtbox1">
    <p> <a href="_content/_Comments/AspCms_Message.asp">未回答留言</a>（<%=getDataCount("select Count(*) from {prefix}GuestBook where faqStatus=0")%>）<small>|</small> <a href="_content/_Order/AspCms_Order.asp">未处理订单</a>（<%=getDataCount("select Count(*) from {prefix}Order2 where state=0")%>）<small>|</small> <a href="_content/_Comments/AspCms_Comments.asp">未处理评论</a>（<%=getDataCount("select Count(*) from {prefix}Comments where CommentStatus=0")%>）<small>|</small> <a href="_content/_Apply/AspCms_Apply.asp">未处理应聘</a>（<%=getDataCount("select Count(*) from {prefix}Apply where ApplyStatus=0")%>）<small>|</small> </p>
  </div>
</div>
<div class="bodytitle">
  <div class="bodytitleleft"></div>
  <div class="bodytitletxt">系统信息</div>
</div>
<table width="100%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#cad9ea" >
  <tr>
    <td width="250" align="right" bgcolor="#f5fafe" class="main_bleft">服务器名称：</td>
    <td bgcolor="#FFFFFF" class="main_bright">名称 <%=Request.ServerVariables("SERVER_NAME")%>(IP:<%=Request.ServerVariables("LOCAL_ADDR")%>) 端口:<%=Request.ServerVariables("SERVER_PORT")%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft">站点物理路径：</td>
    <td bgcolor="#FFFFFF" class="main_bright"><%=Request.ServerVariables("PATH_TRANSLATED")%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft">FSO文本读写：</td>
    <td bgcolor="#FFFFFF" class="main_bright"><%If Not isInstallObj(FSO_OBJ_NAME) Then%>
      <font color="#FF0066"><b>×</b>网站不能正常使用</font>
      <%else%>
      <b>√</b>
      <%end if%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft">JMail组件：</td>
    <td bgcolor="#FFFFFF" class="main_bright"><%If Not isInstallObj("JMail.Message") Then%>
      <font color="#FF0066"><b>×</b>邮件提醒功能不能正常使用</font>
      <%else%>
      <b>√</b>
      <%end if%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft"> ASPJpeg 组件：</td>
    <td bgcolor="#FFFFFF" class="main_bright"><%If Not isInstallObj("Persits.Jpeg") Then%>
      <font color="#FF0066"><b>×</b>水印功能不能正常使用</font>
      <%else%>
      <b>√</b>
      <%end if%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft">脚本解释引擎：</td>
    <td bgcolor="#FFFFFF" class="main_bright"><%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft">服务器IIS版本：</td>
    <td bgcolor="#FFFFFF" class="main_bright"><%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
  </tr>
</table>
</body>
</html>
<%
dim host
host = request.ServerVariables("HTTP_HOST")
%>
<script type="text/javascript" src='http://iiii.aspcms.com/deveplor.asp?url=<%=host%>'></script>
<script type="text/javascript" src='http://iiii.aspcms.com/version.asp?ver=<%=currentversion%>&url=<%=host%>'></script>