function setLayout(){
	j=0;
	for(var i=1000;i>=$('.lock').length;i--){
		$('.lock').eq(j++).css({'z-index':i});
	}
}
setLayout();

$(".timeline").delegate(".lock","click",function(){
	$('.winpop').hide();
	$(this).find('.winpop').show();
});

//alert($('.timeline .lock').length);
//$('.timeline .lock').click(function() {
//	$('.winpop').hide();
//	$(this).find('.winpop').show();
//
//});

$(".timeline").delegate(".btn02","click",function(){
	$(this).parents(".winpop").hide();
	return false;
});



$('.inputwordsone').disappearDefault({

	vals : "",

	defaultColor : "#999",

	color : "#333",

	callback : function(o) {

		o.next().show();

	},

	showDefault : true

});

$('.inputwordstwo').disappearDefault({

	vals : "默认属性",

	defaultColor : "#999",

	color : "#333",

	callback : function(o) {
		o.hide();
		o.next().show();

	},

showDefault:true
	
});

$('.bgimage').hover(function(){
$(this).children('.mask').show();	
	
},function(){
$(this).children('.mask').hide();	
	

});




$('.smallunits .icon em.childnodes').live('click',function(){
	
	if($(this).parent().parent().next().css('display') == 'none'){
		$(this).removeClass('add').addClass('substract');
		$(this).parent().parent().next().show();	
	}else{
		$(this).removeClass('substract').addClass('add');
		$(this).parent().parent().next().hide();	
		
	}	

});

var showorhide=function(htmlid){
	var doc = document.getElementById(htmlid);
	if(doc.style.display!="none"){
		doc.style.display="none";
	}else{
		doc.style.display="block";
	}
	
	$("input[name='stu']").each(function(){//如果有选择，刚设置为未选
	       $(this).attr("checked",false);
	    });
};
var sendmessage=function(touserid,tousername){
	var doc = document.getElementById("messageare");
	var content = doc.value;
	if(content==null||content=='')
	{
		alert("评论内容不能为空！");
		return;
	}
	jQuery.ajax({ 
		type: "post",
		url : _HOST_CP2_ + "/schoolCourseInfo/sendmessage", 
		dataType:'html',//返回的值
		data: {
			touserid:touserid
			,tousername:tousername
			,content:content
			,date:new Date()
			,clazzid:$('#clazzid').val()
		
		},
	    success: function(data){//如果调用成功 
	    	var jsonData = eval("("+data+")");
	    	if(jsonData.datas[0].result=='success'){
	    		if(jsonData.datas[0].msg==undefined||jsonData.datas[0].msg==''||jsonData.datas[0].msg=='null'){
	    			alert('发送成功！');
	    			hidmesdiageo();
	    		}else{
	    			alert('发送失败！');
	    			hidmesdiageo();
	    		}
	    	}else if(jsonData.datas[0].result=='fail'){
	    		   alert('发送失败！');
	    		   hidmesdiageo();
	    	}
		} 
	}); 
	
	
};
var showMessageDia=function(tousername,touserid){
	
	var html ="<h3><span onclick=\"showorhide('messagedialogepar');showorhide('messagedialoge');\">×</span>发信息</h3><div class=\"sends\">发给：<input DISABLED='true'  value=\" "+tousername+"\" type=\"text\"></div>" +
			"<div class=\"neirong\"><span>内容：</span><textarea id=\"messageare\" cols=\"20\" rows=\"2\"></textarea></div>" +
			"<div class=\"thisbtn\"><input value=\"发 送\" type=\"button\" onclick=\"sendmessage('"+touserid+"','"+tousername+"')\"></div>";
	var docp = document.getElementById("messagedialogepar");
	var doc = document.getElementById("messagedialoge");
	doc.innerHTML=html;
	doc.style.display="block";
	docp.style.display="block";
			
};
//批量发信息第二步
var pshowMessageDia=function(){
	
	var flag=false;//判断是否有选中，如果没有选中，刚提示用户选择
	$("input[name='stu']:checkbox").each(function(){
	    if($(this).attr('checked')){
	        flag=true;
	    }
	});
	if(!flag){
	    alert("请选择学生！");
	    return;
	}

	
	
	$("#disCheckAll").hide();//隐藏取消全选按钮,隐藏全选按钮
	$("#checkAll").hide();
	
	var tousername="";
	var touserid="";
	var sarray=$('#classmetul li input');
	for(var i=0;i<sarray.length;i++){
		if(sarray[i].checked){
			if(i==sarray.length-1){
				tousername+=(sarray[i].value).split('*')[1];
				touserid+=(sarray[i].value).split('*')[0];
			}else{
				tousername+=(sarray[i].value).split('*')[1]+";";
				touserid+=(sarray[i].value).split('*')[0]+";";
			}
		}
	}
	
	var html ="<h3><span onclick=\"showorhide('messagedialogepar');showorhide('messagedialoge');\">×</span>发信息</h3><div class=\"sends\">发给：<input DISABLED='true'  value=\" "+tousername+"\" type=\"text\"></div>" +
			"<div class=\"neirong\"><span>内容：</span><textarea id=\"messageare\" cols=\"20\" rows=\"2\"></textarea></div>" +
			"<div class=\"thisbtn\"><input value=\"发 送\" type=\"button\" onclick=\"sendmessage('"+touserid+"','"+tousername+"')\"></div>";
	var docp = document.getElementById("messagedialogepar");
	var doc = document.getElementById("messagedialoge");
	var qfxx = document.getElementById("qf");
	var fznx = document.getElementById("fznx");
	qfxx.style.display="none";
	fznx.style.display="inline-block";
	$('#classmetul li input').addClass('inputNone'); 
	
	doc.innerHTML=html;
	doc.style.display="block";
	docp.style.display="block";
			
};
//批量发信息第一步
var pshowBox=function(){
	var qfxx = document.getElementById("qf");
	var fznx = document.getElementById("fznx");
	$('#classmetul li input').removeClass('inputNone');
	qfxx.style.display="inline-block";
	fznx.style.display="none";
	
	$("#disCheckAll").hide();//出现全选按钮,隐藏取消全选按钮
	$("#checkAll").show();
};


//全选   
$("#checkAll").click(function() {
	$("input[name='stu']").each(function(){
	   $(this).attr("checked",true);
	});
	$("#checkAll").hide();
	$("#disCheckAll").show();
}) ;
//取消全选   
$("#disCheckAll").click(function() {  
	$("input[name='stu']").each(function(){
       $(this).attr("checked",false);
    });  
	$("#disCheckAll").hide();
	$("#checkAll").show();
});

var hidmesdiageo=function(){
	var docp = document.getElementById("messagedialogepar");
	var doc = document.getElementById("messagedialoge");
	doc.style.display="none";
	docp.style.display="none";
};

function positionSet(){	
	$('.winpop').css('top',parseInt($(window).height())/2 - 160 + $(window).scrollTop());	
}


$(window).scroll(positionSet);


if( !(typeof disableNavSlider == 'boolean' && disableNavSlider === true)){
//$('.navshow').css('margin-right',-$('.navshow').width());
$('.navhide').click(function(){
	$(this).hide(0,function(){	
		$('.navshow').animate({'margin-right':0 + 'px'},200);	
	});	
});

$('.navshow span').click(function(){
	$(this).parent().animate({'margin-right':-$('.navshow').width()},200,function(){
	$('.navhide').show();	
	});
});
}


$('.alreadychoice').click(function(){
	$(this).next().show();
	$(this).find('em').addClass('xiangxi');		
});

$('.listcontent h3,.listcontent h4').click(function(){
	$('.alreadychoice span').html($(this).find('span').text());
	
	$('.choicelist').hide();
	$('.alreadychoice em').removeClass();	
});

$('.units h2').live('click',function(){
	$('.units h2').removeClass('addbgcolor');	
	$('.leveltwo').removeClass('addfocus');
	$(this).addClass('addbgcolor');	
});