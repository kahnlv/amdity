<!--#include file="inc/AspCms_SettingClass.asp" -->
<%
echoContent()
Sub echoContent()
	dim page,keys
	page=filterPara(getForm("page","both"))
	keys=filterPara(getForm("keys","both"))
	if isNul(keys) then alertMsgAndGo "������ؼ���","-1"
	if isNul(page) then page=1
	if isNum(page) then page=clng(page) else echoMsgAndGo "ҳ�治����",3 end if
	
	dim templateobj,channelTemplatePath : set templateobj=new TemplateClass
	dim typeIds,rsObj,rsObjtid,Tid,rsObjSmalltype,rsObjBigtype
	Dim templatePath,tempStr	
	templatePath=sitePath&"/"&"templates/"&setting.defaultTemplate&"/"&setting.htmlFilePath&"/search.html"	
	'die templatePath
	if not CheckTemplateFile(templatePath) then echo "search.html"&err_16

	with templateObj 
		.content=loadFile(templatePath)	
		.parseHtml()
		.indexpath
		.parseCommon() 		
		.parseList 0,page,"searchlist",keys,"searchlist"		
		echo .content 
	end with
	set templateobj =nothing : terminateAllObjects
End Sub
%>