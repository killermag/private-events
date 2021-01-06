var subs = document.querySelector('#subtitles');

if (subs.innerHTML.length > 28) {
    subs.innerHTML = subs.innerHTML.slice(0,28) 
}
