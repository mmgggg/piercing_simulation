document.addEventListener('turbolinks:load', () => {
  
  //画像の保存  
  // var btn = document.getElementById("download-btn");
  // btn.addEventListener("click",() => {
  //   html2canvas(document.querySelector(".ear-image")).then(canvas => { 
  //     let downloadEle = document.createElement("a");
  //     downloadEle.href = canvas.toDataURL("image/png");
  //     downloadEle.download = "piercing_simulation.png";
  //     downloadEle.click();
  //   });
  // });

  // window.downloadImg = function(clicked_id){
  //   //alert(clicked_id);
  //   const url = './imgs/img.jpg';
  //   const fileName = 'piercing_simulation.jpg';
  //   let link = document.querySelector(`#${clicked_id}`)
  //   link.href= url;
  //   link.download = fileName;
  // };  

  var btn = document.querySelector(".download-button");
  btn.addEventListener("click",() => {
    alert("準備中");

  })

});
