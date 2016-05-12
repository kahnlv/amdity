<!--#include file="../inc/AspCms_SettingClass.asp"-->
<%
    Dim action : action  = getForm("act","get")
    
    Dim JoinID, SortID, UserID, CompanyName, CompanyUrl, CompanyAddress, OnlineContact, Phone, Email, Advantage
    
    if len(action) > 0 then
        select case action
            case "add" : addJoin
        end select
    else
        setting.setResultMessage -1,"非法操作",""
    end if
    
    '==============申请加盟====================
    sub addJoin
        dim strSql
        
        SortID = getForm("id","get")
        
        if isnul(SortID) then
            setting.setResultMessage -1,"加盟信息不存在",""
        else
            Dim rs : set rs = Conn.Exec("select * from {prefix}Sort where SortID = "&SortID,"r1")
            if not rs.eof then
                if rs("SortStatus") <> 1 then setting.setResultMessage -1,"加盟信息不存在" ,""
            else
                setting.setResultMessage -1,"发生异常",""
            end if     
        end if
        
        if not isnul(Session("uid")) then 
            UserID = Session("uid") 
        else 
            UserID = 0  
        end if
        
        CompanyName = setting.getPostForm("cn")
        if isnul(CompanyName) then setting.setResultMessage -1, "请填写公司名称",""
        
        CompanyAddress = setting.getPostForm("ca")
        if isnul(CompanyAddress) then setting.setResultMessage -1,"请填写公司地址" ,""
        
        OnlineContact = setting.getPostForm("oc")
        if isnul(OnlineContact) then setting.setResultMessage -1,"请填写在线联系方式",""
        
        dim regEx : set regEx = new RegExp
        regEx.IgnoreCase = false
        
        Phone = setting.getPostForm("ph")
        regEx.Pattern = "((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|/\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"
        if isnul(Phone) then 
            setting.setResultMessage -1,"请填写联系电话",""
        elseif not regEx.Test(Phone) then
            setting.setResultMessage -1,"请填写正确的联系电话",""
        end if 
        
        CompanyUrl = setting.getPostForm("cu")
        regEx.Pattern = "^(http(s)?://)*([\w\d-]+\.)+\w{2,}(\/[\S]+)*$"
        if not isnul(CompanyUrl) and not regEx.Test(CompanyUrl) then setting.setResultMessage -1,"请输入正确的公司网址",""
         
        Email = setting.getPostForm("em")
        regEx.Pattern = "^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$"
        if not isnul(Email) and not regEx.Test(Email)  then  setting.setResultMessage -1,"请输入正确的电子邮箱",""
        
        Advantage = setting.getPostForm("ad")
        
        strSql = "insert into {prefix}Join(SortID, UserID, CompanyName, CompanyUrl, CompanyAddress, OnlineContact, Phone, Email, Advantage,CreateTime) values ("&SortID&", "&UserID&", '"&CompanyName&"', '"&CompanyUrl&"', '"&CompanyAddress&"', '"&OnlineContact&"', '"&Phone&"', '"&Email&"', '"&Advantage&"','"&now()&"')"
        
        'die strSql
        conn.exec strSql,"exe"
        setting.setResultMessage 0,"申请成功","" 
    end sub
%>