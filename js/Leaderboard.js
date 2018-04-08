/**
 * 
 */

function FilterCheck(f,c,v)
{
	if(f=="all"||c==""||v=="")
		{
			return 0;
		}
	return 1;
}
$(document).ready(function(){
	var FilterStatement="";
	
	$(".LoadAjax").load("ajax/GetLeaderBoard.jsp",{
		Element:"test_date",
		Type:"desc",
		Filter:FilterStatement
	});
	
	$(".table-Lead th span").click(function(){
		
				var GetElement=$(this).attr("data-name");
				var GetType=$(this).attr("data-type");
				//alert(GetElement+" "+GetType);
				$(".table-Lead th span").css({
					"opacity":"0.5"
				});
				$(this).css({
					"opacity":"1"
				});
//				var Field=$("#FieldFilter").val();
//				var Condition=$("#ConditionFilter").val();
//				var Value=$("#ValueFilter").val();
//				var FilterStatement=(FilterCheck(Field,Condition,Value)==1)?("and "+Field+" "+Condition+" \""+Value+"\" "):"1=1";
				//alert(FilterStatement);
				$(".LoadAjax").load("ajax/GetLeaderBoard.jsp",{
					Element:GetElement,
					Type:GetType,
					Filter:FilterStatement
				});
		
	});
	var i=0;
	$("#AddFilter").click(function(){
		i++;
		$(".modal-body").append("<div class=\"col-sm-12 FilterMode\">"+
			  "<div class=\"col-sm-4\">"+
				"<select class=\"center-block\" id=\"FieldFilter"+i+"\">"+
					"<option value=\"all\" selected>*</option>"+
					"<option value=\"username\">Username</option>"+
					"<option value=\"sub_desc\">Subject</option>"+
					"<option value=\"test_desc\">Test</option>"+
					"<option value=\"test_date\">Date</option>"+
					"<option value=\"total_marks\">Max Score</option>"+
					"<option value=\"score\">Score</option>"+
					"<option value=\"grade\">Grade</option>"+
				"</select>"+
			  "</div>"+
			  "<div class=\"col-sm-4\">"+	
				"<select class=\"center-block\" id=\"ConditionFilter"+i+"\">"+
					"<option value=\"all\" selected>*</option>"+
					"<option value=\"<\">&lt;</option>"+
					"<option value=\">\"> &gt; </option>"+
					"<option value=\"=\">=</option>"+
				"</select>"+
			  "</div>"+
			  "<div class=\"col-sm-4\">"+
				"<input type=\"text\" placeholder=\"Enter Field Value\" class=\"center-block\" id=\"ValueFilter"+i+"\">"+
			  "</div>"+
			"</div>");
	});
	$("#ApplyFilter").click(function(){
		//alert("CLicked");
		var Field;
		var Condition;
		var Value;
		FilterStatement="";
//		console.log("here");
		for(var j=1;j<=i;j++)
			{
				Field=$("#FieldFilter"+j).val();
				Condition=$("#ConditionFilter"+j).val();
				Value=$("#ValueFilter"+j).val();
				FilterStatement+=" and "+Field+" "+Condition+" \""+Value+"\" ";
//				console.log(j);
			}
		
		alert(FilterStatement);
		
		$(".LoadAjax").load("ajax/GetLeaderBoard.jsp",{
			Element:"test_date",
			Type:"desc",
			Filter:FilterStatement
		});
	});
	$('.my-tooltip').tooltipster({
		   animation: 'fade',
		   delay: 200,
		   theme: 'tooltipster-punk',
		   trigger: 'hover'
		});
});