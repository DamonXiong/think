(function(){
    window.offsetX = $("#loveHeart").width() / 2;
    window.offsetY = $("#loveHeart").height() / 2 - 55;
    var together = new Date();
    together.setFullYear(2016, 4, 10);
    together.setHours(20);
    together.setMinutes(0);
    together.setSeconds(0);
    together.setMilliseconds(0);
    // $('#background')[0].play();

    if (!document.createElement('canvas').getContext) {
    	var msg = document.createElement("div");
    	msg.id = "errorMsg";
    	msg.innerHTML = "Your browser doesn't support HTML5!<br/>Recommend use Chrome 14+/IE 9+/Firefox 7+/Safari 4+";
    	document.body.appendChild(msg);
    	$("#code").css("display", "none")
    	$("#copyright").css("position", "absolute");
    	$("#copyright").css("bottom", "10px");
    	document.execCommand("stop");
    } else {
    	setTimeout(function () {
    		startHeartAnimation();
    	}, 5000);

    	timeElapse(together);
    	setInterval(function () {
    		timeElapse(together);
    	}, 500);

    	adjustCodePosition();
    	$("#code").typewriter();
    }
})();
