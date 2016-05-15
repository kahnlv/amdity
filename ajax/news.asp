<!--#include file="../inc/AspCms_SettingClass.asp"-->
<%
    Dim action:action = getForm("act","get")
    Dim ClassId,jsonData,itemIndex,pageIndex,pageSize,totalCount,parentID
    
    if len(action) > 0 then
        select case action
            case "class": getclass
            case "list": newslist
            case "getall": getAllList
            case "links": getLinks
        end select
    else
        setting.setResultMessage -1,"非法操作",""
    end if
    
    Sub getLinks
        Dim rs:set rs = Conn.Exec("SELECT LinkText, ImageURL, LinkURL FROM AspCms_Links WHERE   (LinkStatus = 1) ORDER BY LinkOrder","r1")
        itemIndex = 1
            jsonData = "["
            do while not rs.eof
                jsonData = jsonData&"{"
                jsonData = jsonData&"""text"":"""&rs("LinkText")&""","
                if isnul(rs("ImageURL")) then
                    jsonData = jsonData&"""imgurl"":"""","
                else
                    jsonData = jsonData&"""imgurl"":"&rs("ImageURL")&","
                end if
                jsonData = jsonData&"""url"":"""&rs("LinkURL")&""""
                
                if itemIndex = rs.recordcount then                    
                    jsonData = jsonData&"}"
                else
                    jsonData = jsonData&"},"
                    itemIndex= itemIndex + 1
                end if
                rs.movenext
            loop
            jsonData = jsonData&"]"
            setting.setResultMessage 0,"操作成功",jsonData
    End Sub
    
    Sub getclass
        ClassId = getForm("id","get")
        if isnul(ClassId) then
            setting.setResultMessage -1,"非法操作",""
        else
            Dim rs :set rs = Conn.Exec("select * from {prefix}Sort where ParentID = "&ClassId&" order by SortOrder","r1")
            itemIndex = 1
            jsonData = "["
            do while not rs.eof
                jsonData = jsonData&"{"
                jsonData = jsonData&"""id"":"&rs("SortID")&","
                jsonData = jsonData&"""name"":"""&rs("SortName")&""""
                
                if itemIndex = rs.recordcount then                    
                    jsonData = jsonData&"}"
                else
                    jsonData = jsonData&"},"
                    itemIndex= itemIndex + 1
                end if
                rs.movenext
            loop
            jsonData = jsonData&"]"
            setting.setResultMessage 0,"操作成功",jsonData
        end if        
    End Sub
    
    sub getAllList
        Dim strSql:strSql = "select "
        ClassId = getForm("id","get")
        parentID = getForm("pid","get")
        
        pageSize = getForm("ps","get")
        if not isnul(pageSize) then
            strSql = strSql & "top 6 "
        end if
        
        if not isnul(ClassId) then
            strSql = strSql & "Title,ContentID,Content,AddTime from {prefix}Content WHERE (SortID = "&ClassId&") and ContentStatus = 1 order by ContentOrder DESC, ContentID desc"
        elseif not isnul(parentID) then
            strSql = strSql & " c.Title,c.ContentID,c.Content,c.AddTime from ({prefix}Content c INNER JOIN {prefix}Sort s ON c.SortID = s.SortID) WHERE (s.parentID = "&parentID&") and c.ContentStatus = 1 order by c.ContentOrder DESC, c.ContentID desc"
        else
            setting.setResultMessage -1,"非法操作",""
        end if
        
        Dim rs : set rs= Conn.Exec(strSql,"r1")
        
        itemIndex = 1
        jsonData = "{"        
        jsonData = jsonData&"""list"":["
        do while not rs.eof
            jsonData = jsonData&"{"
            jsonData = jsonData&"""id"":"&rs("ContentID")&","
            jsonData = jsonData&"""title"":"""&rs("Title")&""","
            jsonData = jsonData&"""content"":"""&rs("Content")&""","
            jsonData = jsonData&"""time"":"""&FormatDateTime(rs("AddTime"),2)&""""
            if itemIndex = rs.recordcount then                    
                jsonData = jsonData&"}"
            else
                jsonData = jsonData&"},"
                itemIndex= itemIndex + 1
            end if
            rs.movenext
        loop
        jsonData = jsonData&"]}"  
        setting.setResultMessage 0,"操作成功",jsonData
    End Sub
    
    Sub newslist
        ClassId = getForm("id","get")
        if isnul(ClassId) then
            ClassId = 113
        end if
        
        pageIndex = getForm("pi","get")
        if isnul(pageIndex) then
            pageIndex = 1
        end if
        
        pageSize = getForm("ps","get")
        if isnul(pageSize) then
            pageSize = 4
        end if
                     
        Dim rs : set rs = Conn.Exec("select Title,ContentID,AddTime,Content from (select top "&pageSize&" * from                                    (select top "&pageSize*pageIndex&" * from {prefix}Content WHERE (SortID = "&ClassId&") and ContentStatus = 1 order by ContentID desc) order by ContentID) order by ContentOrder DESC, ContentID DESC","r1")
        itemIndex = 1
        jsonData = "{"        
        jsonData = jsonData&"""list"":["
        do while not rs.eof
            jsonData = jsonData&"{"
            jsonData = jsonData&"""id"":"&rs("ContentID")&","
            jsonData = jsonData&"""title"":"""&rs("Title")&""","
            jsonData = jsonData&"""content"":"""&rs("Content")&""","
            jsonData = jsonData&"""time"":"""&FormatDateTime(rs("AddTime"),2)&""""
            if itemIndex = rs.recordcount then                    
                jsonData = jsonData&"}"
            else
                jsonData = jsonData&"},"
                itemIndex= itemIndex + 1
            end if
            rs.movenext
        loop
        jsonData = jsonData&"],"
        set rs = Conn.Exec("select count(1) as totalCount from {prefix}Content where ContentStatus = 1 and SortID = "&ClassId,"r1")
        if not rs.eof then
            totalCount = rs("totalCount")
        end if
        jsonData = jsonData&"""total"":"&totalCount&"}"
        setting.setResultMessage 0,"操作成功",jsonData
    End Sub
%>