$('document').ready(function() {
    var copyTextBtn = document.querySelector('.publicurlbtn');


    copyTextBtn.addEventListener('click', function(event) {
        var copyText = document.querySelector('.publicurltext');
        copyText.focus();
        copyText.select();
        try {
            var successful = document.execCommand('copy');
            var msg = successful ? 'successful' : 'unsuccessful';
            console.log('Copying text command was ' + msg);
          } catch (err) {
            console.log('Oops, unable to copy');
          }
    });
});