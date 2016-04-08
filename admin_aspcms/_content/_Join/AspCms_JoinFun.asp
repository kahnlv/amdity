<!--#include file="../../inc/AspCms_SettingClass.asp" -->
<%
   CheckAdmin("AspCms_Join.asp")
   
   dim sortType, keyword, page, psize, order, ordsc, sortid
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
    end select
    
    Sub delJoin
        Dim id : id = getForm("id","both")
        if isnul(id) then alertMsgAndGo "请选择要删除的内容","-1"
        Conn.Exec "delete from {prefix}Join where ApplyID in("&id&")","exe"
        alertMsgAndGo "删除成功","?page="&page&"&order="&order&"&sort="&sortID&"&keyword="&keyword
    End Sub
    
    Sub getContent
        dim id:id=getForm("id","get")
        if not isnul(id) then
            Dim rs : set rs =  conn.exec "select * from {prefix}Join where Joinid = "&id,"r1"
            if not rs.eof then
                 
            end if
        end if        
    End Sub
%>