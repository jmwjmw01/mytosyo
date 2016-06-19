/* キャラクター、ページを読み込むたびにランダムで代わる */
var character = new Array("kuma.png", "usagi.png", "neko.png", "risu_waku.png", "kujira.png", "azarashi.png");
window.onload = function () {
    var $chara_img = document.getElementById( "chara_img" );
	var rand = Math.floor(Math.random() * 7);
	$chara_img.src = character[rand];
}