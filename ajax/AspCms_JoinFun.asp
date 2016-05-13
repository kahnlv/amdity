<!--#include file="../inc/AspCms_SettingClass.asp"-->
<%
    Dim action : action  = getForm("act","get")
    
    Dim JoinID, SortID, UserID, CompanyName, CompanyUrl, CompanyAddress, OnlineContact, Phone, Email, Advantage,Shop,ShopUrl,Contacts
    
    if len(action) > 0 then
        select case action
            case "add" : addJoin
        end select
    else
        setting.setResultMessage -1,"�Ƿ�����",""
    end if
    
    '==============�������====================
    sub addJoin
        dim strSql
        
        SortID = getForm("t","get")
        
        if isnul(SortID) then
            setting.setResultMessage -1,"�����쳣�����Ժ�����",""         
        end if
        
        if not isnul(Session("uid")) then 
            UserID = Session("uid") 
        else 
            UserID = 0  
        end if
        
        CompanyName = setting.getPostForm("cn")
        if isnul(CompanyName) then setting.setResultMessage -1, "����д��˾����",""
        
        CompanyAddress = setting.getPostForm("ca")
        if isnul(CompanyAddress) then setting.setResultMessage -1,"����д��˾��ַ" ,""
        
        OnlineContact = setting.getPostForm("oc")
        'if isnul(OnlineContact) then setting.setResultMessage -1,"����д������ϵ��ʽ",""
        
        dim regEx : set regEx = new RegExp
        regEx.IgnoreCase = false
        
        Phone = setting.getPostForm("ph")
        regEx.Pattern = "((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|/\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"
        if isnul(Phone) then 
            setting.setResultMessage -1,"����д��ϵ�绰",""
        elseif not regEx.Test(Phone) then
            setting.setResultMessage -1,"����д��ȷ����ϵ�绰",""
        end if 
        
        CompanyUrl = setting.getPostForm("cu")
        regEx.Pattern = "^(http(s)?://)*([\w\d-]+\.)+\w{2,}(\/[\S]+)*$"
        if not isnul(CompanyUrl) and not regEx.Test(CompanyUrl) then setting.setResultMessage -1,"��������ȷ�Ĺ�˾��ַ",""
         
        Email = setting.getPostForm("em")
        regEx.Pattern = "^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$"
        if not isnul(Email) and not regEx.Test(Email)  then  setting.setResultMessage -1,"��������ȷ�ĵ�������",""
        
        Advantage = setting.getPostForm("ad")
        shop = setting.getPostForm("sh")
        shopurl = setting.getPostForm("su")
        Contacts = setting.getPostForm("con")
        
        strSql = "insert into {prefix}Join(SortID, UserID, CompanyName, CompanyUrl, CompanyAddress, OnlineContact, Phone, Email, Advantage,CreateTime,shop,shopurl,Contacts) values ("&SortID&", "&UserID&", '"&CompanyName&"', '"&CompanyUrl&"', '"&CompanyAddress&"', '"&OnlineContact&"', '"&Phone&"', '"&Email&"', '"&Advantage&"','"&now()&",'"&shop&"','"&shopurl&"','"&Contacts&"')"
        
        'die strSql
        conn.exec strSql,"exe"
        setting.setResultMessage 0,"����ɹ�","" 
    end sub
%>