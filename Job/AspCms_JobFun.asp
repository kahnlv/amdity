<!--#include file="../inc/AspCms_SettingClass.asp"-->
<%
    dim contentId : contentId = getForm("id","get")
    dim jobInfo, ID, Title
    
    function getJobInfo()
        if not isnul(contentId) then
            ID = filterPara(contentId)
            Dim where : where = "ContentStatus = 1 and ContentID = "&ID
            Dim rs : Set rs = conn.Exec("select * from {prefix}Content where "&where,"r1")
            if not rs.eof then
                
            else
                alertMsgAndGo "该招聘信息不存在","-1"
            end if
        end if
    end function
%>
<%getJobInfo%>