function popUp() {

  var number = document.getElementById('num').innerHTML;
  alert(number);
}

function addOne() {
  var number = document.getElementById('num').innerHTML;
  document.getElementById('num').innerHTML = "";
  document.getElementById('num').innerHTML = parseInt(number) + 1;
}

function addPara() {

  var para = document.createElement("p");
  var number = document.getElementById('num').innerHTML;
  var node = document.createTextNode(number);
  para.appendChild(node);

  var element = document.getElementById("bottom");
  element.appendChild(para);
}
