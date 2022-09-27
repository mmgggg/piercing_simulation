document.addEventListener('turbolinks:load', () => {
  (function(){
    //要素の取得
    var elements = document.getElementsByClassName("drag-and-drop");

    //要素内のクリックされた位置を取得するグローバル（のような）変数
    var x;
    var y;
  
    //マウスが要素内で押されたとき、又はタッチされた際の関数
    for(var i = 0; i < elements.length; i++) {
        elements[i].addEventListener("mousedown", mdown, false);
        elements[i].addEventListener("touchstart", mdown, false);
    }
  
    //マウスが押された際の関数
    function mdown(e) {
  
      //クラス名に .drag を追加
      this.classList.add("drag");

      //タッチデイベントとマウスのイベントの差異を吸収
      if(e.type === "mousedown") {
          var event = e;
      } else {
          var event = e.changedTouches[0];
      }

      //要素内の相対座標を取得
      x = event.pageX - this.offsetLeft;
      y = event.pageY - this.offsetTop;

      //ムーブイベントにコールバック
      document.body.addEventListener("mousemove", move, false);
      document.body.addEventListener("touchmove", move, false);

    }
  
    //マウスカーソルが動いた際の関数
    function move(e) {
  
      //ドラッグしている要素を取得
      var drag = document.getElementsByClassName("drag")[0];

      //同様にマウスとタッチの差異を吸収
      if(e.type === "mousemove") {
          var event = e;
      } else {
          var event = e.changedTouches[0];
      }

      //フリックしたときに画面を動かさないようにデフォルト動作を抑制
      e.preventDefault();

      //マウスが動いた場所に要素を動かす
      drag.style.top = event.pageY - y + "px";
      drag.style.left = event.pageX - x + "px";

      //マウスボタンが離されたとき、またはカーソルが外れたとき発火
      drag.addEventListener("mouseup", mup, false);
      document.body.addEventListener("mouseleave", mup, false);
      drag.addEventListener("touchend", mup, false);
      document.body.addEventListener("touchleave", mup, false);

    }
  
    //マウスボタンが上がった際の関数
    function mup(e) {
        var drag = document.getElementsByClassName("drag")[0];
  
        //ムーブベントハンドラの消去
        document.body.removeEventListener("mousemove", move, false);
        drag.removeEventListener("mouseup", mup, false);
        document.body.removeEventListener("touchmove", move, false);
        drag.removeEventListener("touchend", mup, false);
  
        //クラス名 .drag も消す
        drag.classList.remove("drag");
    }
      
      //idが「addbutton」の要素を取得
      let addEar = document.getElementById("ear-image");
      
      //他のページではidがear-imageの要素が存在しないためnullになるので、nullにaddEventlistenerしない防止策
      if (!addEar){ return false;}

      //ボタンをクリックしたときに実行(イベントリスナー使用：ie9は以上で動作)
      addEar.addEventListener("click", function(){
      
      //idが「boxes」の要素を取得
      let ears = document.getElementById("ear-image");

      //「boxes」の要素の先頭にある子要素を複製（コピー）
      let clone = ears.firstElementChild.cloneNode(true);

      //「boxes」の要素の最後尾に複製した要素を追加
      ears.appendChild(clone); 
      });


  
  })()

  //複製コード
  var copyButton = document.getElementById("button");
  copyButton.addEventListener('click', function() {
    var element = document.getElementById("pierce");
    // ノードを取得
    var cloneElement = element.cloneNode(true);
    // class drag-and-dropに追加
    var addImage = document.getElementsByClassName("ear-image");
    addImage.document.createElement("div");
    addImage.classList.add("drag-and-drop");
    //addImage[0].appendChild(cloneElement);
  });

})