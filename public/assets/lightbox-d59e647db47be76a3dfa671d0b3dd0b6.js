function showPopUpWindow(e){var t=null==e.width?700:e.width,n=null==e.height?320:e.height,_=null==e.content?"No data has been provided.":e.content,i=null==e.heading?"Azzist.com | Launchpad to Success":e.heading,o=null==e.showHeader?!0:e.showHeader,I=null==e.showCloseButton?!0:e.showCloseButton,d=null==e.divName?null:e.divName;currentDivName=d||null,$("#DIVID_LIGHT_BOX_LOADING_FADE").show(),$("#DIVID_LIGHT_BOX_CONTAINER_MAIN").show(),$("#DIVID_LIGHT_BOX_CLOSE_BUTTON").show(),xdoc=xDocSize(),page_width=xdoc.w,page_height=xdoc.h,$("#DIVID_LIGHT_BOX_LOADING_FADE").css("width",page_width),$("#DIVID_LIGHT_BOX_LOADING_FADE").css("height",page_height),top_val=300>n?(page_height-n)/2-20:n>500?30:70,top_val=70,left_val=(page_width-t)/2,$("#DIVID_LIGHT_BOX_CONTAINER_MAIN").css("top",top_val),$("#DIVID_LIGHT_BOX_CONTAINER_MAIN").css("left",left_val),$("#DIVID_LIGHT_BOX_CONTAINER_MAIN").css("z-index","99999"),$("#DIVID_LIGHT_BOX_CONTAINER_MAIN").css("overflow-y","hidden"),container_width=t-44-20,container_height=n-12-20,$("#DIVID_LIGHT_BOX_CONTAINER").css("width",container_width),frame_width=t-56,$("#DIVID_LIGHT_BOX_CONTAINER_TOP").css("width",frame_width),$("#DIVID_LIGHT_BOX_CONTAINER_TOP_1").css("width",frame_width),$("#DIVID_LIGHT_BOX_CONTAINER_TOP_2").css("width",frame_width),$("#DIVID_LIGHT_BOX_CONTAINER_BOTTOM").css("width",frame_width),$("#DIVID_LIGHT_BOX_CONTAINER_BOTTOM_1").css("width",frame_width),$("#DIVID_LIGHT_BOX_CONTAINER_BOTTOM_2").css("width",frame_width),frame_height=n-12,1==o?$("#DIVID_LIGHT_BOX_HEADER").show():$("#DIVID_LIGHT_BOX_HEADER").hide(),1==I?$("#BTN_LIGHT_BOX_CLOSE").show():$("#BTN_LIGHT_BOX_CLOSE").hide(),null!=i&&$("#DIVID_LIGHT_BOX_HEADING").text(i),$("#DIVID_LIGHT_BOX_CONTAINER").html(_),$("#DIVID_LIGHT_BOX_CONTAINER").css("background-color","#FFF"),initializeTypeaheads()}function hidePopUpWindow(){$("body").removeClass("noscroll"),$("#DIVID_LIGHT_BOX_LOADING_FADE").hide(),$("#DIVID_LIGHT_BOX_CONTAINER_MAIN").hide(),$("#DIVID_LIGHT_BOX_CONTAINER").html(""),$(".btn-load").button("reset"),currentDivName&&document.getElementById(currentDivName).scrollIntoView()}function closeLightBoxLoading(){hidePopUpWindow()}function showLightBoxLoading(){content=$("#DIVID_LIGHT_BOX_LOADING").html();var e={width:135,height:100,content:content,showHeader:!1,showCloseButton:!1,divName:null};scroll(0,0),$("#DIVID_LIGHT_BOX_CONTAINER_MAIN").css({height:"65px"}),showPopUpWindow(e)}function showPopUpContent(e,t,n,_){var _=""==_?null:_,i=!0;null==_&&(i=!1);var o=$("#"+n).html(),I={width:e,height:t,content:o,showCloseButton:!0,showHeader:i,heading:_};scroll(0,0),showPopUpWindow(I)}function showConfirmDialogForForms(message,waiting_text,method){if(0==$(".CHECK_ALL:checked").length)return displayGrowlMessages("error","Select atleast one entry.",""),!1;content=$("#DIV_CONFIRMATION_DIALOG_TEMPLATE").html(),newElement=$("<div/>",{id:"DIV_CONFIRMATION_DIALOG"}),newElement.append(content),$($(newElement.children()[2]).children()[0]).text(message),hiddenElement=$("<input/>",{type:"hidden",value:waiting_text,id:"DIV_CONFIRMATION_WAITING_TEXT"}),newElement.append(hiddenElement),hiddenElement=$("<input/>",{type:"hidden",value:method,id:"DIV_CONFIRMATION_POST_CONFIRM_METHOD_NAME"}),newElement.append(hiddenElement),$(newElement.children()[4]).unbind(),$(newElement.children()[4]).attr("id","DIV_YES_BUTTON"),$(newElement.children()[4]).attr("data-loading-text",waiting_text),$(newElement.children()[4]).attr("onclick","$('#DIV_YES_BUTTON').button('loading');"),newContent=newElement.html();var options={width:400,height:140,content:newContent,heading:"Confirmation required",showHeader:!0,showCloseButton:!0,divName:null};showPopUpWindow(options),$("#DIV_YES_BUTTON").click(function(e){post_confirm_method_name=$("#DIV_CONFIRMATION_POST_CONFIRM_METHOD_NAME").val(),$("#DIV_YES_BUTTON").attr("data-loading-text",waiting_text),$("#DIV_YES_BUTTON").button("loading"),eval(post_confirm_method_name+"()")})}function showConfirmDialog(e,t,n,_,i){content=$("#DIV_CONFIRMATION_DIALOG_TEMPLATE").html(),newElement=$("<div/>",{id:"DIV_CONFIRMATION_DIALOG"}),newElement.append(content),$($(newElement.children()[2]).children()[0]).text(e),hiddenElement=$("<input/>",{type:"hidden",value:_,id:"DIV_CONFIRMATION_URL"}),newElement.append(hiddenElement),hiddenElement=$("<input/>",{type:"hidden",value:t,id:"DIV_CONFIRMATION_WAITING_TEXT"}),newElement.append(hiddenElement),$(newElement.children()[4]).unbind(),$(newElement.children()[4]).attr("id","DIV_YES_BUTTON"),newContent=newElement.html();var o={width:400,height:140,content:newContent,heading:"Confirmation required",showHeader:!0,showCloseButton:!0,divName:null};showPopUpWindow(o),_=$("#DIV_CONFIRMATION_URL").val(),t=$("#DIV_CONFIRMATION_WAITING_TEXT").val(),$("#DIV_YES_BUTTON").attr("data-loading-text",t),$("#DIVID_LIGHT_BOX_CLOSE_BUTTON").hide(),$("#DIV_YES_BUTTON").click(1==n?function(){$(this).button("loading"),sendAjaxRequest(_,i)}:function(){$(this).button("loading"),window.location.href=_})}function xDocSize(){var e=document.body,t=document.documentElement,n=0,_=0,i=0,o=0,I=0,d=0,h=0,l=0;return t&&(n=t.scrollWidth,_=t.offsetWidth,I=t.scrollHeight,d=t.offsetHeight),e&&(i=e.scrollWidth,o=e.offsetWidth,h=e.scrollHeight,l=e.offsetHeight),{w:Math.max(n,_,i,o),h:Math.max(I,d,h,l)}}var currentDivName=null;