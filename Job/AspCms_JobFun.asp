<!--#include file="../inc/AspCms_SettingClass.asp"-->
<%
    Dim action : action  = getPostForm("act")
    
    Dim UserID, ContentID, Jobs, Linkman, Gender, Age, Marriage, Education, RegResidence, EduResume, JobResume, Address, PostCode, Phone, Mobile, Email, QQ, AddTime, ApplyStatus, ReplyContent, ReplyTime
    
    if len(action) >  0 then        
        Select case action
            case "add": addApply
            case "reply": reply
        end Select
    else
        response.write setting.setResultMessage(-1,"非法操作")
        response.end
    end if
    
    Sub addApply
        dim strSql
        
        ContentID = getForm("id","get")
        if isnul(ContentID) then
            response.write setting.setResultMessage(-1,"招聘记录不存在")   
            response.end
        else
            Dim rs : set rs = Conn.Exec("select * from {prefix}Content where ContentID = "&ContentID,"r1")
            if not rs.eof then
                if rs("SortID") <> 12 or rs("ContentStatus") <> 1 then 
                    response.write setting.setResultMessage(-1,"招聘记录不存在")
                    response.end
                end if
            else
                response.write setting.setResultMessage(-1,"发生异常")
                response.end
            end if     
        end if
        
        if not isnul(Session("uid")) then 
            UserID = Session("uid") 
        else 
            UserID = 0  
        end if
        
        Jobs = getPostForm("jobs")
        if isnul(Jobs) then 
            response.write setting.setResultMessage(-1,"请填写应聘职位") 
            response.end 
        end if
        
        Linkman = getPostForm("man")
        if isnul(Linkman) then 
            response.write setting.setResultMessage(-1,"请填写联系人")
            response.end
        end if
        
        Gender = getPostForm("sex")
        if not isnum(Gender) then Gender = 0
        
        Age = getPostForm("age")
        if not isnum(Age) then Age = 0
        
        Marriage = getPostForm("marr")
        if not isnul(Marriage) then Marriage = "保密"
        
        Education = getPostForm("edu")
        RegResidence = getPostForm("reg")
        EduResume = getPostForm("edure")
        JobResume = getPostForm("jobre")
        Address = getPostForm("address")
        
        PostCode = getPostForm("code")
        if not isnum(PostCode) then PostCode = "361006"
        
        dim regEx : set regEx = new RegExp
        regEx.IgnoreCase = false
        
        Phone = getPostForm("phone")
        regEx.Pattern = "^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}"
        if not isnul(Phone) and not regEx.Test(Phone) then 
            response.write setting.setResultMessage(-1,"请输入正确的联系电话")
            response.end
        end if
        
        Mobile = getPostForm("mobile")
        regEx.Pattern = "^1\d{10}$"
        if not isnul(Mobile) and not regEx.Test(Mobile) then 
            response.write setting.setResultMessage(-1,"请输入正确的手机号码")
            response.end
        end if    
        
        Email = getPostForm("email")
        regEx.Pattern = "^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$"
        if not isnul(Email) and not regEx.Test(Email) then 
            response.write setting.setResultMessage(-1,"请输入正确的电子邮箱")
            response.end
        end if            
        
        QQ = getPostForm("qq")
        if not isnum(QQ) then QQ = "00000"
        
        AddTime = getPostForm("at")
        if not isdate(AddTime) then AddTime = now()
        
        ApplyStatus = getPostForm("as")
        if not isnum(ApplyStatus) then ApplyStatus = 1
        
        strSql = "insert into {prefix}Apply(UserID, ContentID, Jobs, Linkman, Gender, Age, Marriage, Education, RegResidence, EduResume, JobResume, Address, PostCode, Phone, Mobile, Email, QQ, AddTime, ApplyStatus) values ("&UserID&", "&ContentID&", '"&Jobs&"','"&Linkman&"', "&Gender&", "&Age&", '"&Marriage&"','"&Education&"','"&RegResidence&"','"&EduResume&"','"&JobResume&"','"&Address&"','"&PostCode&"','"&Phone&"','"&Mobile&"','"&Email&"','"&QQ&"', '"&AddTime&"', "&ApplyStatus&")"
            
        'die strSql
            
        conn.exec strSql,"exe"
        response.write setting.setResultMessage(0,"简历投递成功")
        response.end
    End Sub 
    
    Sub reply
        
    End Sub
    
    function getPostForm(name)
        getPostForm = getForm(name,"post")
    end function
%>