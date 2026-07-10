var supportType = [".pdf",".doc",".docx"];
var fileStatusArray = [];
var initBrainMap = false;
var supportAiBrainMap = $("#supportAiBrainMap").val();
var useBigModelAnalysis = $("#useBigModelAnalysis").val();
var aiVideoInterpret = $("#aiVideoInterpret").val();

var documentInfo = {};
var docType = {};
$(function() {
	if(supportAiBrainMap == "true") {
		if (useBigModelAnalysis == "true" && aiVideoInterpret == "1") {
			loadAiFileStatusNew();
		} else {
			loadAiFileStatus();
		}
	} else {
		initBrainMap = true;
	}
});
function loadAiFileStatusNew() {
	try {
		var objectIdStr = getObjectIds();
		if (objectIdStr == "") {
			initBrainMap = true;
			return;
		}

		var courseId = $("#curCourseId").val();
		var clazzId = $("#clazzId").val();
		var ut = $("#ut").val();
		$.ajax({
			type: "post",
			url: _HOST_CP2_ + '/mycourse/query-brain-map-model',
			data: {
				courseId: courseId,
				objectIds: objectIdStr,
				clazzId: clazzId,
				ut: ut
			},
			dataType: "json",
			success: function (data) {
				initBrainMap = true;
				var list = data.data;
				if (typeof list == "undefined") {
					return
				}
				for (var i = 0; i < list.length; i++) {
					var objId = list[i].objectId;
					var objData = list[i].data;
					if (!objData) {
						continue;
					}
					var summary = objData.summary;
					var mindMap = objData.mindmap;
					var wordcloud = objData.wordcloud;
					// 文档如果摘要和思维导图和词云mark都为2，则显示，否则不显示
					if (!(summary["mark"] == 2 && mindMap["mark"] == 2 && wordcloud["mark"] == 2)) {
						continue;
					}
					documentInfo[objId] = objData;
				}
			},
			error: function () {
				initBrainMap = true;
			}
		});
	} catch (e) {
		
	}
};

function getObjectIds(){
	try {
		if(typeof mArg == "undefined" || mArg == "") {
			return "";
		}

		var array = mArg.attachments;
		if(typeof array == "undefined" || array.length == 0) {
			return "";
		}

		var objectIdArray = [];
		for(var i = 0; i < array.length;i++) {
			var json = array[i];
			var property = json.property;
			if(typeof property == "undefined" || property == "") {
				continue
			}

			var module = property.module;
			if(module !== "insertdoc") {
				continue;
			}

			var type = property.type;
			if(!supportType.includes(type.toLowerCase())) {
				continue;
			}

			var objectId = property.objectid;
			docType[objectId] = type;
			objectIdArray.push(objectId);
		}

		return objectIdArray.join(",");
	} catch (e) {
		console.log(e);
	}

	return "";
}

function loadAiFileStatus() {
	try {
		var objectIdStr = getObjectIds();
		if(objectIdStr == "") {
			initBrainMap = true;
			return;
		}

		var courseId = $("#curCourseId").val();
		$.ajax({
			type:"post",
			url:_HOST_CP2_ + '/mycourse/query-file-status',
			data: {
				courseId: courseId,
				objectIds: objectIdStr
			},
			dataType:"json",
			success:function(data) {
				initBrainMap = true;
				var list = data.data;
				if(typeof list == "undefined") {
					return
				}

				for (var i = 0; i < list.length; i++) {
					fileStatusArray.push(list[i]);
				}
			},
			error : function() {
				initBrainMap = true;
			}
		});
	} catch (ex) {
		console.log(ex);
	}
}