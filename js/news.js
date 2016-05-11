(function($) {
    var news = function() {
        var app = {
            url: '/news/news.asp',
            init: function() {
                var params = {};
                params['act'] = 'class';
                params['id'] = 1;
                app.ajaxCall(params, app.getNewsClass);
                $(document).on('click.news', '.newsnav_Item', function() {
                    var id = $(this).attr('data-id'),
                        name = $(this).text();
                    $(this).addClass('on').siblings().removeClass('on');
                    $('.current_dynamic h3').text(name);
                    $('.past_dynamic h3').text('往期' + name);
                    app.ajaxCall({
                        'act': 'list',
                        'id': id
                    }, function(result) {
                        app.getNewsList(result, 0);
                    });
                    app.ajaxCall({
                        'act': 'list',
                        'id': id,
                        'pi': 2
                    }, function(result) {
                        app.getNewsList(result, 1, 1);
                    });
                });
                $(document).on('click.news', '.pagination a', function() {
                    var pageindex = parseInt($(this).attr('data-page')),
                        id = $('.newsnav_Item.on').attr('data-id');
                    app.ajaxCall({
                        'act': 'list',
                        'id': id,
                        'pi': pageindex + 1
                    }, function(result) {
                        app.getNewsList(result, 1, pageindex);
                    });
                });
            },
            getNewsClass: function(result) {
                var html = '',
                    len = result.length,
                    item,
                    params = {};
                params['act'] = 'list';
                for (var i = 0; i < len; i++) {
                    item = result[i];
                    html += '<li data-id="' + item.id + '" class="newsnav_Item' + (i == 0 ? ' on' : '') + '"><i class="icon"></i>' + item.name + '</li>';
                    if (i == 0) {
                        $('.current_dynamic h3').text(item.name);
                        $('.past_dynamic h3').text('往期' + item.name);
                        params['id'] = item.id;
                        app.ajaxCall({
                            'act': 'list',
                            'id': item.id
                        }, function(result) {
                            app.getNewsList(result, 0);
                        });
                        app.ajaxCall({
                            'act': 'list',
                            'id': item.id,
                            'pi': 2
                        }, function(result) {
                            app.getNewsList(result, 1, 1);
                        });
                    }
                }
                $('.newsNav').html(html);
            },
            getNewsList: function(result, index, pageindex) {
                var $ul = (index == 0 ? $('.current_dynamic ul') : $('.past_dynamic ul')),
                    len = result.list.length,
                    item, html = '',
                    pageCount = 1,
                    list = result.list,
                    total = result.total;
                if (total > 0) {
                    for (var i = 0; i < len; i++) {
                        item = list[i];
                        html += '<li class="newsBlock">\
                                    <a href="' + item.id + '" class="db marB10 color_66 fs_16">' + item.title + '</a>\
                                    <p class="color_66 fs_16">' + item.time + '</p>\
                                    <a href="' + item.id + '" class="db color_00 fs_14 readFull"><i class="icon"></i>浏览全文</a>\
                                </li>';
                    }
                    if (index == 1) {
                        $('.past_dynamic').show();
                        $('.pagination').show();
                        pageCount = parseInt((total - 5) / 4 + 1);
                        app.pager(pageCount, pageindex);
                    } else {
                        $('.nomessage').remove();
                    }
                } else {
                    if (index == 0 && $('.nomessage').length == 0) {
                        $ul.after('<div class="nomessage">您当前浏览的模块暂无数据！</div>');
                    } else {
                        $('.past_dynamic').hide();
                        $('.pagination').hide();
                    }
                }
                $ul.html(html);
            },
            pager: function(pageCount, pageindex) {
                var html = '';
                if (pageindex == 1) {
                    html = '<span>＜</span>';
                } else {
                    html = '<a href="javascript:;" data-page="' + (pageindex - 1) + '" class="prev">＜</a>';
                }
                for (var i = 1; i <= pageCount; i++) {
                    if (i == pageindex) {
                        html += '<span>' + i + '</span>';
                    } else {
                        html += '<a data-page="' + i + '" href="javascript:;">' + i + '</a>';
                    }
                }
                if (pageindex == pageCount) {
                    html += '<span>＞</span>';
                } else {
                    html += '<a href="javascript:;" data-page="' + (pageindex + 1) + '" class="next">＞</a>';
                }
                $('.pagination').html(html);
            },
            ajaxCall: function(params, callback) {
                $.ajax({
                    url: app.url,
                    data: params,
                    dataType: 'json',
                    type: 'get',
                    aysn: false,
                    success: function(result) {
                        if (result.resultCode > -1) {
                            (callback && typeof(callback) === "function") && callback(result.datas);
                        } else {
                            alert(result.msg);
                        }
                    }
                })
            }
        };
        return app;
    }();
    window.news = news;
})(jQuery)

$(document).ready(function() {
    news.init();
});