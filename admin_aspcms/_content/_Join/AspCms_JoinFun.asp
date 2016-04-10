<!--#include file="../../inc/AspCms_SettingClass.asp" -->
<%
   CheckAdmin("AspCms_Join.asp")
   
   dim sortType, keyword, page, psize, order, ordsc
    sortType=getForm("sortType","get")
    if isnul(sortType) then sortType=0	
    sortid=getForm("sortid","post")	
    if isnul(sortid) then sortid=getForm("sortid","get")
    keyword=getForm("keyword","post")
    if isnul(keyword) then keyword=getForm("keyword","get")
    page=getForm("page","get")
    psize=getForm("psize","get")
    order=getForm("order","get")
    ordsc=getForm("ordsc","get")

    dim action : action=getForm("act","get")
    
    select case action
        case "del": delJoin
        case "on": updateIsRead 1
        case "off": updateIsRead 0
    end select
    
    dim JoinId,SortID,UserID,CompanyName,CompanyUrl,CompanyAddress,OnlineContact,Phone,Email,Advantage,IsRead,CreateTime
    
    Sub delJoin
        Dim id : id = getForm("id","both")
        if isnul(id) then alertMsgAndGo "请选择要删除的内容","-1"
        Conn.Exec "delete from {prefix}Join where JoinID in("&id&")","exe"
        alertMsgAndGo "删除成功","?page="&page&"&order="&order&"&sort="&sortID&"&keyword="&keyword
    End Sub
    
    Sub getContent
        dim id:id=getForm("id","get")
        if not isnul(id) then
            Dim rs : set rs =  conn.exec ("select * from {prefix}Join where Joinid = "&id,"r1")
            if not rs.eof then
                 JoinId=rs("JoinId")
                 SortID=rs("SortID")
                 UserID=rs("UserID")
                 CompanyName=rs("CompanyName")
                 CompanyUrl=rs("CompanyUrl")
                 CompanyAddress=rs("CompanyAddress")
                 OnlineContact=rs("OnlineContact")
                 Phone=rs("Phone")
                 Email=rs("Email")
                 Advantage=rs("Advantage")
                 IsRead=rs("IsRead")
                 CreateTime=rs("CreateTime")
            end if
        else		
		    alertMsgAndGo "没有这条记录","-1"
        end if        
    End Sub
    
    Sub updateIsRead(IsRead)
        Dim id : id = getForm("id","both")
        dim strSql
        if not isnul(id) then
            strSql = "update {prefix}Join set IsRead="&IsRead&" where JoinID="&id
            conn.exec strSql, "exe"
            alertMsgAndGo "修改成功","AspCms_Join.asp?page="&page&"&keyword="&keyword
        else		
		    alertMsgAndGo "没有这条记录","-1"
        end if
    End Sub
    
    Sub JoinList
        dim datalistObj,rsArray
        dim m,i,JoinStr,whereStr,sqlStr,rsObj,allPage,allRecordset,numPerPage,searchStr
        numPerPage=10
        JoinStr = " order by JoinId desc"
        if isNul(page) then page=1 else page=clng(page)
	    if page=0 then page=1
        whereStr =" where 1=1 "
        if not isnul(keyword) then
            whereStr = whereStr&" and CompanyName like '%"&keyword&"%' or Phone like '%"&keyword&"%'"
        end if
        sqlStr = "select JoinId,SortID,UserID,CompanyName,CompanyUrl,CompanyAddress,OnlineContact,Phone,Email,Advantage,IsRead,CreateTime from {prefix}Join "&whereStr&JoinStr
        
        set rsObj = conn.exec(sqlStr,"r1")
        rsObj.pagesize = numPerPage
        allRecordset = rsObj.recordcount : allPage= rsObj.pagecount
        if page>allPage then page=allPage
        if allRecordset=0 then
            if not isNul(keyword) then
                echo "<tr bgcolor=""#FFFFFF"" align=""center""><td colspan='9'>关键字 <font color=red>"""&keyword&"""</font> 没有记录</td></tr>" 
            else
                echo "<tr bgcolor=""#FFFFFF"" align=""center""><td colspan='9'>还没有记录!</td></tr>"
            end if
        else 
		rsObj.absolutepage = page
		for i = 1 to numPerPage	
			 echo "<tr bgcolor=""#ffffff"" align=""center"" onMouseOver=""this.bgColor='#CDE6FF'"" onMouseOut=""this.bgColor='#FFFFFF'"">"&vbcrlf& _
				"<td><input type=""checkbox"" name=""id"" value="""&rsObj(0)&""" class=""checkbox"" /></td>"&vbcrlf& _
				"<td>"&rsObj(0)&"</td>"&vbcrlf& _
				"<td>"&rsObj("CompanyName")&"</td>"&vbcrlf& _
				"<td>地址："&rsObj("CompanyAddress")&"<br/>网址："&rsObj("CompanyUrl")&"</td>"&vbcrlf& _
				"<td>"&rsObj("phone")&"/"&rsObj("Email")&"</td>"&vbcrlf& _
				"<td>"&rsObj("CreateTime")&"</td>"&vbcrlf& _
				"<td>"&getStr(rsObj("IsRead"),"<a href=""?act=off&id="&rsObj(0)&"&sortType="&sortType&"&keyword="&keyword&"&page="&page&"&psize="&psize&"&order="&order&"&ordsc="&ordsc&""" title=""已查看"" ><IMG src=""../../images/toolbar_ok.gif""></a>","<a href=""?act=on&id="&rsObj(0)&"&sortType="&sortType&"&keyword="&keyword&"&page="&page&"&psize="&psize&"&order="&order&"&ordsc="&ordsc&""" title=""未查看"" ><IMG src=""../../images/toolbar_no.gif""></a>")&"</td>"&vbcrlf& _
				"<td><a href=""AspCms_JoinEdit.asp?id="&rsObj(0)&"&sortType="&sortType&"&keyword="&keyword&"&page="&page&"&psize="&psize&"&order="&order&"&ordsc="&ordsc&""" >查看</a> | <a href=""?act=del&id="&rsObj(0)&"&sortType="&sortType&"&keyword="&keyword&"&page="&page&"&psize="&psize&"&order="&order&"&ordsc="&ordsc&"""  onClick=""return confirm('确定要删除吗')"">删除</a></td>"&vbcrlf& _
				
			  "</tr>"&vbcrlf
			rsObj.movenext
			if rsObj.eof then exit for
		next
		echo"<tr bgcolor=""#FFFFFF"" class=""pagenavi"">"&vbcrlf& _
			"<td colspan=""8"" height=""28"" style=""padding-left:20px;"">"&vbcrlf& _			
		"页数："&page&"/"&allPage&"  每页"&numPerPage &" 总记录数"&allRecordset&"条 <a href=""?sortType="&sortType&"&sortid="&sortid&"&keyword="&keyword&"&page=1&psize="&psize&"&order="&order&"&ordsc="&ordsc&""">首页</a> <a href=""?sortType="&sortType&"&sortid="&sortid&"&keyword="&keyword&"&page="&(page-1)&"&psize="&psize&"&order="&order&"&ordsc="&ordsc&""">上一页</a> "&vbcrlf
		dim pageNumber
		pageNumber=makePageNumber_(page, 10, allPage, "newslist",sortID, order,keyword,"")
		echo pageNumber
		echo"<a href=""?sortType="&sortType&"&sortid="&sortid&"&keyword="&keyword&"&page="&(page+1)&"&psize="&psize&"&order="&order&"&ordsc="&ordsc&""">下一页</a> <a href=""?sortType="&sortType&"&sortid="&sortid&"&keyword="&keyword&"&page="&allPage&"&psize="&psize&"&order="&order&"&ordsc="&ordsc&""">尾页</a>"&vbcrlf&_		
			"</td>"&vbcrlf& _			
		"</tr>"&vbcrlf 
        end if 
	    rsObj.close : set rsObj = nothing	
    End Sub
%>