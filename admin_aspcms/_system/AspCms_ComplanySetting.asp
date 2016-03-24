<!--#include file="AspCms_SettingFun.asp" -->
<%CheckAdmin("AspCms_ComplanySetting.asp")%>
<%getComplanySetting%>
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
</HEAD>
<BODY>
<DIV class=formzone>
<FORM name="" action="?action=savec" method="post">
<DIV class=tablezone>

<TABLE cellSpacing=0 cellPadding=8 width="100%" align=center border=0>
<TBODY>
    <TR>
    <TD width="150" class=innerbiaoti><STRONG>网站信息</STRONG></TD>
        <TD class=innerbiaoti width=661 height=28><STRONG>设置</STRONG></TD>
        </TR>
        <TR class=list>
        <TD><STRONG>网站标题 : </STRONG></TD>
        <TD width=661><INPUT class="input" size="30" style="width:300px;"  value="<%=SiteTitle%>" name="SiteTitle"/>  
			<INPUT class="input" readOnly="true" value="{aspcms:sitetitle}"/>		&nbsp;&nbsp;
			<a href="http://www.aspcms.com/article-13-1.html" class="tTip" title="如何定义网站标题<br/>一个好标题胜过好内容" target="_blank" style="color:#AAAAAA"><img src="../images/help.gif" >网站标题的优化</a></TD>
    </TR>
    <TR class=list>
        <TD><STRONG>网页附加标题 : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=AdditionTitle%>" name="AdditionTitle"/> 
		<INPUT class="input" readOnly="true" value="{aspcms:additiontitle}"/>
		&nbsp;&nbsp;<a href="http://www.aspcms.com/article-14-1.html" target="_blank" style="color:#AAAAAA"  class="tTip" title="网站副标题<br>调用标签：{aspcms:additiontitle}"><img src="../images/help.gif">网站附加标题的作用</a></TD>
    </TR>
    <TR class=list>
        <TD><STRONG>LOGO图片URL : </STRONG></TD>
        <TD align="left"><INPUT class="input" size="30" style="width:300px;"  value="<%=SiteLogoUrl%>" name="SiteLogoUrl" id="SiteLogoUrl"/>
<INPUT class="input" readOnly="true" value="{aspcms:sitelogo}"/>
		&nbsp;&nbsp;<a href="http://www.aspcms.com/article-15-1.html" target="_blank" style="color:#AAAAAA" class="tTip" title="网站LOGO图片<br>调用标签：{aspcms:sitelogo}"><img src="../images/help.gif">LOGO创意设计</a>
        </TD>
    </TR>
    <TR class=list>   
        <TD valign="top"><STRONG>上传 : </STRONG></TD>
        <TD align="left"><iframe src="../editor/upload.asp?sortType=12&stype=file&Tobj=SiteLogoUrl" scrolling="no" topmargin="0" height="40" width="100%" marginwidth="0" marginheight="0" frameborder="0" align="left"></iframe>
        </TD>
    </TR>
	 <TR class=list>
        <TD><STRONG>ico图片URL : </STRONG></TD>
        <TD align="left"><INPUT class="input" size="30" style="width:300px;"  value="favicon.ico" name="SiteicoUrl" id="SiteicoUrl" disabled/> &nbsp;&nbsp;<a href="http://www.aspcms.com/article-16-1.html" target="_blank" style="color:#AAAAAA">如何生成网站图标</a>
        </TD>
    </TR>
    <TR class=list>   
        <TD valign="top"><STRONG>上传 : </STRONG></TD>
        <TD align="left"><iframe src="../editor/upload.asp?sortType=15&stype=file&Tobj=SiteicoUrl" scrolling="no" topmargin="0" height="40" width="100%" marginwidth="0" marginheight="0" frameborder="0" align="left"></iframe>
        </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>站点网址 : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=SiteUrl%>" name="SiteUrl"/> <INPUT class="input" readOnly="true" value="{aspcms:siteurl}"/> &nbsp;&nbsp;<a href="http://www.aspcms.com/article-17-1.html" target="_blank" style="color:#AAAAAA">选择一个好的域名</a></TD>
    </TR>
    <TR class=list>
        <TD><STRONG>企业名称 : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyName%>" name="CompanyName"/> <INPUT class="input" readOnly="true" value="{aspcms:companyname}"/></TD>
    </TR>
    <TR class=list>
        <TD><STRONG>企业地址 : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyAddress%>" name="CompanyAddress"/> <INPUT class="input" readOnly="true" value="{aspcms:companyaddress}"/></TD>
    </TR>
    <TR class=list>
        <TD><STRONG>邮政编码 : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyPostCode%>" name="CompanyPostCode"/> <INPUT class="input" readOnly="true" value="{aspcms:companypostcode}"/> </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>联系人 : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyContact%>" name="CompanyContact"/> <INPUT class="input" readOnly="true" value="{aspcms:companycontact}"/> </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>电话号码 : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyPhone%>" name="CompanyPhone"/> <INPUT class="input" readOnly="true" value="{aspcms:companyphone}"/> </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>手机号码 : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyMobile%>" name="CompanyMobile"/> <INPUT class="input" readOnly="true" value="{aspcms:companymobile}"/> </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>公司传真 : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyFax%>" name="CompanyFax"/> <INPUT class="input" readOnly="true" value="{aspcms:companyfax}"/> </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>电子邮箱 : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyEmail%>" name="CompanyEmail"/> <INPUT class="input" readOnly="true" value="{aspcms:companyemail}"/> </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>备案号 : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyICP%>" name="CompanyICP"/> <INPUT class="input" readOnly="true" value="{aspcms:companyicp}"/>&nbsp;&nbsp;<a href="http://www.aspcms.com/article-18-1.html" class="tTip" title="详细解析网站备案流程" target="_blank" style="color:#AAAAAA"> <img src="../images/help.gif" >网站如何备案</a></TD>
    </TR>
   <%
   dim cnzzarr:cnzzarr=split(CNZZUSER,"@")
   %>
    <TR class=list>
        <TD><STRONG>统计代码 : </STRONG></TD>
        <TD>        
        <textarea class="textarea" name="StatisticalCode" cols="60" style="width:80%" rows="3"><% 
		if isnul(trim(StatisticalCode)) then 
			if  ubound(cnzzarr)>0 then
echo trim(decodeHtml("<script src='http://w.cnzz.com/c.php?id="&cnzzarr(0)&"&l=2' language='JavaScript' charset='gb2312'></script>"))
			end if
		else
		echo trim(decodeHtml(StatisticalCode))
		 end if%></textarea>  <INPUT class="input" readOnly="true" value="{aspcms:statisticalcode}"/> <img src="../images/help.gif" class="tTip" title="第三方统计代码<br>调用标签：{aspcms:companypostcode}">&nbsp;&nbsp;<a href="http://www.aspcms.com/article-19-1.html" target="_blank" style="color:#AAAAAA">如何申请统计代码</a>
		</TD>
    </TR>
    <TR class=list>
        <TD><STRONG>底部信息 : </STRONG></TD>
        <TD>
        <textarea class="textarea" name="CopyRight" cols="60" style="width:80%" rows="3"><%=decodeHtml(CopyRight)%></textarea> <INPUT class="input" readOnly="true" value="{aspcms:copyright}"/> <img src="../images/help.gif" class="tTip" title="版权信息<br>调用标签：{aspcms:copyright}">&nbsp;&nbsp;<a href="http://www.aspcms.com/article-20-1.html" target="_blank" style="color:#AAAAAA">网站推广方法</a>
         </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>站点关键词 : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:80%;"  value="<%=SiteKeywords%>" name="SiteKeywords"/> <INPUT class="input" readOnly="true" value="{aspcms:sitekeywords}"/> <img src="../images/help.gif" class="tTip" title="网站关键词<br>调用标签：{aspcms:sitekeywords}">&nbsp;&nbsp;<a href="http://www.aspcms.com/article-21-1.html" target="_blank" style="color:#AAAAAA">关键词的选择</a></TD>
    </TR>
    <TR class=list>
        <TD><STRONG>站点描述 : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:80%;"  value="<%=SiteDesc%>" name="SiteDesc"/> <INPUT class="input" readOnly="true" value="{aspcms:sitedesc}"/> <img src="../images/help.gif" class="tTip" title="网站信息描述<br>调用标签：{aspcms:sitedesc}">&nbsp;&nbsp;<a href="http://www.aspcms.com/article-22-1.html" style="color:#AAAAAA" target="_blank">站点描述的作用</a></TD>
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
