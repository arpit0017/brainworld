/**
 * 
 */

function ListOfSubjects(mode)
{
	$("#ListOfAllSubjects").load("ajax/GetSubjects.jsp",
			{
				Caller:"Subject",
				Mode:mode
			},function(){
		$(".SelectSubjectButtonForSubject").click(function(){
			var SubjectId=$(this).attr("data-id");
			
			$("#SubjectMod").load("ajax/GetSubjectDesc.jsp",{
				id:SubjectId
			},function(){
				$("#ListOfAllSubjects").animate({
					maxHeight:0
				},500,function(){
					$("#SubjectMod").show();
					$("#SubjectMod").animate({maxHeight:700},500);
				});
				$("#SubjectModPageSubmitButton").click(function(){
//					alert($("#SubjectId").val()+" "+$("#SubName").val());
					$.post("ajax/ModifySubject.jsp",{
						SubjectId:$("#SubjectId").val(),
						SubjectName:$("#SubName").val(),
					},function(){
//						alert("Done!");
						$("#SubjectMod").html("");
						$("#SubjectMod").animate({
							maxHeight:0
						},0,function(){$("#ListOfAllSubjects").animate({maxHeight:700},500)});
						
						ListOfSubjects("edit");
					});	
				});
				$("#SubjectModPageBackButton").click(function(){
					$("#SubjectMod").html("");
					$("#SubjectMod").animate({
						maxHeight:0
					},0,function(){$("#ListOfAllSubjects").animate({maxHeight:700},500)});
				});
				});
			});
		});
}

var ExamListTop=0;
function ListOfSubjectsForExamMod(mode)
{
	
	$("#ListOfAllSubjectsForExam").load("ajax/GetSubjects.jsp",
			{
				Caller:"Exam",
				Mode:mode
			},
			function()
			{
				
				$(".SelectSubjectButtonForExam").click(function(){
					var SubjectId=$(this).attr("data-id");
					$("#ListOfAllSubjectsForExam").animate({
						maxHeight:0
					},500,function(){
						$("#ListOfExams").animate({
							top:0,
							maxHeight:700
						},500,function(){
							$("#ListOfExams").load("ajax/GetExams.jsp",{Subject:SubjectId,Mode:"edit"},
									function(){
										$(".SelectExamButton").click(function(){
											var ExamId=$(this).attr("data-id");
											var SubjectId=$(this).attr("data-subjectid");
											$("#ListOfExams").animate({
												
												maxHeight:0
											},500);
											$("#ExamMod").animate({
												top:0,
												maxHeight:700
											},500);
											$("#ExamMod").load("ajax/GetExamModForm.jsp",
													{
														SubjectId:SubjectId,
														ExamId:ExamId
													},function(){
														$("#ExamModPageBackButton").click(function(){
															$("#ExamMod").animate({
																top:700,
																maxHeight:0
															},500,function(){$("#ExamMod").html(" ");});
															
															
															$("#ListOfExams").animate({
																maxHeight:700
															},500);
														});
														$("#ExamModPageSubmitButton").click(function(){
															
															$.post("ajax/ModifyExam.jsp",
															{
																SubjectId:$("#SubjectId").val(),
																ExamId:$("#ExamId").val(),
																ExamName:$("#ExamName").val(),
																ExamDesc:$("#ExamDesc").val(),
																MaxScore:$("#MaxScore").val(),
																PassScore:$("#PassScore").val()															
															},function(){
																$("#ExamMod").html(" ");
																$("#ExamMod").animate({
																	top:700,
																	maxHeight:0
																},500,function(){
																	$("#ListOfAllSubjectsForExam").animate({
																		top:0,
																		maxHeight:700
																	},500,function(){
																		ListOfSubjectsForExamMod("view");
																	});
																});
															});
																
																
																
															});
														});
													});
										$("#ExamViewPageBackButton").click(function(){
											
											$("#ListOfExams").animate({
												top:700,
												maxHeight:0
											},500);
											$("#ListOfAllSubjectsForExam").animate({
												top:0,
												maxHeight:700
											},500);
								
										});
										});
										
							});
						});
					});
				});
			
}
function ListOfSubjectsForQuestionMod()
{
	$("#ListOfAllSubjectsForQuestion").load("ajax/GetSubjects.jsp",
			{
				Mode:"view",
				Caller:"Question"
			},
			function(){
				$(".SelectSubjectButtonForQuestion").click(function(){
					var SubjectId=$(this).attr("data-id");
					$("#ListOfQuestions").load("ajax/GetQuestions.jsp",
							{
								Subject:SubjectId,
								Caller:"Question",
								Mode:"edit"
							},
							function(){
								$("#ListOfAllSubjectsForQuestion").animate({
									maxHeight:0
								},500);
								$("#ListOfQuestions").animate({
										top:0,
										maxHeight:700
									},500,function(){
										$(".SelectQuestionButtonForQuestion").click(function(){
											var QuestionId=$(this).attr("data-id");
											
											$("#QuestionMod").load("ajax/GetQuestionModForm.jsp",
													{
														Question:QuestionId,
														Subject:SubjectId
											        },function(){
											        	
											        	$("#ListOfQuestions").animate({
											        		top:0,
											        		maxHeight:0
											        	},500);
											        	$("#QuestionMod").animate({
											        			top:0,
											        			maxHeight:700
											        		},500,function(){
											        			//Question Data Loaded... Write More Code to proceed Further! :)
											        			var AddedOptions=0;
											        			var TotalOptions=Number($("#TotalOptions").attr("data-total"));
											        			$("#AddOptions").click(function(){
											        				
											        				$(".OptionsArea").append(
											        						"<div class=\"col-sm-6\">"+
											        						"<center><div class=\"radio\">" +
											        						"<label class=\"center-block\">"+
											        						"<input type=\"radio\" name=\"Options\" value=\""+(TotalOptions+AddedOptions)+"\">"+
											        						"<input type=\"text\" palceholder=\"Enter Option here\""+
											        						" class=\"input-lg\" id=\"Option"+(TotalOptions+AddedOptions)+"\">"+
											        						"</label></div></center></div>"
											        				);
											        				AddedOptions++;
											        				alert(AddedOptions);
											        			});
											        			$("#QuestionModPageSubmitButton").click(function(){
											        				//alert(AddedOptions);
											        				var QuesDesc=$("#QuesDesc").val();
											        				var Options=[];
											        				var QuestionId=$("#QuestionId").attr("data-id");
											        				var CorrectOption=$('input[type="radio"]:checked').val();
											        				alert(CorrectOption);
											        				var IsActive=$('input[type="checkbox"]:checked').val();
											        			    TotalOptions+=AddedOptions;
											        				var SubjectId=$("#SubjectId").attr("data-id");
											        				if(IsActive=="on")
											        					{
											        						IsActive=1;
											        					}
											        				else
											        					{
											        						IsActive=0;
											        					}
											        				var OptionsString="";
											        				//alert(AddedOptions);
											        				for(var i=0;i<TotalOptions;i++)
											        					{
											        						Options.push($("#Option"+i).val());
//											        						OptionsString+=(Options[i]+((i<TotalOptions-1)?" agla ":" "));
											        					}
//											        				alert(QuesDesc+"\n"+OptionsString+"\n"+CorrectOption);
											        				var info=[];
											        				info[0]="hi";
											        				info[1]="hello";
//											        				alert(IsActive);
											        				$.ajax({
											        					type:"POST",
											        					url:"ajax/ModifyQuestion.jsp",
											        					data:{Subject:SubjectId,
											        							QID:QuestionId,
											        							Question:QuesDesc,
											        							Correct:CorrectOption,
											        							IsActive:IsActive,
											        							"Options[]":Options}    					
											        							
											        				});
											        			});
											        			$("#QuestionModPageBackButton").click(function(){
											        				
											        				$("#QuestionMod").animate({
											        					top:700,
											        					maxHeight:0
											        				},500,function(){
											        					$("#QuestionMod").html(" ");
											        					});
											        				
										        					$("#ListOfQuestions").animate({
										        						top:0,
										        						maxHeight:700
										        					},500);
											        				
											        			});
											        			
											        		});
											        	
											        	
											        });
						
										});
										$("#QuestionsViewPageBackButton").click(function(){
											$("#ListOfQuestions").animate({
												top:700,
												maxHeight:0
											},1000);
											$("#ListOfAllSubjectsForQuestion").animate({
												maxHeight:700
											},1000);
										});
										
									});
								
							});
				});
					
				
			}
	);
}
$(document).ready(function(){
	var ctrMoveToTop = 0;
	  $(window).scroll(function() {
		  if( $('body').scrollTop() > 100  && !ctrMoveToTop)
		  {
			  $(".MoveToTop").show(500);
			  // ctrMoveToTop=1;
		  }
		  else if($('body').scrollTop() < 100)
		  {
			  $(".MoveToTop").hide(500);
			  ctrMoveToTop=0;
		  }
		});

	  $(".upbutton").click(function(){
			 $("body").animate({
				 scrollTop:0
			 },900,function(){
				 window.location.hash="#";
			}); 
		 });
	  
	$(".buttonCircle").click(function(){
		var Target=$(this).attr("data-target");
		$("html, body").animate({
			scrollTop:$(Target).offset().top
		},900,function(){
			window.location.hash=Target;
		});
	});

	// console.log("HERE");
	ListOfSubjects("edit");
	ListOfSubjectsForExamMod("view");
	ListOfSubjectsForQuestionMod();
		
});