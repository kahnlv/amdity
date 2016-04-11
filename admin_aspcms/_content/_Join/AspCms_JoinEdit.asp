<!--#include file="AspCms_JoinFun.asp" -->
<%getContent%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<LINK href="../../images/style.css" type=text/css rel=stylesheet>
</HEAD>
<BODY>
<FORM name="form" action="?act=on&id=<%=JoinId%>" method="post" >
<DIV class=formzone>
<DIV class=namezone>查看招商加盟信息</DIV>
<DIV class=tablezone>
<DIV class=noticediv id=notice></DIV>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
<TBODY>
<TR>						
<TD align=middle width=100 height=30>公司名称</TD>
<TD><INPUT class="input" style="WIDTH: 200px" maxLength="200" name="CompanyName" value="<%=CompanyName%>"/> <FONT color=#ff0000>*</FONT> </TD>
</TR>
<TR>
    <TD align=middle width=100 height=30>公司地址</TD>    
    <TD><input name="CompanyAddress" class="input"  type="text" style="width:350px;" value="<%=CompanyAddress%>" /></TD>
</TR>
<TR>
    <TD align=middle width=100 height=30>公司网址</TD>    
    <TD><input name="CompanyUrl" class="input"  type="text" style="width:350px;" value="<%=CompanyUrl%>" /></TD>
</TR>
<TR>
    <TD align=middle width=100 height=30>在线联系方式</TD>    
    <TD><input name="OnlineContact" class="input"  type="text" style="width:160px;" value="<%=OnlineContact%>" /></TD>
</TR>
<TR>
    <TD align=middle width=100 height=30>联系电话</TD>    
    <TD><input name="Phone" class="input"  type="text" style="width:160px;" value="<%=Phone%>" /></TD>
</TR>
<TR>
    <TD align=middle width=100 height=30>电子邮箱</TD>    
    <TD><input name="Email" class="input"  type="text" style="width:160px;" value="<%=Email%>" /></TD>
</TR>
<TR>
    <TD align=middle width=100 height=30>公司优势</TD>
    <TD>
        <textarea name="Advantage" class="textarea"  value="<%=Advantage%>" cols="40" rows="6" style="width:500px"></textarea></TD>
</TR>
<TR>
    <TD align=middle width=100 height=30>查看状态</TD>
    <TD><input class="input" type="checkbox"  value="1" name="IsRead" <% if IsRead then echo"checked=""checked"""%>/></TD>
</TR>
  
</TBODY>
</TABLE>
</DIV>
<DIV class=adminsubmit>
<input type="hidden"  name="JoinId" value="<%=JoinId%>"/>
<INPUT class="button" type="submit" value="已阅" />
<INPUT class="button" type="button" value="返回" onClick="history.go(-1)"/> 
</DIV></DIV></FORM>

</BODY></HTML>    