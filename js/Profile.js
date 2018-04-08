/**
 * 
 */
function LoadDomains(St,Dt)
{
	$(".loadDomains").load("DomainMod.jsp",
			{
				State:St,		//Load
				data:Dt,
			});
}

$(document).ready(
	function(){
//		$(".loadDomains").load("DomainMod.jsp",
//				{
//					State:"0",		//Load
//					data:"null",
//				},
//		function(){
//			$(".domainBox").click(function(){
//				var valueOfChecked=$(this).attr("data-SubId");
//				$("#checkbox"+valueOfChecked).hide(500);
//				$(".loadDomains").load("DomainMod.jsp",
//						{
//							State:"1",		//Add
//							data:""+valueOfChecked+"",
//						});
//
//		});
//	});
		$(".save-icon").click(function(){
			$("#profile-mod").submit();
		});
		LoadDomains("0","null");
		var iconElement = document.getElementsByClassName('save-icon');
		var options = {
		    from: 'fa-bars',
		    to: 'fa-arrow-right',
		    animation: 'rubberBand'
		};

		iconate(iconElement, options);
		
//		$(".save-icon").click(iconate($(this),{from:'glyphicon-floppy-save-icon',to:'glyphicon-arrow-up',animate:'rubberBand'}));
		$('.my-tooltip').tooltipster({
			   animation: 'fade',
			   delay: 200,
			   theme: 'tooltipster-punk',
			   trigger: 'hover'
			});
});
