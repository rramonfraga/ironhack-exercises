var caesarCipher = (function(){
  var shiftNumber = 3;
  var my_public_object = {};

  my_public_object.crypt = function(message) {
    return caesars(message, -shiftNumber);
  }

  my_public_object.decrypt = function(message) {
    return caesars(message, shiftNumber);
  }

  function caesars(message, shift) {
    var ciphered = "";

    ciphered = message.split('').map(function(arg){
      ciphered = arg;

      if((arg >= "A" && arg <= "Z") || (arg >= "a" && arg <= "z")) {
        original = arg.charCodeAt(0);
        c = arg.charCodeAt(0) + parseInt(shift);

        if(original >= 65 && original <= 90) {
          if(c > 90) {
            c = c - 26;
          } else if(c < 65) {
            c = c + 26;
          }
        } else if(original >= 97 && original <= 122) {
          if(c > 122) {
            c = c - 26;
          } else if(c < 97) {
            c = c + 26;
          }
        }

        ciphered = String.fromCharCode(c);
      }

      return ciphered;
    });

    return ciphered.join('');
  }
  
  return my_public_object;
})();


var myApp = caesarCipher;
console.log(myApp.crypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ'));
console.log(myApp.decrypt('XYZABCDEFGHIJKLMNOPQRSTUVW'));
console.log(myApp.crypt('abcdefghijklmnopqrstuvwxyz'));
console.log(myApp.decrypt('xyzabcdefghijklmnopqrstuvw'));
