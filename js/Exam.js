/**
 * 
 */

var Time={hr:1,min:0,sec:0};
var TimeInMS=Time.hr*60*60*1000 + Time.min*60*1000 + Time.sec*1000;
var index;
function Timer()
{
	Time.sec-=1;
	if(Time.sec<0)
		{
			Time.min-=1;
			Time.sec=59;
			if(Time.min<0)
				{
				Time.hr-=1;
				Time.min=59;
				}
		}
	$("#Timer").text("  "+
			((Time.hr>=10)?Time.hr:("0"+Time.hr)) +
			" : "+((Time.min>=10)?Time.min:("0"+Time.min)) +
					" : "+((Time.sec>=10)?Time.sec:("0"+Time.sec))    );
}

$(document).ready(function(){

	$("#Timer").text("  "+
			((Time.hr>=10)?Time.hr:("0"+Time.hr)) +
			" : "+((Time.min>=10)?Time.min:("0"+Time.min)) +
					" : "+((Time.sec>=10)?Time.sec:("0"+Time.sec))    );
	
	setTimeout(function(){
		alert("Now Submitting!");
		$("#ExamForm").submit();
	},TimeInMS);
	setInterval(Timer,1000);
	
	var MaxQues=$("#MaxQues").val();
	for(var a=2;a<=Number(MaxQues)+1;a++)
		{
			$("#Question"+a).hide(0);
		}
	
	$("#Button1").addClass("bg-grayscale");
	
	$(".RadioButton").click(function(){
		var QuestionNumber=$(this).attr("name");

		var NextQuestionNumber=Number(QuestionNumber)+1;		
		$("#Question"+QuestionNumber).hide(500,function(){
			$("#Question"+NextQuestionNumber).show(500);
		});
		
		$("#Button"+QuestionNumber).removeClass("bg-grayscale");
		$("#Button"+NextQuestionNumber).addClass("bg-grayscale");
		if(!$("#Button"+QuestionNumber).hasClass("btn-success"))
			{
			
				$("#Button"+QuestionNumber).addClass("btn-success");
			}
			
			
	});
	
	$(".Button").click(function(){
		var QuestionNumber=$(this).attr("id").substr(6);
		
		$(".Button").removeClass("bg-grayscale");
		$(this).addClass("bg-grayscale");
		$(".QuestionDiv").hide(200,function(){
			$("#Question"+QuestionNumber).show(200);
		});
		
	});
	
	$(".Flag").click(function(){
		var QuestionNumber=$(this).attr("name");
		
		$("#Button"+QuestionNumber).toggleClass("btn-warning");
		$(this).toggleClass("text-warning");	
			
	});
	
	$(".Next").click(function(){
		var QuestionNumber=$(this).attr("name");
		$("#Button"+QuestionNumber).removeClass("bg-grayscale");
		$("#Question"+QuestionNumber).hide(500);
		
		$("#Button"+(Number(QuestionNumber)+1)).addClass("bg-grayscale");
		$("#Question"+(Number(QuestionNumber)+1)).show(500);
	});
	
	$(".Previous").click(function(){
		var QuestionNumber=$(this).attr("name");
		if(Number(QuestionNumber)==1)
			{
			return;
			}
		$("#Button"+QuestionNumber).removeClass("bg-grayscale");
		$("#Button"+(Number(QuestionNumber)-1)).addClass("bg-grayscale");
		$("#Question"+QuestionNumber).hide(500);
		$("#Question"+(Number(QuestionNumber)-1)).show(500);
	});
});