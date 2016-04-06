$("#join").on('click', function() {
    var param = {};
    param['cn'] = escape($('#cn').val());
    param['ca'] = escape($('#ca').val());
    param['oc'] = escape($('#oc').val());
    param['ph'] = escape($('#ph').val());
    param['cu'] = escape($('#cu').val());
    param['em'] = escape($('#em').val());
    param['ad'] = escape($('#ad').val());

    $.ajax({
        url: '/join/aspcms_joinfun.asp?act=add&id=110',
        type: 'post',
        dataType: 'json',
        data: param,
        success: function(result) {
            alert(result.msg);
            if (result.resultCode > 0) {

            }
        }
    });
});

$('#job').on('click', function() {
    var id = 0, //需要获取当前招聘职位文章的id 
          param = {};
    
    param["jobs"] = $('#jobs').val();
    param["man"] = $('#man').val();
    param["sex"] = $('#sex').val();
    param["age"] = $('#age').val();
    param["marr"] = $('#marr').val();
    param["edu"] = $('#edu').val();
    param["reg"] = $('#reg').val();
    param["edure"] = $('#edure').val();
    param["jobre"] = $('#jobre').val();
    param["address"] = $('#address').val();
    param["code"] = $('#code').val();
    param["phone"] = $('#phone').val();
    param["mobile"] = $('#mobile').val();
    param["email"] = $('#email').val();
    param["qq"] = $('#qq').val();
          
    $.ajax({
        url: '/job/aspcms_jobfun.asp?act=add&id=' + id,
        type: 'post',
        dataType: 'json',
        data: param,
        success: function(result) {
            alert(result.msg);
            if (result.resultCode > 0) {

            }
        }
    });
});