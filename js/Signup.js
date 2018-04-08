/**
 * 
 */
$(document).ready(function(){
		

	    $('#username').keyup(function(){
	    	$('.popover-content').load("SignupStatus.jsp",
	    			{str:$("#username").val()},
	    			$('#username').popover("show")
	    			);
	    			
	    	
	    }); 
	    $("#SubmitButton").click(function(){

	    		var ctr=0;
	    		$(".input-lg").each(function(){
	    			if($(this).val().length==0)
	    				{
	    					$(this).addClass("animated tada");
	    					$(this).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
	    						$(this).removeClass("animated tada");
	    					});
	    					ctr=1;
	    				}
	    		});
	    		if(!ctr)
	    				$(".form-horizontal").submit();
	    	});
	    
	    $('#username').popover({content:"<i></i>",html:true,trigger:"manual",placement:"right"});
});