<!--#include file="../inc/AspCms_SettingClass.asp"-->
<%
    Dim action:action = getForm("act","get")
    Dim ClassId,jsonData,itemIndex,pageIndex,pageSize,totalCount
    
    if len(action) > 0 then
        select case action
            case "class": getclass
            case "list": newslist
        end select
    else
        setting.setResultMessage -1,"非法操作",""
    end if
    
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
                     
        Dim rs : set rs = Conn.Exec("select Title,ContentID,AddTime from (select top "&pageSize&" * from                                    (select top "&pageSize*pageIndex&" * from {prefix}Content WHERE (SortID = "&ClassId&") order by ContentID desc) order by ContentID) order by ContentOrder DESC, ContentID DESC","r1")
        itemIndex = 1
        jsonData = "{"        
        jsonData = jsonData&"""list"":["
        do while not rs.eof
            jsonData = jsonData&"{"
            jsonData = jsonData&"""id"":"&rs("ContentID")&","
            jsonData = jsonData&"""title"":"""&rs("Title")&""","
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
        set rs = Conn.Exec("select count(1) as totalCount from {prefix}Content where SortID = "&ClassId,"r1")
        if not rs.eof then
            totalCount = rs("totalCount")
        end if
        jsonData = jsonData&"""total"":"&totalCount&"}"
        setting.setResultMessage 0,"操作成功",jsonData
    End Sub
%>