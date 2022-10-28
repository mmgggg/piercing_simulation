// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


//import "stylesheets/application"


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// //自作jsファイル読み込み用
// import "./simulation/main"

//tailwind設定読み込み用
// import '../../assets/stylesheets/application.css'

//bootstrap読み込み
import "bootstrap";
import "../stylesheets/application.scss";