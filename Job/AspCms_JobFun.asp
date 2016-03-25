<!--#include file="../inc/AspCms_SettingClass.asp"-->
<%
    Dim action : action  = getForm("act","post")
    Dim UserID, ContentID, Jobs, Linkman, Gender, Age, Marriage, Education, RegResidence, EduResume, JobResume, Address, PostCode, Phone, Mobile, Email, QQ, AddTime, ApplyStatus, ReplyContent, ReplyTime
    
    if len(action) >  0 then        
        Select case action
            case "add": response.write addApply
            case "reply": reply
        end Select
    else
        response.write "非法操作"
    end if
    
    function addApply
        ContentID = getForm("id","get")
        if isnul(ContentID) then
            addApply = "非法操作-ContentID为空"            
        end if
                
        if isnul(Session("uid")) then UserID = Session("uid") else UserID = 0  end if
        
        if isnul(addApply) then
            dim strSql = "insert {prefix}Apply (UserID, ContentID, Jobs, Linkman, Gender, Age, Marriage, Education, RegResidence, EduResume, JobResume, Address, PostCode, Phone, Mobile, Email, QQ, AddTime, ApplyStatus, ReplyContent, ReplyTime) values ("&UserID&", "&ContentID&", '"&Jobs&"','"&Linkman&"', "&Gender&", "&Age&", '"&Marriage&"','"&Education&"','"&RegResidence&"','"&EduResume&"','"&JobResume&"','"&Address&"','"&PostCode&"','"&Phone&"','"&Mobile&"','"&Email&"','"&QQ&"', "&AddTime&", "&ApplyStatus&",'"&ReplyContent&"', "&ReplyTime&")"
            
            'die strSql
            
            conn.exec strSql,"exe"
            
        end if
    End function 
    
    Sub reply
        
    End Sub
%>