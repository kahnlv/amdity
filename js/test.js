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
    })
});