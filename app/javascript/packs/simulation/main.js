document.addEventListener('turbolinks:load', () => {
  //canvasに耳画像を描写する
  window.onload = ()=>{
    // canvas準備
    const board = document.querySelector("#ear-image");
    const ctx = board.getContext("2d");
  
    // 画像読み込み
    const earImage = new Image();
    earImage.src = "/ear_image_1920.jpg";  
    earImage.onload = () => {
      ctx.drawImage(earImage, 0, 0, 350, 450);
    };
  };

  //複製コード
  window.copy_image = function (clicked_id){
    //コピーする対象をelementに代入
    var element = document.getElementById(clicked_id);
    // コピー元のノードを取得
    var cloneElement = element.cloneNode(true);
    //複製したやつにlassを付け足す
    cloneElement.classList.add("drag-and-drop");
    //コピーした画像にidを一つずつ付与
    var head = "copy-image";
    for(var i=0; i<=cloneElement.length-1; i++){
      cloneElement.setAttribute("id", head+i);
    }

    // class add-drag-and-dropに追加
    addImage = document.getElementsByClassName("add-drag-and-drop");
    addImage[0].appendChild(cloneElement);
    //コピーした画像からonclick属性を削除
    cloneElement.removeAttribute("onclick");
    //コピーした画像からidを削除
    //cloneElement.removeAttribute("id");
  };  

  
  const move = new Moveable(document.body, {
    target: document.querySelector("#image-4"),
    draggable: true,
    resizable: true,
    keepRatio: true,
    rotatable: true
  });

  move.on("drag", ({ target, transform }) => {
    target.style.transform = transform;
  });
  
  move.on("resize", ({ target, width, height }) => {
    target.style.width = width + "px";
    target.style.height = height + "px";
  });
  
  move.on("rotate", ({ target, transform }) => {
    target.style.transform = transform
  });
  
  
});
