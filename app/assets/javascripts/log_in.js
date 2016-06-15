/* ドアのキャラクター、オンマウスするたびにランダムで代わる */
var chara_door = new Array("/assets/door_kuma-b9916494a7b568e6b223243dcd7ce799b9734bd6d31a07fd336cb0ecc0afd605.png",
                           "/assets/door_risu-84acc3ea6697aad7fda4b79dd9ef08fd0e4fbccae6835dd883660d3279e97caa.png", 
                           "/assets/door_neko-b7aa365bafef5fb89e75c44013891c7b98306e77b413ccbb146affb377ceec79.png",
                           "/assets/door_risu-84acc3ea6697aad7fda4b79dd9ef08fd0e4fbccae6835dd883660d3279e97caa.png");
window.onload = function () {
    var $door_img = document.getElementById( "door_img" );
    $door_img.src = "/assets/door-749d15c15c0b1ce8c5ec1e2fdc00cb11eb08e15d1b2d5ee33ef46a9f365ff7c2.png";
    $door_img.onmouseover = function(){
		var rand = Math.floor(Math.random() * 5);
        this.src = chara_door[rand];
    };
    $door_img.onmouseout = function(){
        this.src = "/assets/door-749d15c15c0b1ce8c5ec1e2fdc00cb11eb08e15d1b2d5ee33ef46a9f365ff7c2.png";
    };
}

