<!--#include file="../inc/AspCms_SettingClass.asp"-->
<%
    Dim action : action  = getForm("act")
    
    Dim UserID, ContentID, Jobs, Linkman, Gender, Age, Marriage, Education, RegResidence, EduResume, JobResume, Address, PostCode, Phone, Mobile, Email, QQ, AddTime, ApplyStatus, ReplyContent, ReplyTime
    
    if len(action) >  0 then        
        Select case action
            case "add": addApply
            case "reply": reply
        end Select
    else
        setting.setResultMessage -1,"非法操作",""
    end if
    
    Sub addApply
        dim strSql
        
        ContentID = getForm("id","get")
        if isnul(ContentID) then
            setting.setResultMessage -1,"招聘记录不存在"  ,"" 
        else
            Dim rs : set rs = Conn.Exec("select * from {prefix}Content where ContentID = "&ContentID,"r1")
            if not rs.eof then
                if rs("SortID") <> 12 or rs("ContentStatus") <> 1 setting.setResultMessage -1,"招聘记录不存在",""
            else
                setting.setResultMessage -1,"发生异常",""
            end if     
        end if
        
        if not isnul(Session("uid")) then 
            UserID = Session("uid") 
        else 
            UserID = 0  
        end if
        
        Jobs = setting.getPostForm("jobs")
        if isnul(Jobs) then setting.setResultMessage -1,"请填写应聘职位" ,""
        
        Linkman = setting.getPostForm("man")
        if isnul(Linkman) then setting.setResultMessage -1,"请填写联系人"
        
        Gender = setting.getPostForm("sex")
        if not isnum(Gender) then Gender = 0
        
        Age = setting.getPostForm("age")
        if not isnum(Age) then Age = 0
        
        Marriage = setting.getPostForm("marr")
        if not isnul(Marriage) then Marriage = "保密"
        
        Education = setting.getPostForm("edu")
        RegResidence = setting.getPostForm("reg")
        EduResume = setting.getPostForm("edure")
        JobResume = setting.getPostForm("jobre")
        Address = setting.getPostForm("address")        
        PostCode = setting.getPostForm("code")
        
        dim regEx : set regEx = new RegExp
        regEx.IgnoreCase = false
        
        Phone = setting.getPostForm("phone")
        regEx.Pattern = "^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}"
        if not isnul(Phone) and not regEx.Test(Phone) then  setting.setResultMessage -1,"请输入正确的联系电话"
        
        Mobile = setting.getPostForm("mobile")
        regEx.Pattern = "^1\d{10}$"
        if not isnul(Mobile) and not regEx.Test(Mobile) then setting.setResultMessage -1,"请输入正确的手机号码"
        
        Email = setting.getPostForm("email")
        regEx.Pattern = "^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$"
        if not isnul(Email) and not regEx.Test(Email) then setting.setResultMessage -1,"请输入正确的电子邮箱"
        
        QQ = setting.getPostForm("qq")
        if not isnum(QQ) then QQ = "00000"
        
        AddTime = setting.getPostForm("at")
        if not isdate(AddTime) then AddTime = now()
        
        ApplyStatus = setting.getPostForm("as")
        if not isnum(ApplyStatus) then ApplyStatus = 1
        
        strSql = "insert into {prefix}Apply(UserID, ContentID, Jobs, Linkman, Gender, Age, Marriage, Education, RegResidence, EduResume, JobResume, Address, PostCode, Phone, Mobile, Email, QQ, AddTime, ApplyStatus) values ("&UserID&", "&ContentID&", '"&Jobs&"','"&Linkman&"', "&Gender&", "&Age&", '"&Marriage&"','"&Education&"','"&RegResidence&"','"&EduResume&"','"&JobResume&"','"&Address&"','"&PostCode&"','"&Phone&"','"&Mobile&"','"&Email&"','"&QQ&"', '"&AddTime&"', "&ApplyStatus&")"
            
        'die strSql
            
        conn.exec strSql,"exe"
        setting.setResultMessage 0,"简历投递成功"
    End Sub 
    
    Sub reply
        
    End Sub
%>