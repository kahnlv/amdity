$(document).ready(function(){
	$("#share_btn").click(function(){
	 $(".share-con").slideToggle(100)
	});
	$(".nav-more").click(function(){
	 $(this).hide();	
	 $(".hide").show()
	});
  	$("#Collapse").click(function(){
     $(".nav-more").show()
	 $(".hide").hide()
	});
	var state = true; 
    $("#hide-menu").click(function(){
	if( state )
	{
	$(".hide-menu").animate({left:0})
	}
	else{
	$(".hide-menu").animate({left:-95+"%"})
	}
	state = !state;  
  });
   $(".wrap").children().not(".artice-top").click(function(){
	$(".hide-menu").animate({left:-95+"%"})
	state = !state;  
  });
  
  $(".ny-news-list li,#picture li,.case_list li").hide();	
    size_li = $(".ny-news-list li,#picture li,.case_list li").size();
    x=4;
    $('.ny-news-list li:lt('+x+'),#picture li:lt('+x+'),.case_list li:lt('+x+')').show();
    $('#more').click(function () {
        x= (x+4 <= size_li) ? x+4 : size_li;
        $('.ny-news-list li:lt('+x+'),#picture li:lt('+x+'),.case_list li:lt('+x+')').fadeIn();
        if(x == size_li){
            $('#more').hide();
			$('#less_more').show();
        }
    });
	
  });