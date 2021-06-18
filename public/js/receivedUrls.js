var copyTextPublicUrl = document.querySelector('publicUrl');
var copyTextAdminUrl = document.querySelector('adminUrl');

copyTextPublicUrl.addEventListener('click', function(event) {
    var copyTextElement = document.querySelector('publicUrl');
    copyText(copyTextElement);
});

copyTextPublicUrl.addEventListener('click', function(event) {
    var copyTextElement = document.querySelector('adminUrl');
    copyText(copyTextElement);
});

function copyText(copyTextElement) {
    alert('test');
    copyTextElement.focus();
    copyTextElement.select();
    
    try {
        var successful = document.execCommand('copy');
        var msg = successful ? 'successful' : 'unsuccessful';
        console.log('Copying text command was ' + msg);
    } catch (err) {
        console.log('Oops, unable to copy');
    }
}