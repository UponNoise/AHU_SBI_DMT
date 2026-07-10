var topIsIpad = (navigator.userAgent.indexOf('iPad') > -1);
var topIsIos = (!!navigator.userAgent.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/));
var iosPlayer = topIsIos || topIsIpad;

function pauseAllVideoWx() {
    try {
        var list = $("#content").find(".ans-insertvideo-wx");
        if(typeof list != "undefined" && list.length > 0) {
            for(var i = 0; i < list.length; i++) {
                var item = list[i];
                var button = $(item.contentWindow.document).find(".vjs-fullscreen-control");
                if(!iosPlayer) {
                    if(typeof button != "undefined" && item.contentWindow.videojs("video").isFullscreen()) {
                        $(item.contentWindow.document).find(".vjs-fullscreen-control").click();
                    }
                }else {
                    if(typeof button != "undefined" && item.contentWindow.iosIsFullScreen()) {
                        $(item.contentWindow.document).find(".vjs-fullscreen-control").click();
                    }
                }

                if(!item.contentWindow.videojs("video").paused()) {
                    item.contentWindow.videojs("video").pause();
                }
            }
        }
    }catch (ex) {
        console.log(ex)
    }
}

function pauseAllAudioWx() {
    try {
        var list = $("#content").find(".ans-insertaudio");
        if(typeof list != "undefined" && list.length > 0) {
            for(var i = 0; i < list.length; i++) {
                var item = list[i];

                if($(item.contentWindow.document).find('.audioplayer').hasClass("audioplayer-playing")) {
                    $(item.contentWindow.document).find('.audioplayer .audioplayer-playpause').click();
                }
            }
        }
    }catch (ex) {
        console.log(ex)
    }
}


function pauseAllVideo() {
    try {
        var list = $("#iframe").contents().find(".ans-insertvideo-online");
        if(typeof list != "undefined" && list.length > 0) {
            for(var i = 0; i < list.length; i++) {
                var item = list[i];
                var button = $(item.contentWindow.document).find(".vjs-fullscreen-control");
                if(typeof button != "undefined" && item.contentWindow.videojs("video").isFullscreen()) {
                    $(item.contentWindow.document).find(".vjs-fullscreen-control").click();
                }

                if(!item.contentWindow.videojs("video").paused()) {
                    item.contentWindow.videojs("video").pause();
                }
            }
        }
    }catch (ex) {
        console.log(ex);
    }
}

function pauseAllAudio() {
    try {
        var list = $("#iframe").contents().find(".ans-insertaudio");
        if(typeof list != "undefined" && list.length > 0) {
            for(var i = 0; i < list.length; i++) {
                var item = list[i];

                if(!item.contentWindow.videojs("audio").paused()) {
                    item.contentWindow.videojs("audio").pause();
                }
            }
        }
    }catch (ex) {
        console.log(ex);
    }
}

function appendDetectUrl() {
    var passSimulateValue = $("#passSimulateValue").val();
    if(typeof passSimulateValue != "undefined" && passSimulateValue == "true") {
        return
    }

    var script = document.createElement("script");
    var url = $("#detectUrl").val();
    url = url + (new Date().getTime() + "-" + parseInt(Math.random() * 100000));
    url = url.replace("http://", window.location.protocol+"//");
    script.setAttribute("type", "text/javascript");
    script.setAttribute("src", url);
    script.setAttribute("id", "reloadJsId");
    var head = document.getElementsByTagName("head")[0];
    head.appendChild(script);
}

function pauseAll(id,response,callback,isWx) {
    try {
        var tipDiv = $(id);
        if(tipDiv.attr("isShow") == "true") {
            return;
        }

        tipDiv.find("#freezePageInfo").text(response.mes);
        tipDiv.attr("isShow", true);

        if(typeof isWx != "undefined" && isWx == true) {
            pauseAllVideoWx();
            pauseAllAudioWx();
        }else {
            pauseAllVideo();
            pauseAllAudio();
        }
    }catch (e) {
        console.log(e);
    }

    try {
        if(callback) {
            callback();
        }
    }catch (e) {
        console.log(e);
    }
}

function reloadAndSetNewJs(id) {
    try {
        clearInterval(myInterval);
        $(id).attr("isShow", false);

        var oldJs = document.getElementById("reloadJsId");
        if(oldJs) {
            oldJs.parentNode.removeChild(oldJs);
        }

        appendDetectUrl();
    } catch (e) {
        console.log(e);
    }
}