function ResizeVideo(domUtils) {
  this.editor = null
  this.resizer = null
  this.hands = []
  this.target = null
  this.dragId = -1
  this.domUtils = domUtils
}

ResizeVideo.prototype = {
  init: function (editor) {
    var me = this
    me.editor = editor
    this.prePos = {
      x: 0,
      y: 0,
    }

    var hands = [],
      resizer = (me.resizer = document.createElement('div'))

    for (i = 0; i < 4; i++) {
      hands.push('<span class="edui-editor-videoscale-hand' + i + '" id="videoscale' + i + '"></span>')
    }

    resizer.id = me.editor.ui.id + '_videoscale'
    resizer.className = 'edui-editor-videoscale edui-editor-resizer'
    resizer.innerHTML = '<div class="cursorDiv">' + hands.join('') + '</div>'
    resizer.style.cssText += ';z-index:' + me.editor.options.zIndex + ';'

    me.hands = resizer.querySelector('.cursorDiv').querySelectorAll('span')
    me.editor.ui.getDom().appendChild(resizer)
  },
  // 是否能够调整大小
  canResize: function (width, height) {
    // 最大宽度 750
    if (width >= 750) return false
    // 竖版视频 最小宽度200
    if (width <= height) {
      return width >= 200
    }
    // 横版视频 最小宽度330
    else {
      return width >= 330
    }
  },
  mouseDown: function (e) {
    var me = this
    var hand = e.target || e.srcElement

    if (hand.className && hand.className.indexOf('edui-editor-videoscale-hand') != -1 && me.dragId == -1) {
      me.dragId = hand.className.slice(-1)
      me.prePos.x = Number(e.screenX)
      me.prePos.y = Number(e.screenY)

      $(me.target.querySelector('iframe[module="insertVideo"]')).css('pointerEvents', 'none')

      // 视频宽高比 减去内边距和底部工具栏高度
      me.videoRatio = (me.target.clientWidth - 4) / (me.target.clientHeight - 46)

      me.editor.body.onmousemove = function (e) {
        me.mouseMove(e)
      }
      me.editor.body.onmouseup = function (e) {
        me.mouseUp(e)
      }
      document.body.onmouseup = function (e) {
        me.mouseUp(e)
      }
    }
  },
  mouseMove: function (e) {
    e.preventDefault()
    var me = this
    if (me.dragId == -1) return

    var newWidth, newHeight, offsetX

    // 拖拽左上、左下拖拽点 取反
    if (me.dragId == 0 || me.dragId == 2) {
      offsetX = me.prePos.x - e.screenX
    } else {
      offsetX = e.screenX - me.prePos.x
    }

    me.prePos = {
      x: e.screenX,
      y: e.screenY,
    }

    newWidth = parseInt(offsetX * 2 + me.target.clientWidth - 4)
    newHeight = parseInt(newWidth / me.videoRatio)

    if (!me.canResize(newWidth, newHeight)) return

    var videoIframe = me.target.querySelector('.attach-insertVideo')

    // 设置容器尺寸
    me.domUtils.setStyles(me.target, {
      width: newWidth + 4 + 'px',
      height: newHeight + 46 + 'px',
    })

    $(videoIframe).attr('video-width', newWidth)
    $(videoIframe).attr('video-height', newHeight)

    // 设置视频封面高度
    videoIframe.contentWindow.postMessage({
      msgType: 'changeVideoCoverHeight',
      cid: videoIframe.getAttribute('cid'),
      coverHeight: newHeight,
    }, '*')

    me.attachTo(me.target)
    
    me.editor.adjustHeight();
  },
  mouseUp: function (e) {
    var me = this
    if (me.dragId != -1) {
      me.dragId = -1
    }
    me.editor.body.onmousemove = null
    me.editor.body.onmouseup = null
    document.body.onmouseup = null
    $(me.target.querySelector('iframe[module="insertVideo"]')).css('pointerEvents', 'unset')
    me.editor.fireEvent('saveScene')
  },
  show: function (targetObj) {
    var me = this

    me.target = targetObj
    me.resizer.classList.add('scale')
    me.attachTo(targetObj)

    $(me.editor.body)
      .find('.videoScale')
      .each(function (index, item) {
        $(item).removeClass('videoScale')
      })

    // 视频wrap添加选中类名
    if ($(targetObj).hasClass('editor-iframe') && $(targetObj).children('[module="insertVideo"]').length > 0) {
      $($(targetObj).children('[module="insertVideo"]')[0]).addClass('videoScale')
    }

    for (var i = 0; i < 4; i++) {
      me.hands[i].onmousedown = function (e) {
        e.preventDefault()
        me.mouseDown(e)
      }
    }
  },
  hide: function () {
    var me = this
    me.resizer.classList.remove('scale')

    $(me.editor.body)
      .find('.videoScale')
      .each(function (index, item) {
        $(item).removeClass('videoScale')
      })

    for (var i = 0; i < 4; i++) {
      me.hands[i].onmousedown = null
    }
  },
  attachTo: function (targetObj) {
    var me = this,
      target = me.target,
      resizer = this.resizer,
      /*getXY获取当前元素 xy可视坐标*/
      videoWrapPos = me.domUtils.getXY(target),
      iframePos = me.domUtils.getXY(me.editor.iframe),
      editorPos = me.domUtils.getXY(resizer.parentNode)

    if ($(targetObj).parents('.table').length > 0 && $(targetObj).parents('.table')[0].scrollLeft > 0) {
      me.domUtils.setStyles(resizer, {
        width: 0,
        height: 0,
        left:
          iframePos.x +
          videoWrapPos.x -
          me.editor.document.body.scrollLeft -
          $(targetObj).parents('.table')[0].scrollLeft -
          editorPos.x +
          1 +
          'px',
        top: iframePos.y + videoWrapPos.y - me.editor.document.body.scrollTop - editorPos.y - 3 + 'px',
      })
    } else {
      me.domUtils.setStyles(resizer, {
        width: 0,
        height: 0,
        left: iframePos.x + videoWrapPos.x - me.editor.document.body.scrollLeft - editorPos.x + 2 + 'px',
        top: iframePos.y + videoWrapPos.y - me.editor.document.body.scrollTop - editorPos.y + 5 + 'px',
      })
    }

    //左上
    me.domUtils.setStyles(resizer.querySelector('.edui-editor-videoscale-hand0'), {
      left: '0',
      top: '0',
    })
    //右上
    me.domUtils.setStyles(resizer.querySelector('.edui-editor-videoscale-hand1'), {
      left: parseInt($(target).width()) + 'px',
      top: '0',
    })
    //左下
    me.domUtils.setStyles(resizer.querySelector('.edui-editor-videoscale-hand2'), {
      left: '0',
      top: parseInt($(target).height()) + 'px',
    })
    //右下
    me.domUtils.setStyles(resizer.querySelector('.edui-editor-videoscale-hand3'), {
      left: parseInt($(target).width()) + 'px',
      top: parseInt($(target).height()) + 'px',
    })
  },
}

function initResizeVideo(me, domUtils) {
  var resizeVideo = null

  function getVideoWrapByCid(cid) {
    if(!cid) return
    return $(me.body).find('iframe[cid=' + cid + ']').parent()[0]
  }

  window.addEventListener('message', function(event) {
    var data = event.data
    if(!data) return
    if(data.msgType == 'showVideoWrapResizer') {
      var videoWrapElm = getVideoWrapByCid(data.cid)

      // 图标引擎-富文本组件 既含有编辑状态 又含有详情状态 隐藏拖拽把手
      if(document.querySelector('.richtext iframe[cid="' + data.cid + '"]')) {
        return
      }

      // console.log('videoWrapElm', videoWrapElm)
      if (!videoWrapElm) return
      if (!resizeVideo) {
        resizeVideo = new ResizeVideo(domUtils)
        resizeVideo.init(me)
        me.ui.getDom().appendChild(resizeVideo.resizer)
      }
      resizeVideo.show(videoWrapElm)
    } else if(data.msgType == 'hideVideoWrapResizer') {
      var videoWrapElm = getVideoWrapByCid(data.cid)
      if (!videoWrapElm) return
      resizeVideo && resizeVideo.hide()
    }
  })

  me.addListener('click', function () {
    resizeVideo && resizeVideo.hide()
  })

  me.addOutputRule(function (root) {
    root.traversal(function (node) {
      // 过滤视频聚焦类名
      if (node.getAttr('class') && node.getAttr('class').indexOf('videoScale') > -1) {
        node.setAttr('class', node.getAttr('class').replace('videoScale', ''))
      }
    })
  })

}
