<!--#include file="../inc/AspCms_SettingClass.asp"-->
<%
    Dim action : action  = getForm("act","get")
    
    Dim JoinID, SortID, UserID, CompanyName, CompanyUrl, CompanyAddress, OnlineContact, Phone, Email, Advantage
    
    if len(action) > 0 then
        select case action
            case "add" : addJoin
        end select
    else
        alertMsgAndGo "非法操作","-1"
    end if
    
    '==============申请加盟====================
    sub addJoin
        dim strSql
        
        SortID = getForm("id","get")
        
        if isnul(SortID) then
            response.write setting.setResultMessage(-1,"加盟信息不存在")
            response.end
        else
            Dim rs : set rs = Conn.Exec("select * from {prefix}Sort where SortID = "&SortID,"r1")
            if not rs.eof then
                if rs("SortStatus") <> 1 then 
                    response.write setting.setResultMessage(-1,"加盟信息不存在")
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
        
        CompanyName = getPostForm("cn")
        if isnul(CompanyName) then
            alertMsgAndGo "请填写公司名称", "-1"
        end if
        
        CompanyAddress = getPostForm("ca")
        if isnul(CompanyAddress) then
            response.write setting.setResultMessage(-1,"请填写公司地址")
            response.end
        end if
        
        OnlineContact = getPostForm("oc")
        if isnul(OnlineContact) then
            response.write setting.setResultMessage(-1,"请填写在线联系方式")
            response.end
        end if
        
        Phone = getPostForm("ph")
        if isnul(Phone) then
            response.write setting.setResultMessage(-1,"请填写联系电话")
            response.end
        end if
        
        dim regEx : set regEx = new RegExp
        regEx.IgnoreCase = false
        
        CompanyUrl = getPostForm("cu")
        regEx.Pattern = "^(http(s)?://)*([\w\d-]+\.)+\w{2,}(\/[\S]+)*$"
        if not isnul(CompanyUrl) and not regEx.Test(CompanyUrl) then
            response.write setting.setResultMessage(-1,"请输入正确的公司网址")
            response.end
        end if
         
        Email = getPostForm("em")
        regEx.Pattern = "^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$"
        if not isnul(Email) and not regEx.Test(Email)  then
            response.write setting.setResultMessage(-1,"请输入正确的电子邮箱")
            response.end
        end if
        
        Advantage = getPostForm("ad")
        
        strSql = "insert into {prefix}Join(SortID, UserID, CompanyName, CompanyUrl, CompanyAddress, OnlineContact, Phone, Email, Advantage) values ("&SortID&", "&UserID&", '"&CompanyName&"', '"&CompanyUrl&"', '"&CompanyAddress&"', '"&OnlineContact&"', '"&Phone&"', '"&Email&"', '"&Advantage&"')"
        
        'die strSql
        conn.exec strSql,"exe"
        response.write setting.setResultMessage(0,"申请成功")
        response.end
    end sub
    
    
    
    function getPostForm(name)
        getPostForm = filterPara(getForm(name,"post"))
    end function
%>