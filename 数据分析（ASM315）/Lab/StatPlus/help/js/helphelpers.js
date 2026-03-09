function detectIE() {
    var ua = window.navigator.userAgent;

    var msie = ua.indexOf('MSIE ');
    if (msie > 0) {
        // IE 10 or older => return version number
        return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
    }

    var trident = ua.indexOf('Trident/');
    if (trident > 0) {
        // IE 11 => return version number
        var rv = ua.indexOf('rv:');
        return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
    }
    return false;
}

$(function () {
    $('#sidebar-menu li ul').slideUp();
    $('#sidebar-menu li').removeClass('active');
    $('#sidebar-menu li').on('click', function() {
        var link = $('a', this).attr('href');
        if(link) { 
            window.location.href = link;
        } else {
            if ($(this).is('.active')) {
                $(this).removeClass('active');
                $('ul', this).slideUp();
            } else {
                $('#sidebar-menu li').removeClass('active');
                $('#sidebar-menu li ul').slideUp();
                $(this).addClass('active');
                $('ul', this).slideDown();
            }
        }
    });

    $('#menu_toggle').click(function () {
        if ($('body').hasClass('nav-md')) {
            $('body').removeClass('nav-md').addClass('nav-sm');
            $('.left_col').removeClass('scroll-view').removeAttr('style');
            $('.sidebar-footer').hide();
            sidebarPosition();
            if ($('#sidebar-menu li').hasClass('active')) {
                $('#sidebar-menu li.active').addClass('active-sm').removeClass('active');
            }
        } else {
            $('body').removeClass('nav-sm').addClass('nav-md');
            $('.sidebar-footer').show();
            sidebarPosition();
            if ($('#sidebar-menu li').hasClass('active-sm')) {
                $('#sidebar-menu li.active-sm').addClass('active').removeClass('active-sm');
            }
        }
    });
});

$(function () {
    var url = window.location;
    $('#sidebar-menu a[href="' + url + '"]').parent('li').addClass('current-page');
    $('#sidebar-menu a').filter(function () {
        return this.href == url;
    }).first().parent('li').addClass('current-page').parent('ul').slideDown().parent().addClass('active');
	if (detectIE())
	$('#feedbackbtn').attr("target","_blank");
});

$(".right_col").css("min-height", $(window).height());
$(window).resize(function () {
    $(".right_col").css("min-height", $(window).height());
});

$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})


$(function () {
    $(".expand").on("click", function () {
        $(this).next().slideToggle(200);
        $expand = $(this).find(">:first-child");

        if ($expand.text() == "+") {
            $expand.text("-");
        } else {
            $expand.text("+");
        }
    });
});

function sidebarPosition(){

    var $sidebar   = $(".right_col"), 
        $window    = $(window),
        offset     = $('.left_col').height(),
        marginConst = 250;
     if ($('body').hasClass('nav-sm'))   marginConst = 70;
        //$('.left_col:hidden')
    if (($window.scrollTop() > offset) && ! ($('body').hasClass('nav-sm'))) {
        $sidebar.css('margin-left',0+'px');
            //$sidebar.stop().animate({marginLeft: 0});
        } else {
            if (($('.left_col:visible').length > 0)) 
            //$sidebar.stop().animate({marginLeft: marginConst});
                $sidebar.css('margin-left',marginConst+'px');
            else
                $sidebar.css('margin-left',0+'px');
            //$sidebar.stop().animate({marginLeft: 0}, {delay:0});
        }
}


$(function(){
    setTimeout(function(){sidebarPosition();}, 100);
})

$(window).scroll(function(){
    sidebarPosition();
});

$(window).resize(function(){
    sidebarPosition();
});


$(function(){
    if (document.location.protocol.includes("http"))
    setTimeout(function(){
    $(".nav.toggle").after('<ul class="nav navbar-nav navbar-left navdwnld"><li class=""><a href="https://apps.apple.com/us/app/statplus/id1436477809?ls=1" target="_blank" class="nav-appstore-btn"><img class="img-responsive img-filterblue imgdm" src="http://www.analystsoft.com/img/appstore_ipad.png" alt="StatPlus for iPad on AppStore" height="27" width="81"></a></li><li class="btn-md"><a href="https://www.analystsoft.com/en/products/statplusmac/"  target="_blank"><span class="fa fa-apple"></span> Mac</a></li><li class="btn-md"><a href="https://www.analystsoft.com/en/products/statplus/" target="_blank"><span class="fa fa-windows"></span> Win</a></li></ul>');
    }, 100);
})

