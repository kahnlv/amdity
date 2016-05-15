(function($, undefined) {
    var operation = function() {
        var app = {
            url: '/ajax/news.asp',
            init: function(type) {
                var linkResult;
                app.ajaxCall({
                    'act': 'links'
                }, 'get', function(result) {
                    app.Links(result);
                    if (type == 1) {
                        linkResult = result;
                    }
                });
                switch (type) {
                    case 0:
                        app.ajaxCall({
                            'act': 'list',
                            'id': 12
                        }, 'get', app.getApplyList);
                        break;
                    case 1:
                        if (linkResult) {
                            app.getLinks(linkResult);
                        }
                        break;
                    default:
                        app.ajaxCall({
                            'act': 'class',
                            'id': 1
                        }, 'get', app.getNewsClass);
                        $(document).on('click.news', '.newsnav_Item', function() {
                            var id = $(this).attr('data-id'),
                                index = $(this).index(),
                                name = $(this).text();
                            $('.newsnav_Item').length == ($(this).index() + 1) && (window.location = 'index.html');
                            $(this).addClass('on').siblings().removeClass('on');
                            $('.current_dynamic h3').text(name);
                            $('.past_dynamic h3').text('往期' + name);
                            app.ajaxCall({
                                'act': 'list',
                                'id': id
                            }, 'get', function(result) {
                                app.getNewsList(result, 0);
                            }, true);
                            app.ajaxCall({
                                'act': 'list',
                                'id': id,
                                'pi': 2
                            }, 'get', function(result) {
                                app.getNewsList(result, 1, 1);
                            }, true);
                        });
                        $(document).on('click.news', '.pagination a', function() {
                            var pageindex = parseInt($(this).attr('data-page')),
                                id = $('.newsnav_Item.on').attr('data-id');
                            app.ajaxCall({
                                'act': 'list',
                                'id': id,
                                'pi': pageindex + 1
                            }, 'get', function(result) {
                                app.getNewsList(result, 1, pageindex);
                            }, true);
                        });
                        break;
                }
            },
            getLinks: function(result) {

            },
            getApplyList: function(result) {
                var html = '',
                    list = result.list,
                    len = list.length,
                    item;
                for (var i = 0; i < len; i++) {
                    item = list[i];
                    html += '<li>\
                                <p class="job_name">' + item.title + '</p>\
                                <div class="job_detail clearfix">' + item.content + '</div>\
                                <a href="在线应聘.html?id=' + item.id + '" class="online_btn">在线应聘</a>\
                            </li>';
                }
                $('.jobList').html(html);
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
                        }, 'get', function(result) {
                            app.getNewsList(result, 0);
                        });
                        app.ajaxCall({
                            'act': 'list',
                            'id': item.id,
                            'pi': 2
                        }, 'get', function(result) {
                            app.getNewsList(result, 1, 1);
                        });
                    }
                }
                $('.newsNav li').before(html);
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
                html = (pageindex == 1 ? ('<span>＜</span>') : ('<a href="javascript:;" data-page="' + (pageindex - 1) + '" class="prev">＜</a>'));
                for (var i = 1; i <= pageCount; i++) {
                    html += (i == pageindex ? ('<span>' + i + '</span>') : ('<a data-page="' + i + '" href="javascript:;">' + i + '</a>'));
                }
                html += (pageindex == pageCount ? '<span>＞</span>' : ('<a href="javascript:;" data-page="' + (pageindex + 1) + '" class="next">＞</a>'));
                $('.pagination').html(html);
            },
            ajaxCall: function(params, method, callback, aysn) {
                $.ajax({
                    url: app.url,
                    data: params,
                    dataType: 'json',
                    type: method,
                    aysn: (aysn ? aysn : false),
                    success: function(result) {
                        if (result.resultCode > -1) {
                            if (method == 'post') {
                                alert(result.msg);
                            }
                            (callback && typeof(callback) === "function") && callback(result.datas);
                        } else {
                            alert(result.msg);
                        }
                    },
                    error: function(params) {
                        console.log(params);
                    }
                })
            }
        };
        return app;
    }();
    window.operation = operation;
})(jQuery);