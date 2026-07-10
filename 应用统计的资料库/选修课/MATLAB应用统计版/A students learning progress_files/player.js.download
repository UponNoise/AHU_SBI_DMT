function setposition(){
	var height = $("#mainid").height();
    $('.orientationleft').css('top',height);
    $('.orientationright').css('top',height);
    $('#openlock').css('top',height);
    //$('.gohead').css('top',$(window).height() - 100 - $('.main').offset().top + $(window).scrollTop());
}
//setposition();

$(window).scroll(function(){	
//setposition();
if(parseInt($(window).scrollTop())>=150){
	//$('.gohead').show();
	}else{
	$('.gohead').hide();	
}
});

$('.inputwordsone').disappearDefault({
vals:"我有话说",
defaultColor:"#999",
color:"#333",
callback:function(o){
o.next().show();
},

showDefault:true
});

$('.answerclick .showone').click(function(){

if($(this).parent().next().css('display')=='none'){
	$(this).parent().next().show();
	$(this).text('隐藏1条回复');
	}else{
	$(this).parent().next().hide();	
	$(this).text('显示1条回复');
	}
});

$(document).ready(function(){

if( !(typeof disableAutoResize == 'boolean' && disableAutoResize === true)){
	function setheight(){
	var h=$(window).height() - $('.lists').height(); 
	$('.thiscontent').height(h);
	}
	setheight();
	window.onresize=function(){
		setheight();		
	};
}


$('.switchbtn').click(function(){
	var r = $('.right'),//menu
		l = $('.left'),//center
		s = $('.switchbtn');//switcher
	
	if( typeof leftMenuLayout == 'boolean' && leftMenuLayout === true){
		
		if(r.css('left') == 0 +'px'){
			r.animate({'left' : -310 + 'px'},500,function(){	
				s.css({'background-image':'url(/images/courselist/playbg_left.png)','background-position':'0px -33px'})	
			});
			s.animate({'left' : '0px'},500);
			//l.animate({'margin-left' : 0 + 'px'},500);
		}else{	
			r.animate({'left':0 + 'px'},500,function(){	
				s.css({'background-image':'url(/images/courselist/playbg.png)','background-position':'0px -78px'})	
			});
			s.animate({'left' : '279px'},500);
			//l.animate({'margin-left' : 310 + 'px'},500);
		}
	}else{
		if (s.hasClass("switchbtn_cur")) {
			if ($(".posChapter_right").size() > 0) {
				$('#DownloadaDiv').animate({right:'328px'})
				$('#JS_back_to_top').animate({right:'328px'})
			}
		} else {
			if ($(".posChapter_right").size() > 0) {
				$('#DownloadaDiv').animate({right: '20px'})
				$('#JS_back_to_top').animate({right: '20px'})
			}
		}
		if(r.css('right') == 0 +'px'){
			r.animate({'right' : -310 + 'px'},500,function(){	
				s.css({'background-position':'0px -78px'});	
				//l.css({'margin-right':'0px'});
			});
			
			l.animate({'margin-right' : 0 + 'px'},500);
		}else{
			r.animate({'right':0 + 'px'},500,function(){	
				s.css({'background-position':'0px -45px'});
				//l.css({'margin-right':'310px'});
			});
			l.animate({'margin-right' : 310 + 'px'},500);
		}
	}
		

});

$('.zad731').click(function(){
	
	if($('.zad730').css('left') == 0 +'px'){
		$('.zad730').animate({'left' : -310 + 'px'},500,function(){	
			$('.zad731').css({'background-image':'url(/images/courselist/playbg_left.png)','background-position':'0px -33px'})	
		});
		$('.zad731').animate({'left' : '0px'},500);
		$('.zad729').animate({'margin-left' : 0 + 'px'},500);
	}else{	
		$('.zad730').animate({'left':0 + 'px'},500,function(){	
			$('.zad731').css({'background-image':'url(/images/courselist/playbg.png)','background-position':'0px -78px'})	
		});
		$('.zad731').animate({'left' : '279px'},500);
		$('.zad729').animate({'margin-left' : 310 + 'px'},500);
	}
});

});