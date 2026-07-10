/** 标题折叠
 * 2022-7 */
function initFoldTitle(me, domUtils) {
  domUtils = domUtils;
  var foldTitle;
  //鼠标移上显示折叠
  me.addListener('mouseover', function (type, e) {
    var hTitle;
    if (/h\d/i.test(e.target.nodeName)) {
      hTitle = e.target;
    }
    if((e.target.nodeName == 'OL' || e.target.nodeName == 'UL') && e.target.firstChild && e.target.firstChild.firstChild && /h\d/i.test(e.target.firstChild.firstChild.nodeName)){
      hTitle = e.target.firstChild.firstChild;
    }
    if (hTitle) {
      //表格、课程报告、勾选框、录音打点、收件箱签名 不显示折叠三角
      if($(hTitle).parents('table').length > 0 || $(hTitle).parents('.top-cover-bot').length > 0
        || $(hTitle).parents('.todo-view').length > 0 || $(hTitle).parents('.callout-block').length > 0 || $(hTitle).parents('.record-box').length > 0 || $(hTitle).parents('.signDiv').length > 0 || $(hTitle).hasClass('signTitle')){
        return
      }
      if(hTitle.innerText.trim() == '' || domUtils.isFillChar(hTitle.innerText.trim()) || hTitle.innerText.trim() == '​'){
        return
      }
      //PC端笔记编辑器，正文标题下如果没有子内容，不显示展开收起按钮。
      if(!hTitle.nextSibling || (hTitle.nextSibling && /h\d/i.test(hTitle.nextSibling.nodeName) && hTitle.nextSibling.nodeName.replace(/h/i,'') <= hTitle.nodeName.replace(/h/i,''))){
        return;
      }
      if (!foldTitle) {
        foldTitle = new Title();
        foldTitle.init(me, hTitle);
        me.ui.getDom().appendChild(foldTitle.resizer);
      }
      foldTitle.show(hTitle,domUtils);
    }
  });
  me.addListener('mouseleave',function (type,e) {
    var hTitle;
    if (/h\d/i.test(e.target.nodeName)) {
      hTitle = e.target;
    }
    if((e.target.nodeName == 'OL' || e.target.nodeName == 'UL') && e.target.firstChild && e.target.firstChild.firstChild && /h\d/i.test(e.target.firstChild.firstChild.nodeName)){
      hTitle = e.target.firstChild.firstChild;
    }
    if(hTitle){
      $(me.body).find('.edui-editor-foldTitlebar .tri').css('transition','')
    }
  })
  $('body').on('mouseover', function (e) {
    if ($(e.target).hasClass('edui-editor-foldTitlebar') || $(e.target).parents('.edui-editor-foldTitlebar').length > 0) {
      var resizer = $(e.target).hasClass('edui-editor-foldTitlebar') ? e.target : $(e.target).parents('.edui-editor-foldTitlebar')[0];
      var editorId = $(resizer).parents('.edui-editor.edui-default').parent().attr('id');
      var editor = UE.getEditor(editorId);
      //列表悬浮隐藏
      $(editor.body).find('li').removeClass('hover');
      $(resizer).parents('.edui-editor.edui-default').parent().find('.listtoolList,.modifyListNum,.edui-editor-listtoolbar .hoverTips').hide();
      $(resizer).parents('.edui-editor.edui-default').parent().find('.continueListNumBtn,.startNewListBtn,.modifyListNumBtn').removeClass('disabled');
      $(resizer).parents('.edui-editor.edui-default').parent().find('.edui-editor-listtoolbar').removeClass('hover');
      if ($(editor.container).find('.edui-editor-foldTitlebar')[0] == resizer) {
        $(editor.body).find('h1,h2,h3,h4,h5,h6').eq($(resizer).attr('index')).addClass('hover');
      }
    }
  })
  $(me.container).on('mouseleave', function (e) {
    if(foldTitle){
        foldTitle.hide();
    }
  })
  me.addListener("contentchange", function () {
    $(me.container).find('.edui-editor-foldTitlebar').removeClass('hover')
  })
  me.addListener('keydown', function (type, evt) {
    var keyCode = evt.keyCode || evt.which;
    if (keyCode == 8) { //删除
      var range = me.selection.getRange();
      var start = range.startContainer;
      while(!(start.nodeType == 1 && domUtils.isBlockElm(start))){
        start = start.parentNode;
      }
      //折叠标题后，光标定在标题下一行的开始点删除，展开上一个折叠标题，当前标题变成正文，当前标题也展开
      if(range.collapsed && domUtils.isStartInblock(range) && /h\d/i.test(start.tagName) && ((start.previousElementSibling && start.previousElementSibling.style.display == 'none') || (start.innerText.trim() == '' || start.innerText == fillChar))){
        evt.preventDefault()
        var prev = start.previousElementSibling;
        var next = start.nextElementSibling;

        //如果当前标题折叠，全部打开
        if($(start).hasClass('fold')){
          while(next && next.style.display == 'none'){
            next.style.display = '';
            next = next.nextElementSibling;
          }
        }
        //当前标题变成p
        var p = document.createElement('p');
        p.innerHTML = start.innerHTML;
        p.setAttribute('element-id',start.getAttribute('element-id'));
        start.parentNode.insertBefore(p,start);
        range.setStart(p,0).collapse(true).select(true);
        start.parentNode.removeChild(start);

        //start前面折叠起来的全部展开
        while(prev && prev.style.display == 'none'){
          prev.style.display = '';
          prev = prev.previousElementSibling;
        }
        if(prev) prev.classList.remove('fold');
      }
    }
  });
}

function Title() {
  this.editor = null;
  this.resizer = null;
  this.doc = document;
  this.title = null;
}

Title.prototype = {
  init: function (editor) {
    var me = this;
    me.editor = editor;

    var resizer = me.resizer = document.createElement('div');
    resizer.innerHTML = '<div class="foldtitle-tri-wrap">' +
      '<i class="tri"></i>' +
      '<div class="hoverTips"><span>收起</span><i></i></div>' +
      '</div>';
    resizer.id = me.editor.ui.id + '_foldTitlebar';
    resizer.className = 'edui-editor-foldTitlebar edui-editor-resizer';
    resizer.style.cssText += ';z-index:' + (me.editor.options.zIndex) + ';';
    me.editor.ui.getDom().appendChild(resizer);
    me.initEvents();
  },
  initEvents: function () {
    var me = this;
    $(me.resizer).on('click', '.foldtitle-tri-wrap', function() {
      var target = me.target;
      var nowHeadLevel = parseInt(target.tagName.replace(/h/i,''));
      var next = target.nextElementSibling;
      if($(target).parents('ol,ul').length>0){
        next = $(target).parents('ol,ul')[0].nextElementSibling;
      }
      var _this = this;
      $(_this).find('.tri')[0].style.transition = 'all 0.3s';
      setTimeout(function () {
        $(_this).find('.tri')[0].style.transition = '';
      },400)
      if($(this).hasClass('fold')){
        //展开
        $(this).removeClass('fold');
        target.classList.remove('fold');
        $(me.resizer).find('.hoverTips span').text('收起');
        if(!next) return;
        while(next){
          var tagName = next.nodeName;
          var headLevel;
          if(/h\d/i.test(tagName)){
            headLevel = parseInt(tagName.replace(/h/i,''));
            if(headLevel <= nowHeadLevel){
              //标题等级等于或者大于当前标题，结束循环
              break;
            }
            next.classList.remove('fold');
          }else if(tagName == 'UL' || tagName == 'OL'){
            if(next.firstChild && next.firstChild.firstChild && next.firstChild.firstChild.nodeType == 1 && /h\d/i.test(next.firstChild.firstChild.nodeName)){
              headLevel = parseInt(next.firstChild.firstChild.nodeName.replace(/h/i,''));
              next.firstChild.firstChild.classList.remove('fold');
              if(headLevel <= nowHeadLevel){
                //标题等级等于或者大于当前标题，结束循环
                break;
              }
            }
          }
          next.style.display = '';
          next.classList.remove('fold');
          next = next.nextElementSibling;
        }
      }else{
        //收起
        $(this).addClass('fold');
        target.classList.add('fold');
        $(me.resizer).find('.hoverTips span').text('展开');
        if(!next) return;
        while(next){
          var tagName = next.nodeName;
          var headLevel;
          if(/h\d/i.test(tagName)){
            headLevel = parseInt(tagName.replace(/h/i,''));
            if(headLevel <= nowHeadLevel){
              //标题等级等于或者大于当前标题，结束循环
              break;
            }
            next.classList.remove('fold');
          }else if(tagName == 'UL' || tagName == 'OL') {
            if (next.firstChild && next.firstChild.firstChild && next.firstChild.firstChild.nodeType == 1 && /h\d/i.test(next.firstChild.firstChild.nodeName)) {
              headLevel = parseInt(next.firstChild.firstChild.nodeName.replace(/h/i, ''));
              next.firstChild.firstChild.classList.remove('fold');
              if (headLevel <= nowHeadLevel) {
                //标题等级等于或者大于当前标题，结束循环
                break;
              }
            }
          }
          next.style.display = 'none';
          next = next.nextElementSibling;
        }
      }
      var range = me.editor.selection.getRange();
      range.setStart(target,0).collapse(true).select(true)
      // me.editor.adjustHeight();
      me.editor.fireEvent('contentchange');
      me.editor.fireEvent('saveScene');
    })
  },
  show: function (targetObj,domUtils) {
    var me = this;
    if (targetObj) {
      me.resizer.classList.add('hover');
      me.attachTo(targetObj,domUtils);
      if($(targetObj).hasClass('fold')){
        me.resizer.querySelector('.foldtitle-tri-wrap').classList.add('fold');
        $(me.resizer).find('.hoverTips span').text('展开');
      }else{
        me.resizer.querySelector('.foldtitle-tri-wrap').classList.remove('fold');
        $(me.resizer).find('.hoverTips span').text('收起');
      }
    }
  },
  hide: function () {
    var me = this;
    me.resizer.classList.remove('hover');
    me.resizer.querySelector('.foldtitle-tri-wrap').classList.remove('fold')
  },
  attachTo: function (targetObj,domUtils) {
    var me = this,
      target = me.target = targetObj,
      resizer = this.resizer,
      titlePos = domUtils.getXY(target),
      iframePos = domUtils.getXY(me.editor.iframe),
      editorPos = domUtils.getXY(resizer.parentNode);
    var index = $(me.editor.body).find('h1,h2,h3,h4,h5,h6').index(target);
    resizer.setAttribute('index', index);
    domUtils.setStyles(resizer, {
      'width': 0,
      'height': 0,
      'left': 0,
      'top': iframePos.y + titlePos.y - me.editor.document.body.scrollTop - editorPos.y + 'px'
    });
    domUtils.setStyles(resizer.querySelector('.foldtitle-tri-wrap'), {
      'top': parseInt($(target).css('line-height').replace('px','')/2) - 7 - 9 + 'px',
      'left': iframePos.x - editorPos.x + parseInt($(me.editor.body).css('padding-left').replace('px','')) - 30 + 'px'
    });
  }
}
