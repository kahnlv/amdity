<!--#include file="AspCms_SettingFun.asp" -->
<%CheckAdmin("AspCms_SiteSetting.asp")%>
<%getComplanySetting%>
<%
'在新变量第一次使用时，若不开启忽略则会报错
on error resume next
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<LINK href="../images/style.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.tinyTips.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
			$('a.tTip').tinyTips('title');
			$('a.imgTip').tinyTips('title');
			$('img.tTip').tinyTips('title');
			$('h1.tagline').tinyTips('tinyTips are totally awesome!');
		});
		</script>
<link rel="stylesheet" type="text/css" media="screen" href="../css/tinyTips.css" />
<script type="text/javascript">
        function SetGoogleMapGode(t){
var s = "<";
s += "script src='http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=";
s += "{aspcms:googlemapkey}' type='text/javascript'>";
s += "</";
s += "script>";
s += "\n";
s += "<";
s += "script src='http://www.google.com/uds/api?file=uds.js&amp;v=1.0' type='text/javascript'>";
s += "</";
s += "script>";
s += "\n";
s += "<";
s += "script src='http://www.google.com/uds/solutions/localsearch/gmlocalsearch.js' type='text/javascript'>";
s += "</";
s += "script>";
s += "\n";
	document.getElementById(t).innerText = s;
	document.getElementById(t).style.display = "block";
		}
        </script>
        <script type="text/javascript">
        $(function(){
			$("input[name='waterType']").change(function(){
					var $type=$("input[name='waterType']:checked").val();
					if($type==0){
						$(".textWater").css("display","block");
						$(".picWater").css("display","none");
					}else{
						$(".textWater").css("display","none");
						$(".picWater").css("display","block");
					}
			});
			$("input[name='waterMark']").change(function(){
				if($(this).val()==0){
					$(".water").css("display","none");
				}else{
					$(".water").css("display","block");
				}
			});
			$("input[name='markPicAlpha']").focus(function(){
				$("#alpha").css("display","inline-block").css("color","#CD0000");
			});
			$("input[name='markPicAlpha']").blur(function(){
				$("#alpha").css("display","none").css("color","#FFFFFF");
			});
		});
        </script>
</HEAD>
<BODY>
<DIV class=formzone>
<FORM name="" action="?action=saves" method="post">
<DIV class=tablezone>

<TABLE cellSpacing=0 cellPadding=8 width="100%" align=center border=0>
<TBODY>
    <TR>
    <TD width="193" class=innerbiaoti><STRONG>网站参数</STRONG></TD>
        <TD class=innerbiaoti width=568 height=28></TD>
    </TR>
    
    <TR class=list>
        <TD>网站运行模式 : </TD>
        <TD width=568>
        <input type="radio" name="runMode" value="0" <% if runMode=0 then echo"checked" end if %>>动态
        <input type="radio" name="runMode" value="1" <% if runMode=1 then echo"checked" end if %>>静态   <img src="../images/help.gif" class="tTip" title="如果选择静态模式，请在更新信息后在静态管理中生成所编辑的信息"> &nbsp;&nbsp;<a href="http://www.aspcms.com/article-10-1.html" style="color:#AAAAAA" target="_blank">动态和静态的优缺点与区别</a></TD>
    </TR>
    <TR class=list>
        <TD>网站后台路径 : </TD>
        <TD width=568>
        <INPUT class="input" size="30" style="width:150px;" value="<%=adminPath%>" name="adminPath"/>   <img src="../images/help.gif" class="tTip" title="更改了后台的目录后一定要将后台的名称也一起更改，否则会出现错误！">&nbsp;&nbsp;<a href="http://www.aspcms.com/article-4-1.html" style="color:#AAAAAA" target="_blank">后台路径修改指南</a></TD>
    </TR>
    <TR class=list>
        <TD>网站状态 : </TD>
        <TD width=568>
        <input type="radio" name="siteMode" value="1" <% if siteMode=1 then echo"checked" end if %>>运行
        <input type="radio" name="siteMode" value="0" <% if siteMode=0 then echo"checked" end if %>>关闭&nbsp;&nbsp;<a href="http://www.aspcms.com/article-5-1.html" style="color:#AAAAAA" target="_blank">网站状态作用说明</a>       </TD>
    </TR>
    <TR class=list>
        <TD>网站关闭说明 : </TD>
        <TD><INPUT class="input" size="30" style="width:80%" value="<%=siteHelp%>" name="siteHelp"/> </TD>
    </TR>
    <TR class=list>
        <TD>开启栏目英文名称 : </TD>
        <TD>
        	<input type="radio" value="1" name="SwitchNavEn" <% if SwitchNavEn=1 then echo "checked" end if%>>开启
            <input type="radio" value="0" name="SwitchNavEn" <% if SwitchNavEn=0 then echo "checked" end if%>>关闭 <img src="../images/help.gif" class="tTip" title="评论开关以及评论审核开关需要在页面中调用相应的评论标签才有作用">  &nbsp;&nbsp;<a href="http://www.aspcms.com/article-11-1.html" style="color:#AAAAAA" target="_blank">如何运营外贸网站</a>&nbsp;&nbsp;<a href="http://www.aspcms.com/article-12-1.html" style="color:#AAAAAA" target="_blank">网站翻译</a> </TD>
    </TR>
    <TR class=list>
      <TD>网站后台验证码开关</TD>
      <TD><input type="radio" value="1" name="admincode" <% if admincode=1 then echo "checked" end if%>>开启
        <input type="radio" value="0" name="admincode" <% if admincode=0 then echo "checked" end if%>>关闭          </TD>
    </TR>
    <TR class=list>
        <TD>评论功能开关 : </TD>
        <TD>
        	<input type="radio" value="1" name="SwitchComments" <% if SwitchComments=1 then echo "checked" end if%>>开启
            <input type="radio" value="0" name="SwitchComments" <% if SwitchComments=0 then echo "checked" end if%>>关闭 <img src="../images/help.gif" class="tTip" title="评论开关以及评论审核开关需要在页面中调用相应的评论标签才有作用">        </TD>
    </TR>
    <TR class=list>
        <TD>评论审核开关 : </TD>
        <TD><input type="radio" value="1" name="SwitchCommentsStatus" <% if SwitchCommentsStatus=1 then echo "checked" end if%>>开启
            <input type="radio" value="0" name="SwitchCommentsStatus" <% if SwitchCommentsStatus=0 then echo "checked" end if%>>关闭</TD>
    </TR>
    <TR class=list>
        <TD>留言功能开关 : </TD>
        <TD>
            <input type="radio" value="1" name="switchFaq" <% if switchFaq=1 then echo "checked" end if%>>开启
            <input type="radio" value="0" name="switchFaq" <% if switchFaq=0 then echo "checked" end if%>>关闭         </TD>
    </TR> <TR class=list>
        <TD>留言审核开关 : </TD>
        <TD>
            <input type="radio" value="1" name="SwitchFaqStatus" <% if SwitchFaqStatus=1 then echo "checked" end if%>>开启
            <input type="radio" value="0" name="SwitchFaqStatus" <% if SwitchFaqStatus=0 then echo "checked" end if%>>关闭  <img src="../images/help.gif" class="tTip" title="留言开关以及留言审核开关需要在页面中调用相应的留言标签才有作用">         </TD>
    </TR>
    <TR class=list>
        <TD>页面微博分享 : </TD>
        <TD><input type="radio" value="1" name="Share" <% if Share=1 then echo "checked" end if%>>开启
            <input type="radio" value="0" name="Share" <% if Share=0 then echo "checked" end if%>>关闭 <img src="../images/help.gif" class="tTip" title="网站中过滤掉非法字符，请在过滤设置中设置需要过滤的字符"></TD>
    </TR>
    <TR class=list>
        <TD>过滤设置开关 : </TD>
        <TD><input type="radio" value="1" name="dirtyStrToggle" <% if dirtyStrToggle=1 then echo "checked" end if%>>开启
            <input type="radio" value="0" name="dirtyStrToggle" <% if dirtyStrToggle=0 then echo "checked" end if%>>关闭 <img src="../images/help.gif" class="tTip" title="网站中过滤掉非法字符，请在过滤设置中设置需要过滤的字符">&nbsp;&nbsp;<a href="http://www.aspcms.com/article-6-1.html" style="color:#AAAAAA" target="_blank">网站安全设置指南</a></TD>
    </TR>
    <TR class=list>
        <TD>过滤设置 : </TD>
        <TD><textarea class="textarea" name="dirtyStr" cols="60" style="width:98%" rows="8"><%=decode(dirtyStr)%></textarea></TD>
    </TR>
    <!--<tr class="list picWater water" type="< %' if waterType=1 then %>display:block< %'else%>display:none< %'end if %>">
    	<td>图片设置：</td>
        <td>宽度：<input  type="text" name="markPicWidth" value="< %'=markPicWidth%>" size="4" style="vertical-align:middle">　 高度：<input type="text" me="markPicHeight" value="< %'=markPicHeight%>" size="4"  style="vertical-align:middle">　 透明度：<input type="text" value="< %'=markPicAlpha%>" size="4" name="markPicAlpha"  style="vertical-align:middle"><span id="alpha" style="display:none">(请输入小数，最大为1，最小为0，默认为0.5)</span></td>
    </tr>-->
    
    <TR>
    	<TD class=innerbiaoti><STRONG>邮件设置</STRONG></TD>
        <TD class=innerbiaoti align="right">&nbsp;&nbsp;<a href="http://www.aspcms.com/article-2-1.html" style="color:#AAAAAA" target="_blank">企业邮局设置指南</a>&nbsp;&nbsp;<a href="http://www.21sms.com" style="color:#AAAAAA" target="_blank">邮件群发</a></TD>
    </TR>   
    <TR class=list>
        <TD>邮件地址 : </TD>
        <TD><INPUT class="input" size="30" value="<%=smtp_usermail%>" name="smtp_usermail"/> </TD>
    </TR>
    <TR class=list>
        <TD>邮件账号 : </TD>
        <TD><INPUT class="input" size="30" value="<%=smtp_user%>" name="smtp_user"/> </TD>
    </TR>
    <TR class=list>
        <TD>邮件密码 : </TD>
        <TD><INPUT class="input" size="30" value="<%=smtp_password%>" name="smtp_password"/> </TD>
    </TR>
    <TR class=list>
        <TD>邮件服务器 : </TD>
        <TD><INPUT class="input" size="30" value="<%=smtp_server%>" name="smtp_server"/> </TD>
    </TR>
    <TR>
    	<TD class=innerbiaoti><STRONG>提醒功能</STRONG></TD>
        <TD class=innerbiaoti></TD>
    </TR>   
    <TR class=list>
        <TD>邮件地址 : </TD>
        <TD><INPUT class="input" size="30" value="<%=MessageAlertsEmail%>" name="MessageAlertsEmail"/> </TD>
    </TR>
    <TR class=list>
        <TD>留言提醒 : </TD>
        <TD>
        <input type="radio" name="messageReminded" value="1" <% if messageReminded=1 then echo"checked" end if %>>开启
        <input type="radio" name="messageReminded" value="0" <% if messageReminded=0 then echo"checked" end if %>>关闭  </TD>
    </TR>
    <TR class=list>
        <TD>订单提醒 : </TD>
        <TD>
        <input type="radio" name="orderReminded" value="1" <% if orderReminded=1 then echo"checked" end if %>>开启
        <input type="radio" name="orderReminded" value="0" <% if orderReminded=0 then echo"checked" end if %>>关闭  </TD>
    </TR>
    <TR class=list>
        <TD>应聘提醒 : </TD>
        <TD>
        <input type="radio" name="applyReminded" value="1" <% if applyReminded=1 then echo"checked" end if %>>开启
        <input type="radio" name="applyReminded" value="0" <% if applyReminded=0 then echo"checked" end if %>>关闭  </TD>
    </TR>
    <TR class=list>
        <TD>评论提醒 : </TD>
        <TD>
        <input type="radio" name="commentReminded" value="1" <% if commentReminded=1 then echo"checked" end if %>>开启
        <input type="radio" name="commentReminded" value="0" <% if commentReminded=0 then echo"checked" end if %>>关闭  </TD>
    </TR>
    
    <TR>
    	<TD class=innerbiaoti><a name="cnzz"></a><STRONG>CNZZ设置</STRONG></TD>
        <TD class=innerbiaoti align="right">&nbsp;</TD>
    </TR>   
    <TR class=list>
        <TD>CNZZ参数值 : </TD>
        <TD><INPUT class="input" size="30" value="<%=CNZZUSER%>" name="CNZZUSER"/> </TD>
    </TR>
</TBODY></TABLE>
</DIV>
<DIV class=adminsubmit>
<INPUT type="hidden" value="<%=LanguageID%>" name="LanguageID" />
<INPUT class="button" type="submit" value="保存" />
<INPUT class="button" type="button" value="返回" onClick="history.go(-1)"/> 
 </DIV></FORM>
</DIV>
</BODY>
</HTML>
