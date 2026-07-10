
(function (doc, win) {
    var docEl = doc.querySelector('html'),
    recalc = function () {
        var clientWidth = docEl.clientWidth;
        // if (!clientWidth) return;
        // if(clientWidth>=750){
            // docEl.style.fontSize = '100px';
        // }else{
        // }
        
        // 因老年机调整
        docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
    };
    win.addEventListener('resize', recalc, false);
    doc.addEventListener('load', recalc, false);
    recalc();
})(document, window);