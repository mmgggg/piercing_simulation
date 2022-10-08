document.addEventListener('turbolinks:load', () => {

  //複製コード
  window.copy_image = function (clicked_id){
    //コピーする対象をelementに代入
    var element = document.getElementById(clicked_id);
    // コピー元のノードを取得
    var cloneElement = element.cloneNode(true);
    //複製したやつにlassを付け足す
    cloneElement.classList.add("drag-and-drop");
    // class add-drag-and-dropに追加
    addImage = document.getElementsByClassName("add-drag-and-drop");
    addImage[0].appendChild(cloneElement);
  };
  
  alert("Hi");
  
  
  const move = new Moveable(document.body, {
    target: document.querySelector(".pi4"),
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


// 成功複製コード
//  複製コード
//   var copyButton = document.getElementById("button-1");
//   copyButton.addEventListener('click', function() {
//     //コピーする対象をelementに代入
//     var element = document.getElementById("image-1");
//     // コピー元のノードを取得
//     var cloneElement = element.cloneNode(true);
//     //複製したやつにlassを付け足す
//     cloneElement.classList.add("drag-and-drop");
//     // class add-drag-and-dropに追加
//     addImage = document.getElementsByClassName("add-drag-and-drop");
//     addImage[0].appendChild(cloneElement);
//   });
  