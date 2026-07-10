var DragUtil = {
	dragged: null,
	initdrag: function () {	},
	drop: function () {	}, // 将拖动的元素到所选择的放置目标节点中
	dragover: function () {	}, //
	addLine: function () {	}, //显示蓝色辅助线
	rangeImgs: function () {	}, //计算图片并排后每个图片的宽高
	debounce: function () {	}, //防抖
	thorottle: function () {	}, //节流
	getRandomId: function () {	}, //设置element-id
}
DragUtil.initdrag = function (me) {

	me.document.addEventListener("drag", function (event) {
		event.preventDefault();
	}, false);

	me.document.addEventListener("dragstart", function (event) {
		// 保存拖动元素的引用(ref.)
		if (event.target.tagName == 'IMG' || event.target.tagName == 'IFRAME') {
			DragUtil.dragged = event.target.parentNode;
		} else if (event.target.className && (event.target.className.indexOf('editor-image') > -1 || event.target.className.indexOf('editor-iframe') > -1)) {
			DragUtil.dragged = event.target;
		}
		if (DragUtil.dragged) {
			// 使其半透明
			DragUtil.dragged.style.opacity = .5;
			if(RichTextUitl.iframeDragColumn){
				DragUtil.wrapIframe(me)
			}
		}
		$('.edui-editor-imagescale').removeClass('hover').removeClass('scale');
	}, false);

	me.document.addEventListener("dragend", function (event) {
		if (!DragUtil.dragged) {
			return
		}
		if (DragUtil.dragged && DragUtil.dragged.className && DragUtil.dragged.className == 'editor-iframe') {
			DragUtil.drop(event, me);
		}

		if (me.body.querySelector('.dragGuideLine')) {
			var draggedParent = DragUtil.dragged.parentNode;
			var paddingtop = parseInt($(me.body).css('padding-top').split('px')[0]);
			var linetop = parseInt(me.body.querySelector('.dragGuideLine').style.top.split('px')[0])
			if (paddingtop == linetop) {
				//移出到编辑器的上面
				me.body.insertBefore(DragUtil.dragged, me.body.firstChild);
			} else if (linetop + 1 >= me.body.lastChild.previousSibling.offsetTop + me.body.lastChild.previousSibling.clientHeight) {
				//移出到编辑器的下面
				me.body.appendChild(DragUtil.dragged);
			}
			//给没有包裹drag-image-wrap的图片加 drag-image-wrap
			if (DragUtil.dragged.className && DragUtil.dragged.className.indexOf('editor-image') > -1 && !(DragUtil.dragged.parentNode.className && DragUtil.dragged.parentNode.className.indexOf('drag-image-wrap') > -1)) {
				var div = document.createElement('div');
				div.className = "drag-image-wrap";
				div.setAttribute('contenteditable', 'false');
				div.setAttribute('element-id', DragUtil.getRandomId())
				DragUtil.dragged.parentNode.insertBefore(div, DragUtil.dragged);
				div.appendChild(DragUtil.dragged);
			}
			//移除为空的drag-image-wrap
			if (draggedParent.children.length == 0) {
				draggedParent.parentNode.removeChild(draggedParent);
			} else if ($(draggedParent).hasClass('drag-image-wrap') && draggedParent.querySelectorAll('img').length > 1) {
				//移出后，之前的图片重新计算宽度
				DragUtil.rangeImgs(draggedParent, me);
			} else if (RichTextUitl.iframeDragColumn && $(draggedParent).hasClass('drag-iframe-wrap') && draggedParent.querySelectorAll('iframe').length > 1) {
				//移出后，之前的图片重新计算宽度
				DragUtil.rangeIframes(draggedParent, me);
			}
			$(me.body).find('[temporient]').removeAttr('temporient');
			$(me.body).find('.editor-image,.editor-iframe').css('transform', '');
			me.body.removeChild(me.body.querySelector('.dragGuideLine'));
			// 重置透明度
			DragUtil.dragged.style.opacity = "";
			DragUtil.dragged = null;

			me.fireEvent('contentchange');
			me.fireEvent('saveScene');
		}
		if (DragUtil.dragged) {
			// 重置透明度
			DragUtil.dragged.style.opacity = "";
			DragUtil.dragged = null;
		}
	}, false);

	/* 放置目标元素时触发事件 */
	me.document.addEventListener("dragover", function (event) {
		// 阻止默认动作以启用drop
		event.preventDefault();
		if (!DragUtil.dragged) {
			return
		}
		if ($(me.body).find(DragUtil.dragged).length == 0) {
			event.dataTransfer.dropEffect = 'none';
			return;
		}
		event.dataTransfer.effectAllowed = 'move'
		DragUtil.thorottle(DragUtil.dragover(event, me), 300, true)
	}, false);

	me.document.addEventListener("dragenter", function (event) {
		// 当可拖动的元素进入可放置的目标时高亮目标节点

		//拖动到
	}, false);

	me.document.addEventListener("dragleave", function (event) {
		// 当拖动元素离开可放置目标节点，移除辅助线
		if (!DragUtil.dragged) {
			return
		}
		if (event.target.getAttribute('temporient')) {
			// console.log('X:' + event.pageX + ' ' + (event.target.offsetLeft - 5))
			// console.log('Y:' + event.pageY + ' ' + (event.target.offsetTop - 5))
			//附件移出移除属性的话，属性会一直被移除
			if(event.target.className.indexOf('editor-iframe') > -1){
				return
			}
			var orient = event.target.getAttribute('temporient');
			if ((orient == 'top' || orient == 'bottom') && (event.pageY >= event.target.offsetTop + 5 || event.pageY >= event.target.offsetTop - 5)) {
				event.target.removeAttribute('temporient');
				event.target.style.transform = '';
			} else if (orient == 'left' || orient == 'right') {
				event.target.removeAttribute('temporient');
				event.target.style.transform = '';
			}
		}
	}, false);

	me.document.addEventListener("drop", function (event) {
		// 阻止默认动作（如打开一些元素的链接）
		event.preventDefault();
		if (!DragUtil.dragged) {
			return
		}
		DragUtil.drop(event, me);
	}, false);
	window.addEventListener("drop", function (event) {
		event.preventDefault();
	});
	//拖动到编辑器外部鼠标显示为不允许
	window.addEventListener("dragenter", function (event) {
		event.preventDefault();
		event.dataTransfer.dropEffect = 'none';
	});
	window.addEventListener("dragover", function (event) {
		event.preventDefault();
		if (!DragUtil.dragged) {
			return
		}
		if ($(me.body).find(DragUtil.dragged).length == 0) {
			event.dataTransfer.dropEffect = 'none';
			return;
		}
		event.dataTransfer.dropEffect = 'none';
		//拖到编辑器顶部加到编辑最上面
		if (event.pageY < $(me.iframe).offset().top) {
			DragUtil.addLine(me.body.firstChild, 'top', me);
		} else if (event.pageY > $(me.iframe).offset().top + me.body.clientHeight && !me.body.querySelector('.dragGuideLine')) {
			DragUtil.addLine(me.body.lastChild, 'bottom', me);
		}
	})
}
DragUtil.drop = function (event, me) {
// 将拖动的元素到所选择的放置目标节点中
	if (me.body.querySelector('.dragGuideLine')) {
		var draggedParent = DragUtil.dragged.parentNode;
		var node = $(me.body).find('[temporient]');
		node = node[0];
		if (!node) return;

		var orient = node.getAttribute('temporient');
		console.log(DragUtil.dragged,orient)
		//折叠的标题拖拽到这里时,图片移到折叠的最下面
		var isFold = false;
		if(/h\d/i.test(node.nodeName) && $(node).hasClass('fold') && orient == 'bottom'){
			isFold = true;
			var next = node.nextElementSibling;
			while(next && next.style.display == 'none'){
				next = next.nextElementSibling;
			}
			node = next.previousElementSibling;
		}

		switch (orient) {
			case 'left':
				node.parentNode.insertBefore(DragUtil.dragged, node);
				if ($(node.parentNode).hasClass('drag-image-wrap') && node.parentNode.querySelectorAll('img').length > 1) {
					DragUtil.rangeImgs(node.parentNode, me);
				}else if (RichTextUitl.iframeDragColumn && $(node.parentNode).hasClass('drag-iframe-wrap') && node.parentNode.querySelectorAll('iframe').length > 1) {
					DragUtil.rangeIframes(node.parentNode, me);
				}

				node.parentNode.style.textAlign = '';
				draggedParent.style.textAlign = '';
				break;
			case 'right':
				if (node.nextSibling && node.nextSibling != DragUtil.dragged) {
					node.parentNode.insertBefore(DragUtil.dragged, node.nextSibling);
				} else if (!node.nextSibling) {
					node.parentNode.appendChild(DragUtil.dragged);
				}
				if ($(node.parentNode).hasClass('drag-image-wrap') && node.parentNode.querySelectorAll('img').length > 1) {
					DragUtil.rangeImgs(node.parentNode, me);
				}else if (RichTextUitl.iframeDragColumn && $(node.parentNode).hasClass('drag-iframe-wrap') && node.parentNode.querySelectorAll('iframe').length > 1) {
					DragUtil.rangeIframes(node.parentNode, me);
				}
				node.parentNode.style.textAlign = '';
				draggedParent.style.textAlign = '';
				break;
			case 'top':
				node.parentNode.insertBefore(DragUtil.dragged, node);
				node.style.textAlign = '';
				if(draggedParent.className && draggedParent.className.indexOf('drag-iframe-wrap') > -1 && draggedParent.querySelectorAll('iframe').length > 0){
					DragUtil.dragged.querySelector('iframe').removeAttribute('video-width');
					DragUtil.dragged.querySelector('iframe').removeAttribute('video-height')
				}
				break;
			case 'bottom':
				if (node.nextSibling && node.nextSibling != DragUtil.dragged) {
					node.parentNode.insertBefore(DragUtil.dragged, node.nextSibling);
				} else if (!node.nextSibling) {
					node.parentNode.appendChild(DragUtil.dragged);
				}
				node.style.textAlign = '';
				if(draggedParent.className && draggedParent.className.indexOf('drag-iframe-wrap') > -1 && draggedParent.querySelectorAll('iframe').length > 0){
					DragUtil.dragged.querySelector('iframe').removeAttribute('video-width');
					DragUtil.dragged.querySelector('iframe').removeAttribute('video-height')
				}
				break;
			default:
				break;
		}
		//给没有包裹drag-image-wrap的图片加 drag-image-wrap
		if (DragUtil.dragged.className && DragUtil.dragged.className.indexOf('editor-image') > -1 && !(DragUtil.dragged.parentNode.className && DragUtil.dragged.parentNode.className.indexOf('drag-image-wrap') > -1 )) {
			if(RichTextUitl.imageLayout){ //图片宽度均分：只保留底部间距
				DragUtil.dragged.style.padding = '5px 2px 9px 2px'
			}
			var div = document.createElement('div');
			div.className = "drag-image-wrap";
			div.setAttribute('contenteditable', 'false');
			div.setAttribute('element-id', DragUtil.getRandomId())
			DragUtil.dragged.parentNode.insertBefore(div, DragUtil.dragged);
			div.appendChild(DragUtil.dragged);
			if(isFold){ //折叠标题图片移到折叠里面
				div.style.display = "none";
			}
		}else if(DragUtil.dragged.parentNode.className && DragUtil.dragged.parentNode.className.trim() == 'drag-image-wrap' && isFold){
			//折叠标题图片移到折叠里面
			DragUtil.dragged.parentNode.style.display = "none";
		}
		//移除为空的drag-image-wrap
		if (draggedParent.children.length == 0) {
			draggedParent.parentNode.removeChild(draggedParent);
		} else if ($(draggedParent).hasClass('drag-image-wrap') && draggedParent.querySelectorAll('img').length > 1) {
			//移出后，之前的图片重新计算宽度
			DragUtil.rangeImgs(draggedParent, me);
		} else if (RichTextUitl.iframeDragColumn && $(draggedParent).hasClass('drag-iframe-wrap') && draggedParent.querySelectorAll('iframe').length > 1) {
			//移出后，之前的图片重新计算宽度
			DragUtil.rangeIframes(draggedParent, me);
		}
		node.removeAttribute('temporient');
		$(me.body).find('.editor-image,.editor-iframe').css('transform', '');
		me.body.removeChild(me.body.querySelector('.dragGuideLine'));
		// 重置透明度

		DragUtil.dragged.style.opacity = "";
		DragUtil.dragged = null;
		me.fireEvent('contentchange');
		me.fireEvent('saveScene');
	}
	if (DragUtil.dragged) {
		// 重置透明度
		DragUtil.dragged.style.opacity = "";
		DragUtil.dragged = null;
	}
}

DragUtil.dragover = function (event, me) {
	if (DragUtil.dragged == event.target || DragUtil.dragged == event.target.parentNode) {//拖动到自身，不处理
		return;
	}
	if (event.target.nodeType == 1 && event.target.className && event.target.className == 'dragGuideLine') {
		return;
	}
	//滚动
	var scroll = window, scrollTop = document.scrollingElement.scrollTop, scrollHeight = me.body.clientHeight;
	if (me.options.topOffsetScrollDiv) {
		scroll = document.querySelector(me.options.topOffsetScrollDiv)
		scrollTop = scroll.scrollTop;
		scrollHeight = scroll.scrollHeight;
	}
	if (event.y < 15) {
		scroll.scrollTo({
			top: scrollTop - 10,
			behavior: "smooth"
		});
	} else if (scrollHeight - event.y < 15) {
		scroll.scrollTo({
			top: scrollTop + 10,
			behavior: "smooth"
		});
	}

	if (event.target.tagName == 'IMG' && DragUtil.dragged.className.indexOf('editor-image') > -1) {
		//在图片左右插入
		if (event.offsetX > event.target.clientWidth / 2) {
			DragUtil.addLine(event.target.parentNode, 'right', me);
		} else if (event.offsetX <= event.target.clientWidth / 2) {
			DragUtil.addLine(event.target.parentNode, 'left', me);
		}
	} else if (event.target.className && event.target.className.indexOf("drag-image-wrap") > -1 && DragUtil.dragged.className.indexOf('editor-image') > -1) {
		if (event.offsetY < 5) {
			DragUtil.addLine(event.target, 'top', me);
		} else if (event.target.clientHeight - event.offsetY <= 5) {
			DragUtil.addLine(event.target, 'bottom', me);
		} else if (event.offsetX > event.target.lastElementChild.offsetLeft + event.target.lastElementChild.clientWidth / 2) {//右
			DragUtil.addLine(event.target.lastElementChild, 'right', me);
		} else if (event.offsetX <= event.target.firstElementChild.offsetLeft + event.target.firstElementChild.clientWidth / 2) {//左
			DragUtil.addLine(event.target.firstElementChild, 'left', me);
		}
	} else if (RichTextUitl.iframeDragColumn && DragUtil.dragged.className.indexOf('editor-iframe') > -1 && DragUtil.dragged.firstChild.getAttribute('module') == 'insertVideo' && event.target.className && event.target.className.indexOf('editor-iframe') > -1 && event.target.firstChild && event.target.firstChild.getAttribute('module') && event.target.firstChild.getAttribute('module') == 'insertVideo') {
		//拖拽的元素是视频附件，拖动到视频附件附近
		if (event.offsetX > event.target.clientWidth / 2) {//右
			DragUtil.addLine(event.target, 'right', me);
		} else if (event.offsetX <= event.target.clientWidth / 2) {//左
			DragUtil.addLine(event.target, 'left', me);
		}
	} else if (RichTextUitl.iframeDragColumn && DragUtil.dragged.className.indexOf('editor-iframe') > -1 && event.target.className && event.target.className.indexOf("drag-iframe-wrap") > -1) {
		if (event.offsetY < 5) {
			DragUtil.addLine(event.target, 'top', me);
		} else if (event.target.clientHeight - event.offsetY <= 5) {
			DragUtil.addLine(event.target, 'bottom', me);
		} else if (event.offsetX > event.target.lastElementChild.offsetLeft + event.target.lastElementChild.clientWidth / 2) {//右
			DragUtil.addLine(event.target.lastElementChild, 'right', me);
		} else if (event.offsetX <= event.target.firstElementChild.offsetLeft + event.target.firstElementChild.clientWidth / 2) {//左
			DragUtil.addLine(event.target.firstElementChild, 'left', me);
		}
	} else if (event.target.tagName == 'DIV' && event.target.className.indexOf('editor-image') > -1) {
		if (event.offsetX > event.target.clientWidth / 2) {//右
			DragUtil.addLine(event.target, 'right', me);
		} else if (event.offsetX <= event.target.clientWidth / 2) {//左
			DragUtil.addLine(event.target, 'left', me);
		}
	} else if (event.target.tagName == 'DIV' && event.target.className.indexOf("draghandle") > -1) {
		if (event.offsetY < 5) {
			DragUtil.addLine(event.target.parentNode, 'top', me);
		} else if (event.target.clientHeight - event.offsetY <= 5) {
			DragUtil.addLine(event.target.parentNode, 'bottom', me);
		}
	} else if (event.target.tagName == 'P' || /h\d/i.test(event.target.tagName) || event.target.tagName == 'DIV') {
		if (event.offsetY < 5) {
			DragUtil.addLine(event.target, 'top', me);
		} else if (event.target.clientHeight - event.offsetY <= 5) {
			DragUtil.addLine(event.target, 'bottom', me);
		}
	} else if ((event.target.tagName == 'OL' || event.target.tagName == 'UL') && event.target.firstChild.firstChild.nodeType == 1) {
		target = event.target.firstChild.firstChild;
		if (event.offsetY < 5) {
			DragUtil.addLine(target, 'top', me);
		} else if (event.target.clientHeight - event.offsetY <= 5) {
			DragUtil.addLine(target, 'bottom', me);
		}
	} else if (event.target.tagName == 'BODY' && (event.offsetY < 5 || me.body.clientHeight - event.offsetY < 5)) {
		DragUtil.addLine(event.target.lastChild.previousElementSibling, 'bottom', me);
	} else if (me.body.querySelector('.dragGuideLine')) {
		me.body.removeChild(me.body.querySelector('.dragGuideLine'));
	}
}
//显示蓝色辅助线
DragUtil.addLine = function (node, orientation, me) {
	//当前已有辅助线的，不再执行
	if (node.getAttribute('temporient') && node.getAttribute('temporient') == orientation) {
		return;
	}
	if(node == DragUtil.dragged){
		return;
	}
	//是辅助线，不再执行
	if(node.className  && node.className.indexOf('dragGuideLine') > -1){
		return;
	}
	//一排最多放6个图片
	if (node.parentNode.className && node.parentNode.className.indexOf('drag-image-wrap') > -1 && node.parentNode.querySelectorAll('.editor-image').length == 6) {
		return;
	}
	if (node.parentNode.className && node.parentNode.className.indexOf('drag-iframe-wrap') > -1 && node.parentNode.querySelectorAll('.attach-insertVideo').length == 3) {
		//一排最多放3个视频
		return;
	}
	//附件只支持上下移动
	if (DragUtil.dragged.className && DragUtil.dragged.className.indexOf('editor-iframe') > -1 && ((RichTextUitl.iframeDragColumn && DragUtil.dragged.firstChild.getAttribute('module') != 'insertVideo') || !RichTextUitl.iframeDragColumn) && (orientation == 'left' || orientation == 'right')) {
		return;
	}

	if (node.className && node.className == 'draghandle') {
		return;
	}
	//左侧已经有了辅助线，右侧就不再加,右侧有了左侧不再加
	if (node.className && (node.className.indexOf('editor-image') > -1 || node.className.indexOf('editor-iframe') > -1)) {
		if (node.previousElementSibling && node.previousSibling.getAttribute('temporient') && node.previousSibling.getAttribute('temporient') == 'right' && orientation == 'left') {
			return;
		}
		if (node.nextElementSibling && node.nextSibling.getAttribute('temporient') && node.nextSibling.getAttribute('temporient') == 'left' && orientation == 'right') {
			return;
		}
	}
	$('.edui-editor-foldTitlebar').removeClass('hover');
	$(me.body).find('.editor-image,.editor-iframe').css('transform', '');
	var div;
	if (!me.body.querySelector('.dragGuideLine')) {
		div = document.createElement('div');
		me.body.appendChild(div);
	} else {
		div = me.body.querySelector('.dragGuideLine');
	}
	div.className = 'dragGuideLine ' + orientation;
	switch (orientation) {
		case 'top':
			div.style.top = $(node).offset().top + 'px';
			div.style.left = '';
			div.style.height = '';
			break;
		case 'bottom':
			div.style.top = $(node).offset().top + node.clientHeight + 'px';
			div.style.left = '';
			div.style.height = '';
			break;
		case 'left':
			div.style.top = $(node).offset().top + 'px';
			div.style.left = $(node).offset().left + 'px';
			div.style.height = node.clientHeight + 'px';
			break;
		case 'right':
			div.style.top = $(node).offset().top + 'px';
			var left = (($(node).offset().left + node.clientWidth + 2) >= $(me.body).width()) ? ($(me.body).width() - 2) : ($(node).offset().left + node.clientWidth)
			div.style.left = left + 'px';
			div.style.height = node.clientHeight + 'px';
			break;
		default:
			break;
	}

	$(me.body).find('[temporient]').removeAttr('temporient');

	node.setAttribute('temporient', orientation);
console.log(node)
	if (node.className && node.className.indexOf('editor-image') > -1) {
		if (orientation == 'left') {
			node.style.transform = 'translateX(5px)';
			$(node).prevAll().css('transform', 'translateX(-5px)');
			$(node).nextAll().css('transform', 'translateX(5px)');
		} else if (orientation == 'right') {
			node.style.transform = 'translateX(-5px)';
			$(node).prevAll().css('transform', 'translateX(-5px)');
			$(node).nextAll().css('transform', 'translateX(5px)');
		}
	}
}

//计算图片并排后每个图片的宽高
DragUtil.rangeImgs = function (node) {
	var imgList = node.querySelectorAll('img');

	//思路：图片拖拽前后图片比例不变，拖拽后高度一致，即取图片比例s1=w1/h1，s2=w2/h2，高度一致，暂取1，高度取1时图片对应的宽度为s1,s2,s3...,
	// 此时图片和并排后的图片缩放倍数n一致，得(s1+s2+s3+...)*n = 800,s1,s2,s3已知，可以求得n,进而得到每个图片的宽度s1*n,s2*n,...
	var totalscaleWidth = 0;//图片比例之和
	for (var i = 0; i < imgList.length; i++) {
		totalscaleWidth += imgList[i].clientWidth / imgList[i].clientHeight;
	}
	var n = ($(node).width() - imgList.length * 4) / totalscaleWidth;
	if(RichTextUitl.imageLayout){ //图片均分宽度
		totalscaleWidth = 1.5 * imgList.length
		n = ($(node).width() - (imgList.length - 1) * 14 - 4) / totalscaleWidth;
	}
	for (var i = 0; i < imgList.length; i++) {
		var width = parseInt((imgList[i].clientWidth / imgList[i].clientHeight) * n);
		if(RichTextUitl.imageLayout){ //图片均分宽度
			width = parseInt(1.5 * n)
			imgList[i].style.height = parseInt(n) + 'px';
			imgList[i].parentNode.style.padding = '5px 12px 9px 2px'
			if(i == imgList.length - 1){
				imgList[i].parentNode.style.padding = ''
			}
			imgList[i].parentNode.className = 'editor-image'
		}
		imgList[i].style.width = width + 'px';
		imgList[i].style.height = '';
		imgList[i].width = width;
		imgList[i].removeAttribute('height');
	}
}
//计算视频并排后每个视频的宽高
DragUtil.rangeIframes = function (node) {
	var iframeList = node.querySelectorAll('iframe');

	//思路：参考图片，视频的只计算视频封面宽高比例，所以减去视频底部的36
	var totalscaleWidth = 0;//视频比例之和
	for (var i = 0; i < iframeList.length; i++) {
		totalscaleWidth += iframeList[i].clientWidth / (iframeList[i].clientHeight - 36);
	}
	//29包含4的左右边距+25的把手的宽度
	var n = ($(node).width() - iframeList.length * 29) / totalscaleWidth;

		for (var i = 0; i < iframeList.length; i++) {
			var width = parseInt((iframeList[i].clientWidth / (iframeList[i].clientHeight - 36)) * n);
			iframeList[i].parentNode.style.width = (width + 4) + 'px';
			iframeList[i].parentNode.style.height = (parseInt(n) + 46) + 'px';
			// 设置视频封面高度
			iframeList[i].contentWindow.postMessage({
				msgType: 'changeVideoCoverHeight',
				cid: iframeList[i].getAttribute('cid'),
				coverHeight: parseInt(n),
			}, '*')
			// iframe 宽高
			iframeList[i].setAttribute('video-width', width);
			iframeList[i].setAttribute('video-height',parseInt(n));
		}

}

// 给editor-iframe外层加wrap
DragUtil.wrapIframe = function (me) {
	var iframeList = me.document.body.querySelectorAll('.attach-insertVideo');
	for (var i = 0; i < iframeList.length; i++) {
		if(iframeList[i].parentNode.parentNode.className && iframeList[i].parentNode.parentNode.className.indexOf('drag-iframe-wrap') == -1){
			$(iframeList[i].parentNode).wrap('<div class="drag-iframe-wrap" contenteditable="false"></div>')
		}
	}
}

/**
 *
 * @param fn 函数名
 * @param delay 延迟时间
 * @param immediate 是否立刻执行
 * @returns {function(): void} 返回函数
 */
// 防抖
DragUtil.debounce = function (fn, delay, immediate) {
	let timer = null;
	delay = delay || 500;
	return function () {
		const context = this;
		const args = arguments;
		if (timer) {
			clearTimeout(timer);
		}
		if (immediate) {
			if (!timer) {
				fn.apply(context, args);
			}
			timer = setTimeout(function () {
				timer = null;
			}, delay);
		} else {
			timer = setTimeout(function () {
				timer = fn.apply(context, args);
			}, delay);
		}
	}
}

// 节流
DragUtil.thorottle = function (fn, step, immediate) {
	var timer = null;
	step = step || 500;
	return function () {
		const context = this;
		const args = arguments;
		if (!timer) {
			if (immediate) {
				fn.apply(context, args);
				timer = setTimeout(function () {
					timer = null;
				}, step);
			} else {
				timer = setTimeout(function () {
					fn.apply(context, args);
					timer = null;
				}, step);
			}
		}
	}
}

DragUtil.getRandomId = function () {
	var str = "abcdefghijklmnopqrstuvwxyz0123456789";
	var tmp = [];
	var random;
	for (var i = 0; i < 8; i++) {
		random = Math.floor(Math.random() * (str.length));
		if (tmp.indexOf(str[random]) === -1) {
			tmp.push(str[random])
		} else {
			i--;
		}
	}
	return tmp.join('');
}
