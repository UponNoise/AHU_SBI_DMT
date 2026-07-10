function getcookie(objname){
	var arrstr = document.cookie.split("; ");
	for(var i = 0;i < arrstr.length;i ++){
		var temp = arrstr[i].split("=");
		if(temp[0] == objname){ 
			return unescape(temp[1]);
		}
	}
}
function errorTips(mes){
	$(".toolTipBox").remove();
	var html = '<div class="toolTipBox" style="top:50%;z-index:2019;"><i class="popicon"><img src="/ananas/css/wrong.png" style="display: block"/></i><span class="tipstext">'+ mes +'<span></div>';

	$("body").append("\r\n"+html+"\r\n");
	$(".toolTipBox").fadeIn();
	function hide(){
		$(".toolTipBox").fadeOut();
		$(".toolTipBox").remove();
	}
	setTimeout(hide, 1500)

}
var cancel = function(){
	$("#toplevelTextCommentTitle").val("");
	$("#toplevelTextCommentContent").val("");
	$("#images_fileUploader_group").html("");
	$("#dataSource").html("");
	$("#dataSource").css("padding", "0");
	if ($(".markContent").length > 0) {
		var iframeItem = $("#iframe")[0];
		iframeItem.contentWindow.mark.cancleUnderline();
	}
}
var addGroupDiscussReply = function(topicId,replycount){
 	var doc = document.getElementById("discuss"+topicId);
 	var content = doc.value;
	if(content==null||content=='')
	{
		alert("内容不能为空！");
		return;
	}
	doc.value = "";
	jQuery.post(_HOST_CP2_ + "/bbscircle/addreply",
    	{
    		topicId:topicId,
			content : content,
			pagesize:replycount,
			order:1,
			type:1
    	},
        function(data){
    		if(data.indexOf('error')>0){
    			alert("data");
    		}else{
			   var doc = document.getElementById("replylist"+topicId);
        	   data = data.replace(/(^\s*)|(\s*$)/g,"");
			   doc.innerHTML = data;
			   var rcdoc = document.getElementById("replycount"+topicId);
			   rcdoc.innerHTML = parseInt(rcdoc.innerHTML)+1;
    		}
		}
	);
 };

 var groupreply = function(num,topicid,schoolid) {
 		
		var doc = document.getElementById("replylist"+topicid);
		var showeddoc = document.getElementById("showed"+topicid);
		if(doc.style.display!="none"){
			doc.style.display = "none";
		}else{
			var obj = doc.innerHTML;
			if(obj==null||obj==""){
			     jQuery.post(_HOST_CP2_ + "/bbscircle/getreplysbytopicId",
			    	{
						topicid:topicid,
						pagesize:num,
						order:1,
						type:1
			    	},
			        function(data){
			    		data = data.replace(/(^\s*)|(\s*$)/g,"");
			    		doc.innerHTML = data;
					}
				);
			     doc.style.display = "block";
				  show("replaytextarea"+topicid);
			}else{
				doc.style.display = "block";
				 show("replaytextarea"+topicid);
			}
		}
};
var addgrouptopcomment = function (clazzid, courseid, cpi,isChooseClazz) {
 	var title = document.getElementById("toplevelTextCommentTitle").value;
	if (title.length > 200) {
		errorTips(titleLimit200 || "标题限200字");
		return;
	}
	var inputObjVal=$(".verifyCodeSpan input").val();
 	var content = document.getElementById("toplevelTextCommentContent").value;
	 if (content.length > 20000) {
		 errorTips(contentLimit20000 || "内容限20000字");
		 return;
	 }
    var files = $("#files");
	if((title==""||title.trim()=='')&&(content==""||content.trim()=='')&&(!files.length>0)){
			alert(pulishCheckTip);
			return false;
	}
	var originTitle=title;
		//关联章节
	var chapterId = document.getElementById("chapterIdid").value;
	var chapterTitle = $("#cur"+chapterId).find(".chapternumber").html();
	if(chapterTitle!=null){
		title = "[" + chapterTitle + "节] " + title
	}
	var img=$("#images_fileUploader_group").find("img");
	var str="";
	for(var i=0;i<img.size();i++){
		var imgsrc=img[i];
		if(i==img.size()){
			str=str+imgsrc.src.replace("25_25c","origin");
		}else{
			str=str+imgsrc.src.replace("25_25c","origin")+",";
		}
	}
	document.getElementById("toplevelTextCommentTitle").value = "";
	document.getElementById("toplevelTextCommentContent").value = "";
	var ask = 0;
	if(document.getElementById("askteacher") != null){
		if(document.getElementById("askteacher").checked == true){
    		ask=1;
    	}
	}
	var chapterId=0;
    if(document.getElementById("selchapter_id") !=null){
    	if(document.getElementById("selchapter_id").value!=''){
    	    chapterId=document.getElementById("selchapter_id").value;
    	}
	}
    
    var allNoticeAttachment = noticeAttachment();
    
    var chapterId=document.getElementById("chapterIdid").value;
	var isPublicAsk = $("#content2 .formTopic_padding .markContent").length > 0 && $("#isDigitalTextbook").val() == 1;
	var ut = $("#ut").val();
	if(typeof ut == "undefined" || ut == "") {
		ut = "s";
	}

	var isMicroCourse = $("#isMicroCourse").val();
	var chooseClazzId = 0;
	if (isChooseClazz){
		chooseClazzId = $("#chooseClazzId").val();
	}
	var ignoreNode = $("#ignoreNode").val();


	jQuery.post(_HOST_CP2_ + "/bbscircle/grouptopic/publish",
	{
	   courseId:courseid,
	   clazzid:clazzid,
       isMicroCourse: isMicroCourse,
	   title: title,
	   content:content,
	   type: isPublicAsk == 1 ? 5 : 2,
	   files:str,
	   veridyCode:inputObjVal,
	   chapterId:chapterId,
		attachmentFile: allNoticeAttachment,
		cpi: cpi,
		mooc2: 1,
		ut: ut,
		chooseClazzId: chooseClazzId,
		ignoreNode: ignoreNode
	},
	function(data){
		if (isPublicAsk) {
			try {
				var oObj = eval('(' + data + ')');
				if (oObj.topicId) {
					getChapterRightDiscuss()
					var iframeItem = $("#iframe")[0];
					iframeItem.contentWindow.addTopic(oObj.topicId);
					$("#content2 .markContent").remove();
					$(".formTopic").css("display", "none");
				}
			} catch (e) {
				alert(closeAndReEnterTip);
			}
		} else {
			data = data.replace(/(^\s*)|(\s*$)/g, "");
			var doc = document.getElementById("posDiscussScroll");
			if (data.indexOf('error') == 0) {
				alert(discussFailedTip + " " + data.replace('error;', ''));
			} else {
				$(".formTopic").css("display", "none");
				doc.innerHTML = data;
				cancel();
			}
		}

		//输入内容
		$('.formTopic_text>textarea,.formNote_text>textarea').focus(function(){
			$(this).parent().addClass('areaShadow')
		})
		$('.formTopic_text>textarea,.formNote_text>textarea').blur(function(){
			$(this).parent().removeClass('areaShadow')
		})
        bindImg2('fileUploader_group');
		//讨论话题showhide
		$('.newTopic_bnt').click(function(){
			$(this).next().slideDown(300)
		})
		$('.replyQuxiao').click(function(){
			$(this).parent().parent().slideUp(300)
		})
		function formTopicScroll(){
			$("#formTopicScroll").niceScroll({cursorborder:"",cursorwidth:8,cursorcolor:"#CFD8E6",boxzoom:false,autohidemode:true});
			setInterval(function(){
				$("#formTopicScroll").getNiceScroll().resize(); //检测滚动条是否重置大小（当窗口改变大小时）
			},300)
		}
		formTopicScroll()
		function posDiscuss(){
			var fanyaHeight = $(window).height()
			$('#posDiscussScroll').css({'height' : fanyaHeight - 40 - 65}) //左右浮框
		}
		posDiscuss()
		function posDiscussScroll(){
			$("#posDiscussScroll").niceScroll({cursorborder:"",cursorwidth:8,cursorcolor:"#CFD8E6",boxzoom:false,autohidemode:true});
			setInterval(function(){
				$("#posDiscussScroll").getNiceScroll().resize(); //检测滚动条是否重置大小（当窗口改变大小时）
			},300)
		}
		posDiscussScroll()
		var count = $("#content2 .itemDiscuss").length;
		if (count > 0) {
			if (count < 1000) {
				$(".discussNum").text("(" + count + ")");
			}
		}
	})
	baguetteBox.run('.smallImg', {
			animation: 'fadeIn',
		});
 };
 
 	function addorcanclePraise(topicId,obj,enc,courseId,classId,uuid,ut){
		  ut = typeof ut == "undefined" ? "" : ut;
		  if(obj.className=='zan1 fr'){
		  	canclePraise(topicId,obj,enc,courseId,classId,uuid,ut);
		  }else{
		  	addPraise(topicId,obj,enc,courseId,classId,uuid,ut);
		  }
	}	
	
	function addPraise(topicId,obj,enc,courseId,classId,uuid,ut){
		jQuery.ajax({ 
    	type: "post", 
    	url : _HOST_CP2_ + "/bbscircle/addpraise", 
    	dataType:"json",
    	async : false, 
    	data: {
    			topicId : topicId,
				enc: enc,
				courseId: courseId,
				classId: classId,
			    uuid:uuid,
				ut:ut
    		}, 
        success: function(data){
    		if(data.result==1){
        		obj.innerHTML="<i></i>"+data.data.count;
				$("#ispraise_"+topicId).val(1);
				obj.className="zan1 fr";
    		}
        }
   	 	}); 
	}		
	
	function canclePraise(topicId,obj,enc,courseId,classId,uuid,ut){
		jQuery.ajax({ 
    	type: "post", 
    	url : _HOST_CP2_ + "/bbscircle/canclepraise", 
    	dataType:"json",
    	async : false, 
    	data: {
    			topicId : topicId,
				enc: enc,
				courseId: courseId,
				classId: classId,
			    uuid:uuid,
				ut:ut
    		}, 
        success: function(data){
    		if(data.result==1){
        		obj.innerHTML="<i></i>"+data.data.count;
				$("#ispraise_"+topicId).val(0);
				obj.className="zan fr";
    		}
        	}
   	 	}); 
	}
	
var topicPage = 1;
var getMoreTopic = function(clazzid,pagecount){
	topicPage=topicPage+1;
    jQuery.ajax({ 
    	type: "post", 
    	url : _HOST_CP2_ + "/schoolCourseInfo/getgrouptopic", 
    	dataType:'html',
    	data: {
        		clazzid : clazzid,
				page : topicPage,
				type : 3
    		}, 
    	success: function(data){
        	data = data.replace(/(^\s*)|(\s*$)/g,"");
            var doc = document.getElementById("showTopics");
			doc.innerHTML += data;
			if(topicPage<pagecount){
				 $('#getMoreTopic').show();
			}else{
				 $('#getMoreTopic').hide();
			}
        	baguetteBox.run('.smallImg', {
  				animation: 'fadeIn',
			});
    	} 
    }); 
};

function delTopic(clazzId,topicId) {
	if(confirm("确定删除吗？")) {
		jQuery.ajax({
			type : "get",
			url : _HOST_CP2_ + "/bbscircle/deletetopic",
			data : {
				"clazzid":clazzId,
				"topicid":topicId,
			},
			dataType:'json',
			success : function(data){
			   	if(data.result==1){
					$("#topic_"+topicId).remove();
				}else{
					alert(data.errorMsg);
				}
			}
		});
	}
}
var getMoreReplys = function(topicId,clazzid){
	var t = this;
		
	if(!t.pages){
		t.pages = {};
	}
	
	t.pages[topicId] = t.pages[topicId]?t.pages[topicId]:2;
	
		
    jQuery.ajax({ 
    	type: "post", 
    	url : _HOST_CP2_ + "/bbscircle/getreplysbytopicId", 
    	dataType:'html',
    	data: {
				clazzid : clazzid,
        		topicid : topicId,
				page : t.pages[topicId],
				type : 3
    		}, 
    	success: function(data1){
    		
        	data1 = data1.replace(/(^\s*)|(\s*$)/g,"");
            var doc = document.getElementById("topic_replys_"+topicId);
					
			doc.innerHTML += data1;
			var pageCount=parseInt(t.pages[topicId]);
			$("#reply_page_"+topicId).val(pageCount);
			if(pageCount<parseInt($("#reply_pagecount_"+topicId).val())){
				 $('#more_reply_'+topicId).show();
			}else{
				 $('#more_reply_'+topicId).hide();
			}
			
			t.pages[topicId] = pageCount+1;
    	} 
    }); 
};

function form_rep_submit(topicId,clazzId){
		var content=$("#"+topicId).val();
		if(content==""||content=="回复话题:"||content.trim()==''){
			alert("请输入回复内容！");
			return false;
		}
		jQuery.ajax({ 
        	type: "post", 
        	url : _HOST_CP2_ + "/bbscircle/addreply", 
        	dataType:'html',
        	data: {
                        clazzid : clazzId,
        				topicId : topicId,
            			content : content,
            			type : 3
        		}, 
        	success: function(data){
				var div=$("#more_reply_"+topicId);
					data = data.replace(/(^\s*)|(\s*$)/g,"");
            		var doc = document.getElementById("topic_replys_"+topicId);
					doc.innerHTML += data;
				$("#"+topicId).val("");
				var reply_count=parseInt($("#reply_count"+topicId).val())+1;
				$("#reply_count"+topicId).val(reply_count);
				document.getElementById("reply_count_"+topicId).innerHTML="<i></i>"+reply_count;
        	} 
    	}); 
	}

function delReply(topicId,replyId,type) {
	if(confirm("确定删除吗？")) {
		jQuery.ajax({
			type : "get",
			url : _HOST_CP2_ + "/bbscircle/deletereply",
			data : {
				"topicid":topicId,
				"replyid":replyId,
			},
			dataType:'json',
			success : function(data){
			   	if(data.result==1){
					if(type==2){
						$("#second_reply_"+replyId).remove();
						$("#reply_div_"+replyId).remove();
					}else{
						$("#plDiv_"+replyId).remove();
					}
				}else{
					alert(data.errorMsg);
				}
			}
		});
	}
}

function invitation_addReply(replyId2,topicId,replyId){
		var content=$("#reply_content_"+replyId).val();
		if(content==""||content=="回复话题:"||content.trim()==''){
			alert("请输入回复内容！");
			return false;
		}
		jQuery.ajax({ 
        	type: "post", 
        	url : _HOST_CP2_ + "/bbscircle/addreply", 
        	data: {
        				topicId : topicId,
						replyId : replyId2,
            			content : content,
            			type : 4
        		}, 
        	success: function(data){
				if(data.indexOf('error')>0){
    				alert("data");
    			}else{
    				data = data.replace(/(^\s*)|(\s*$)/g,"");
    				var doc = document.getElementById("second_data_"+replyId);
            		doc.innerHTML+= data;
            		$("#reply_content_"+replyId).val("");
				}
        	} 
    	}); 
	}	

function showreplytext(topicId,secondid,replyid,replyname) {
	var sr=$("#reply_div_"+replyid);
	var value=$("#reply_val_"+replyid).val();
	var ph=$("#reply_content_"+replyid);
	var click=$("#reply_submit_"+replyid);
	if(value==-1){
		$("#reply_val_"+replyid).val(secondid);
		ph.attr("placeholder","回复"+replyname+":");
		click.attr("onclick","invitation_addReply("+secondid+","+topicId+","+replyid+")");
		sr.show();
	}else if(value==secondid){
		if(sr.css("display")=="none"){
			sr.show();
		}else{
			sr.hide();
		}
	}else{
		$("#reply_val_"+replyid).val(secondid);
		ph.attr("placeholder","回复"+replyname+":");
		click.attr("onclick","invitation_addReply("+secondid+","+topicId+","+replyid+")");
		sr.show();
	}
}

function toTop(topicId, courseId, bbsEnc) {
		jQuery.ajax({
			type : "get",
			url : _HOST_CP2_ + "/bbscircle/totop",
			data : {
				"topicid":topicId,
				"courseid": courseId,
				"bbsEnc": bbsEnc
			},
			dataType:'json',
			success : function(data){
			   	if(data.result==1){
					window.location.reload();
				}else{
					alert(data.errorMsg);
				}
			}
		});
}
function cancelTop(topicId, courseId, bbsEnc) {
		jQuery.ajax({
			type : "get",
			url : _HOST_CP2_ + "/bbscircle/canceltop",
			data : {
				"topicid":topicId,
				"courseid":courseId,
				"bbsEnc":bbsEnc
			},
			dataType:'json',
			success : function(data){
			   	if(data.result==1){
					window.location.reload();
				}else{
					alert(data.errorMsg);
				}
			}
		});
}

function addChoice(topicId, courseId, bbsEnc) {
		jQuery.ajax({
			type : "get",
			url : _HOST_CP2_ + "/bbscircle/addchoice",
			data : {
				"topicid":topicId,
				"courseid": courseId,
				"bbsEnc": bbsEnc
			},
			dataType:'json',
			success : function(data){
			   	if(data.result==1){
					window.location.reload();
				}else{
					alert(data.errorMsg);
				}
			}
		});
}
function cancelChoice(topicId, courseId, bbsEnc) {
		jQuery.ajax({
			type : "get",
			url : _HOST_CP2_ + "/bbscircle/cancelchoice",
			data : {
				"topicid":topicId,
				"courseid": courseId,
				"bbsEnc": bbsEnc
			},
			dataType:'json',
			success : function(data){
			   	if(data.result==1){
					window.location.reload();
				}else{
					alert(data.errorMsg);
				}
			}
		});
}

/**
 * 讨论添加附加初始化
 * @returns
 */
function initTopicAttachmentFile() {
	var attachments = document.getElementsByName("attachment");
	var filesize = attachments.length;
	if (filesize >= 9) {
		alert("最多能上传9份附件！");
		return false;
	} else {
		return true;
	}
}

/**
 * 讨论添加附件
 * @returns
 */
function addTopicAttachmentFile (tagClassName,currentTime, uploadEnc,userId) {
	var attachmentSize = document.getElementsByName("attachment").length;
	var addFileA = document.getElementById("addFileA");
	var disable = addFileA.getAttribute("disable");
	if (disable == "true" || disable == true) {
		alert("其他附件正在上传中，请稍候再试");
		//清空当前不允许上传的文件，方便下次上传
		clearInputFile();
		return;
	}
	if(currentTime=== "" || uploadEnc === "") {
		alert("参数错误,上传失败");
		return;
	}
	addFileA.setAttribute("disable",true);
    var data = new FormData();
 	var file = document.getElementById("file");
 	if (file == null) {
 		return;
 	}
    data.append('file', file.files[0]);

    $.ajax({  
        url: ServerHost.uploadDomain + '/upload/uploadNew?t='+currentTime+"&enc2="+uploadEnc+"&userId="+userId,
        type: 'POST',  
        data: data,  
        processData: false,  // 告诉jQuery不要去处理发送的数据  
        contentType: false,  // 告诉jQuery不要去设置Content-Type请求头  
        dataType : 'json',
		xhrFields: {withCredentials: true},
     	success: function (data) {
            if (data.state == "SUCCESS") {
            	if (attachmentSize == 0) {
            		var content = document.getElementsByClassName(tagClassName);
                	$("#dataSource").css("padding", "0")
            	}
				$("#dataSource").css("padding", "14px");
				addFileA.setAttribute("disable", "false");
            	var original = data.original.split(".");
            	var imgUrl = _HOST_CP2_ + '/js/editor20150812/dialogs/attachment_new/fileTypeImages/icon_default.gif';
            	var dataStr = '';
            	if (original.length > 1) {
            		var type = original[original.length -1];
            		imgUrl = getFileTypeUrl(type);
            		data.type = type;
            		dataStr = JSON.stringify(data);
            		var reg = new RegExp("\"" , "g"); //创建正则RegExp对象 
            		dataStr = dataStr.replace(reg,"'"); 
            	}
            	var attachMentName = data.original;
            	if (attachMentName.length > 16) {
            		attachMentName = attachMentName.substring(0,16);
            	}
            	var dataUrl='<li id="' + data.url + '" name="attachment" value="' + dataStr + '"><a title="' + data.original + '" href="/ueditorupload/read?objectId=' + data.url + '" target="_blank">' + attachMentName + '</a><a href="javascript:void(0);" class="docx_dele" onclick="deleteAttachment(\'' + data.url + '\',\'' + tagClassName + '\')">删除</a></li>';
            	$("#dataSource").append(dataUrl);
            	clearInputFile();
        	} else {
				var errorMsg = "上传失败！";
				if(typeof data.state != "undefined"){
					errorMsg  += data.state;
				}

				alert(errorMsg);
				addFileA.setAttribute("disable", false);
				clearInputFile();
			}
        },
        error: function () {
        }
    });
}

function getFileTypeUrl(type){
	var typeUrl = null;
	var allType = [ 'doc', 'exe', 'mp3', 'mv', 'pdf', 'ppt', 'psd', 'rar',
			'txt', 'xls', 'xlsx', 'chm' ];
	for (var i = 0; i < allType.length; i++) {
		var oneType = allType[i];
		if (oneType == type) {
			typeUrl = '/js/editor20150812/dialogs/attachment_new/fileTypeImages/icon_'
					+ type + '.gif';
			break;
		}
	}
	if (type == 'jpg' || type == 'png') {
		typeUrl = '/js/editor20150812/dialogs/attachment_new/fileTypeImages/icon_'
				+ type + '.png';
	}
	if (typeUrl == null || typeUrl == '') {
		typeUrl = '/js/editor20150812/dialogs/attachment_new/fileTypeImages/icon_default.gif';
	}
	return typeUrl;
}

function noticeAttachment(){
	var attachment = "";
	var attachmentsByName = document.getElementsByName("attachment");
	if (attachmentsByName != null && attachmentsByName.length > 0) {
		for (var i = 0; i < attachmentsByName.length; i++) {
			var attachmentA = attachmentsByName[i];
			if (attachmentA == null) {
				continue;
			}
			attachment += attachmentA.getAttribute('value') + ",";
		}
	}
	return attachment;
}

function deleteAttachment(obj , tagClassName) {
	$("#" + obj).remove();
	var attachmentsSize = document.getElementsByName("attachment").length;
	if (attachmentsSize == 0) {
		$("#dataSource").css("padding", "0")
	}
	var addFileA = document.getElementById("addFileA");
	addFileA.setAttribute("disable", "false");
}

/**
 * 清空当前不允许上传的文件
 * @returns
 */
function clearInputFile(){
	var curfile = jQuery("#file");
	curfile.after(curfile.clone().val(""));
	curfile.remove();
}

/**
 * 增加框体高度
 */
function addHeight(curHeight , tab){
	if (curHeight == null) {
		return curHeight;
	}
	if (curHeight.toString().indexOf("px") == -1) {
		return curHeight;
	}
	var curHeightInt = curHeight.substring(0, curHeight.length - 2);
	curHeightInt = parseInt(curHeightInt) + parseInt(tab);
	curHeightInt += "px";
	return curHeightInt;
}

function getFileCloudMsg (filedata) {
	$.ajax({  
        url: _HOST_CP2_ + '/upload/cloudUpload',
        type: 'POST',  
        data : filedata,
        processData: false,  // 告诉jQuery不要去处理发送的数据  
        contentType: false,  // 告诉jQuery不要去设置Content-Type请求头  
        dataType : 'json',
        success: function (data) {
        	if (data.result == '1') {
        		return data.fileNamePath;
        	} else {
        		return '';
        	}
        }
	 });
}