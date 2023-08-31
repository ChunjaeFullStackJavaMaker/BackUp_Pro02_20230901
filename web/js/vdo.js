/*버튼 선택자 */
var video = document.getElementById("video");
var play = document.getElementById("play");
var pause = document.getElementById("pause");
var stop = document.getElementById("stop");
var vol = document.getElementById("vol");
var progress = document.getElementById("progress");
var progressBar = document.getElementById("progressBar");
var timeCurrent = document.getElementById("currentTime");
var volTxt = document.getElementById("volTxt");
var full = document.getElementById("full");
var original = document.getElementById("original");

// 비디오 로딩
video.load();
//비디오의 볼륨값 초기화
video.volume = 1

//동영상 재생시간 초기화
var total, totalmin, totalsec, totalTime;
video.addEventListener('loadedmetadata', function (){
    total = video.duration;
    totalmin = Math.floor(total/60);
    totalsec = Math.floor(total-(totalmin-60));
    if (totalmin < 10 ){ totalmin = "0"+totalmin;}
    if (totalsec < 10) { totalsec = "0"+totalsec;}
    totalTime = totalmin +":"+totalsec;
    timeCurrent.innerHTML = "00:00 / "+totalTime;
});

//재생함수 호출
play.addEventListener("click", function (){ playPause();});
//일시정지 함수 호출
pause.addEventListener("click",function (){ playPause();});
//재생 일시정지 함수
function playPause () {
    if (video.paused) {
        alert("hi1");
        video.play();
        play.style.display = "none";
        pause.style.display = "inline-block";
    } else {
        alert("hi2");
        video.pause();
        play.style.display="inline-block";
        pause.style.display="none";
    }
}
//정지함수 호출
stop.addEventListener("click",function (){stopPlayer();});
//정지 함수
function stopPlayer(){
    if(video.pause) {
        video.pause();
        video.currentTime = 0;
        play.style.display="inline-block";
        pause.style.display="none";
    }
}
//볼륨 조절바 기능 정의 및 호출
vol.addEventListener("change", function(){
    video.volume = this.value/1000;
    volTxt.innerText = parseInt(video.volume*100)+"%";
});

//동영상 크기제어 처리부
full.addEventListener("click",function (){ fullScreen();});
// 동영상 크기제어 함수
function fullScreen () { //전체화면 만들기
    if (video.requestFullscreen) { video.requestFullscreen(); }
    else if (video.mozRequestFullScreen) { video.mozRequestFullScreen(); }
    else if (video.webkitRequestFullscreen) { video.webkitRequestFullscreen(); }
    else if (video.msRequestFullscreen) { video.msRequestFullscreen(); }
}

//재생시간 표시 처리부
playTime(); //재생시간 표시 함수
progressPlayer(); //프로그레스바 늘리기 함수
var current, currentmin, currentsec, currentTime;
function playTime () {
    video.addEventListener("timeupdate", function (){
        if (video.duration == video.currentTime) {
            play.style.display == "inline-block"; pause.style.display ="none";
        }
        current = video.currentTime;
        currentmin = Math.floor(current/60);
        currentsec = Math.floor(current -(currentmin*60));
        if(currentmin < 10) { currentmin = "0"+currentmin;}
        if(currentsec < 10) { currentsec = "0" + currentsec;}
        currentTime = currentmin+":"+currentsec;

        total = video.duration;
        totalmin = Math.floor(total/60);
        totalsec = Math.floor(total -(totalmin*60));
        if(totalmin < 10) { totalmin = "0"+totalmin;}
        if(totalsec < 10) { totalsec = "0" + totalsec;}
        totalTime = totalmin+":"+totalsec;

        timeCurrent.innerHTML = currentTime + " / " + totalTime;
    });

    //프로그레스바
    function progressPlayer() {
        video.addEventListener("timeupdate", function () {
            var max = Math.floor(video.duration);
            var current = Math.floor(video.currentTime);
            var percent = 100 * (current / max);
            progressBar.style.width = percent + "%";
        });
    }

    //프로그래스바 seek
    function seek (event) {
        var seekTotal = parseInt(progress.style.width);
        var seekX = event.offsetX;
        var seekPercent = 100 * (seekX / seekTotal);
        progressBar.style.width = seekPercent + "%";
        var seekMove = (seekPercent / 100) * Math.floor(video.duration);
        video.currentTime = seekMove;
    }

    /* 파이어폭스 이벤트 크로스브라우징코드 */
    if (navigator.userAgent.indexOf("Firefox") >= 0) {
        var eventNames = ["mousedown", "mouseover", "mouseout", "mousemove", "mousedrag", "click", "dbclick", "keydown", "keypress", "keyup"];
        for (var i = 0; i <eventNames.length; i++) {
            window.addEventListener(eventNames[i], function (e) {
                window.event = e;
            }, true);
        }
    }

    progress.addEventListener("click", function () {
        seek(event);
    });//seek
}
