var hasChanged = false;
String.prototype.StartWith=function(s){
	  if(s==null||s==""||this.length==0||s.length>this.length)
	   return false;
	  if(this.substr(0,s.length)==s)
	     return true;
	  else
	     return false;
	  return true;
}
$(function(){
	//图片翻页
	var coverList = $(".coverList"),
		prev = coverList.find(".prevBtn"),
		next = coverList.find(".nextBtn"),
		conv = coverList.find(".convey"),
		list = conv.children("ul"),
		w = parseInt(list.width()),
		n = list.length,
		i = 0;
	conv.css("width",w * n + "px");
	function move(i){
		conv.stop(true,false).animate({"left":-w * i + "px"},500);
	}
	prev.click(function(){
		if(i > 0){
			i--
		}
		else{
			i = n - 1;
		}
		move(i);
	});
	next.click(function(){
		if(i < n - 1){
			i++
		}
		else{
			i = 0;
		}
		move(i);
	})
	//更换封皮
	$(".systemProvidesImg").click(function(){
		$("#coverLandImg").attr('src', $(this).find("img").attr('src')).attr('data', $(this).attr('hUrl'));
		$("#coverPortImg").attr('src', $(this).attr('vtUrl')).attr('data', $(this).attr('vUrl'));
		hasChanged = true;
	});
	$("#saveCourseImg").click(function(){
		hasChanged = false;
		var iUrl = $("#iUrl").val();
		if(iUrl==""){
			iUrl = "http://i.fanya.chaoxing.com";
		}else if(!iUrl.StartWith("http://")){
			iUrl = "http://"+iUrl;
		}
		var data = $("#coverLandImg").attr("data");
		var reset = $("#coverLandImg").attr("reset");
		var newCourse = $("#newCourse").val();
		if(data == reset && newCourse!="falseC"&& newCourse!="falseM"){
			window.location.href=iUrl;
		}else{
			$(this).text("正保存").attr("disable",true);
			$.post(_HOST_CP2_ + "/edit/courseLogo", 
				{ courseId: $("#courseId").val(), coverLandUrl: data,coverPortUrl: $("#coverPortImg").attr("data"),"newCourse":newCourse },
				function(json){
					try{json =  eval('(' +json+ ')');}catch (e){}
					if (json.succ){
						if(newCourse=="true"){
							//window.location.href=iUrl;
							//不跳转到设置单元页面，改为直接进入老师页面  2014.04.29
							window.location.href= _HOST_CP2_ + "/courseunit/setUnitWork?courseId="+$("#courseId").val();
							//window.location.href= _HOST_CP2_ + "/course/toteachercourse?courseId="+$("#courseId").val()+"&newCourse="+newCourse;
						}else{
							window.location.href= _HOST_CP2_ + "/coursecontroller/setcopyto?courseId="+$("#courseId").val()+"&newCourse="+newCourse;
						}
						
					}else{
						alert("封面保存失败,为保证数据一致性，事务准备回滚，自动转到学习空间页面！请您原谅哦...");
						if(newCourse!="true"){
							//删除取消掉的课程
							$.ajax({
								type:"get",
									url:_HOST_CP2_ + "/visit/deletecourse",
									data:{"id":courseId},
									success:function(data){
										window.location.href=iUrl;
									}
							});
						}
						
					}
			});
		}
	});
});
var uploadCover_file_queued_handler = function(file) {
	try {
		$(".courseProgress").each(function(item){
			$(item).remove();
		});
		$("#"+this.customSettings.progressTarget).html("");
		$("<div></div>").css("width","120px;").html(
			'<div class="blue courseProgress" style="padding:5px;margin-top:10px;width:110px;">'+
				'<div id="courseStatus">等待上传...</div>'+
				'<div id="courseProBar" style="width:0%; height:4px;background-color: green;"></div>'+
			'</div>').appendTo($("#"+this.customSettings.progressTarget));
	} catch (ex) {
		this.debug(ex);
	}
}

var uploadCover_file_dialog_complete_handler = function(numFilesSelected, numFilesQueued) {
	try {
		var imgcount=$("#images").find("img").size();
		if(numFilesSelected>9-imgcount){
			alert("最多能上传9张图片");
			for(var i=1;i<=numFilesSelected;i++){
				this.cancelUpload(undefined,false);
			}
			return ;
		}
		this.startUpload();
	} catch (ex)  {
	     this.debug(ex);
	}
}

var img_count_limit=function(){
	
	var imgcount=$("#images").find("img").size();
	if(imgcount>8){
		return ;	
	}
}

var uploadCover_upload_start_handler = function(file){
	
	var imgcount=$("#images").find("img").size();
	if(imgcount>8){
		alert("最多能上传9张图片");
		return ;	
	}
	
	$("#loading").css('display','block'); 
	try {
		$("#courseStatus").text("上传中...");
		$("#courseProBar").css("width","0");
	}
	catch (ex) {}
	return true;
}

var uploadCover_upload_progress_handler = function(file, bytesLoaded, bytesTotal){
	
	img_count_limit();
	try {
		var percent = Math.ceil((bytesLoaded / bytesTotal) * 100);
		if(100 == percent){
			//$("#courseStatus").text("已完成");
			//$("#courseProBar").css("width","100%");
		}else{
			//$("#courseStatus").text("已上传" + percent+ "%");
			//$("#courseProBar").css("width",percent+"%");
		}
	} catch (ex) {
		this.debug(ex);
	}
}

var uploadCover_queue_complete_handler = function(numFilesUploaded) {
	img_count_limit();
	$("#"+this.customSettings.cancelButtonId).hide();
}

var uploadLandCover_upload_success_handler = function(file, serverData){
	var imgcount=$("#images").find("img").size();
	if(imgcount>8){
		return ;	
	}
	try {
		$("#courseStatus").text("已完成");
		$("#courseProBar").css("width","100%");
//		//后台传递回来的内容
		var orgin_url = serverData.split("_")[1];
		//var thumbnail = url.replace(ServerHost.pananas,ServerHost.purl+"/star/193_114c/");
		//var thumbnai_port = url.replace(ServerHost.pananas,ServerHost.purl+"/star/67_114c/");
		var url=orgin_url.replace("/origin/","/25_25c/");
		var attachmentsSize = document.getElementsByName("attachment").length;
		var content=$("#images").html();
		var in1="<input type='hidden' id='files' name='files' value='"+orgin_url+"' /><span class='loadImg' style='margin-right:4px'><a href='javascript:void(0);' onclick='removeinput(this);' style='background-size:70%;right:-10px'></a><img width='25' height='25' src='"+url+"' orginal_='1'></span>"
		//$(".topicCon").animate({height:"350px"},500);
		if (attachmentsSize == 0) {
			$(".newPic").animate({height:"250px"},300);
		} else {
			$(".newPic").animate({height:"390px"},300);
		}
		$("#images").html(content+in1);
		$("#loading").css('display','none'); 
		//$("#coverLandImg").src = thumbnail;
		//$("#coverPortImg").attr('data', url);
		//$("#coverLandImg").attr("src", thumbnail);
//		hasChanged = true;
//		addAutoSaveCheck($("saveCourseImg"));
	} catch (ex) {
		this.debug(ex);
	}
}

var swfu,swfu2, swfu3;

//离开提示保存 
var promptOnClose = function(){
	if(hasChanged == true) {
		return '你有尚未上传完成的文件，离开该页面这些文件将会丢失！';
	}
}
if (window.Event) {
	window.onbeforeunload = function(event) {
		return promptOnClose() ;
	}
} else {
	window.onbeforeunload = function() {
		return promptOnClose();
	}
}