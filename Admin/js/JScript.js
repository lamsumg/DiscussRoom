
function showsubmenu(sid) {

    var menu = document.getElementById("submenu" + sid);

    if (menu.style.display == "none") {
        menu.style.display = "";
    }
    else {
        menu.style.display = "none";
    }
}

var rightwidth;
window.onload = function () {
    rightwidth = document.getElementById("right").style.width;
};


function switchBar(imgbtn) {
    var bar = document.getElementById("left");

    if (bar.style.display == "none") {
        bar.style.display = "";
        imgbtn.title = "关闭左栏";
        document.getElementById("right").style.width = rightwidth;
    }
    else {

        bar.style.display = "none";
        imgbtn.title = "打开左栏";
        document.getElementById("right").style.width = "100%";

    }
}