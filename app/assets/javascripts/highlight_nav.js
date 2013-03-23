/*** highlight the navgiation bar when come to the current page. ***/
 
var nav = document.getElementById("nav");
var links = document.getElementsByTagName("li");
var lilen = document.getElementsByTagName("a");
var currenturl = document.location.href;
var last = 0;
for (var i=0; i<links.length; i++)
{
  var linkurl = lilen[i].getAttribute("href");
  if(currenturl.indexOf(linkurl)!=-1)
  {
      last = i-1;
  }
}
links[last].className = "current";

$(function()
{
    $('.home index') .css({'height': (($(window).height()) - 361)+'px'});

    $(window).resize(function(){
        $('.home index') .css({'height': (($(window).height()) - 361)+'px'});
        // alert('resized');
    });
});
