/**
 * 
 */
$(function(){
	$(".test-info").click(function(){
		$(".test-tron").toggleClass("test-tron-active");
	});
	$(".Go").click(function (){
		var GetPrimKey=$(this).attr("data-id");
		$("#GoValue").val(GetPrimKey);
		$("GoForm").submit();
	});
	
//	setTimeout(function(){
//		$(".PositionLeftOut").removeClass("PositionLeftOut");
//		$("#CareToRead").addClass("trans col-md-2",1000);
//		$("#NewsFlash").addClass("trans col-md-2",1000);
//		$("#YourDomains").addClass("trans col-md-8",1000);
//	},500);
	
	setTimeout(function(){
		$(".VisibleAfterSomeTime").show(800);
	},500);
	
	$('.my-tooltip').tooltipster({
		   animation: 'fade',
		   delay: 200,
		   theme: 'tooltipster-punk',
		   trigger: 'hover'
		});
	$("#lets-see").typed({
        strings: ["Let's see what have you got..!"],
        typeSpeed: 100,
        loop : false,
        showCursor:true,
        startDelay:1000,
        backDelay:750
      });
	
});