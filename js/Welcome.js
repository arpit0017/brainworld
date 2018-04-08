/**
 * 
 */
$(document).ready(function(){
	$(".bg-Monkey h2").typed({
        strings: ["BrainWorld, your most productive distraction.", "Over 20 tests", "Across 10 diffrent Languages","Test your knowledge.","Gain a recognition!"],
        typeSpeed: 1	,
        loop : true,
        showCursor:false,
        backDelay:750
      });
	$(".btn-AboutUs, .btn-ContactUs").click(function(){
		$("body").animate({
			scrollTop : $("#AboutUs").offset().top
		},900,function(){
			window.location.hash="#AboutUs";
		});
	});
});