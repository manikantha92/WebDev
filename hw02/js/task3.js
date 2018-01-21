function beerFn() {

  var loremElement = document.getElementById('rightCol');
  loremElement.innerHTML = "";


  for (bb = 99; bb > 95; bb--) {
    {
      var beerText1 =
        bb + " bottles of beer on the wall, " + bb +
        " bottles of beer. Take one down, pass it around, " +
        (bb - 1) + " bottles of beer on the wall...";
      var beerPara = document.createElement("p");
      beerPara.appendChild(document.createTextNode(beerText1));
      loremElement.appendChild(beerPara);
    }
  }
}


function firstFn() {

  var loremElement = document.getElementById('rightCol');
  loremElement.innerHTML = "";
  var loremp1 =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed varius a enim id maximus. Duis mi erat, ultrices a massa non, pretium egestas quam. Nulla interdum scelerisque diam, nec pretium velit pulvinar eu. Quisque egestas quam et imperdiet lobortis. Curabitur et turpis quam. Fusce enim eros, scelerisque a dictum sit amet, euismod non diam. Maecenas non elit eget sapien euismod scelerisque. Nunc ut ornare quam. Etiam laoreet risus vitae laoreet egestas. Aliquam erat volutpat. Nulla lobortis, metus eget mattis varius, mauris tortor ultricies lectus, sed vestibulum nulla est ultricies lectus..";

  var loremp2 =
    "Donec erat odio, tempor sit amet molestie ut, porta id nibh. Aliquam mattis maximus rutrum. Vestibulum eu lobortis enim. Cras feugiat imperdiet turpis quis scelerisque. Integer blandit nibh at nibh commodo mollis. Sed faucibus velit eget ex faucibus condimentum. Morbi sit amet turpis ex. Nunc commodo, neque vel molestie scelerisque, metus nisl rhoncus nisi, ut feugiat nibh nisi nec sapien. Curabitur euismod a dolor et egestas. Maecenas ac massa a metus imperdiet vehicula. Vestibulum semper congue quam, id sollicitudin enim commodo et. Vestibulum semper congue enim, nec ullamcorper dolor cursus ut. Phasellus et molestie lorem.";

  var loremp3 =
    "Etiam aliquam quis dolor nec imperdiet. Donec eget porta arcu, quis tempor nibh. Fusce consectetur lectus non condimentum blandit. Integer vitae finibus nisl. Proin a scelerisque diam, et ullamcorper magna. Morbi non leo aliquam, laoreet nisi vel, condimentum enim. Nulla facilisi. Nunc vitae mattis est. Nulla tempus leo vel porttitor maximus. Maecenas iaculis leo nec urna dapibus, nec lobortis nisl consequat. Vestibulum luctus enim in viverra rhoncus. Aliquam malesuada nisl lacus.";

  var loremp4 =
    "Vestibulum at libero at ex sagittis porta. Quisque nisi leo, condimentum nec eros sed, finibus malesuada eros. Donec eu dignissim lorem. In auctor pharetra augue in ullamcorper. Nam ultricies dictum quam, eu commodo justo pellentesque eget. Donec ut ipsum risus. Cras sagittis dapibus dolor. Quisque viverra diam magna, eu malesuada sem feugiat sed. Etiam pulvinar tellus eu tellus malesuada efficitur. Morbi quis nibh vitae libero maximus molestie eget et est. Nullam eget sagittis nisl.";

  var p1 = document.createElement("p");
  var p1Text = document.createTextNode(loremp1);
  p1.appendChild(p1Text);
  loremElement.appendChild(p1);

  var p2 = document.createElement("p");
  var p2Text = document.createTextNode(loremp2);
  p2.appendChild(p2Text);
  loremElement.appendChild(p2);

  var p3 = document.createElement("p");
  var p3Text = document.createTextNode(loremp3);
  p3.appendChild(p3Text);
  loremElement.appendChild(p3);

  var p4 = document.createElement("p");
  var p4Text = document.createTextNode(loremp4);
  p4.appendChild(p4Text);
  loremElement.appendChild(p4);


}

function lastThing() {
  loremElement = document.getElementById('rightCol');
  loremElement.innerHTML = "";
  var para = document.createElement("p");
  para.appendChild(document.createTextNode("This is the last thing."));
  loremElement.appendChild(para);
}
