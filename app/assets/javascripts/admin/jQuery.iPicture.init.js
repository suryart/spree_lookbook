/*
 * jQuery UI iPicture² 1.0.0
 *
 * Copyright 2011 D'Alia Sara
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 *
 * Depends:
 *	jquery.ui.core.js
 *	jquery.ui.widget.js
 *	jquery.ui.position.js
 *	jquery.ui.draggable.js
 *	jquery.ui.droppable.js
 *  jquery.ui.effects.core.js
 */
 
 (function( $ ) {

  $.widget( "justmybit.iPictureInit", {
	options: {
		animationBg: "bgblack",
		animationType:"ltr-slide",
		button: "moreblack" ,
		roundBg: "roundBgW"
	},

	// Set up the widget
	_create: function() {
		var self = this;
		var o = self.options;
        //each picture
		$('.ip_slide').each(function( index, value ) {
			var picture = $(this).find('.ip_tooltipImg');
				// list of buttons to change tooltip color
				var listContainer = $('<div class="listContainer"></div>').insertAfter(picture);
				var dragButton = $('<p class="drag-button '+o.button+'" title="drag in the picture"></p>')
					// Create a new tooltip
					.draggable({
					helper:'clone',
					containment: picture
//					stop: function(event, ui){
//						$('<p class="top">'+ui.position.top+'</p><p class="left">'+ui.position.left+'</p>').insertAfter(picture);
//					}
					})
					.appendTo(listContainer);

				var lists = $('<div class="bgList" title="choose another background for tooltips"></div><div class="buttonsList" title="choose another color for tooltips"></div>').appendTo(listContainer);
				var buttonsDropp = $('<div class="buttonsDropp"></div>').insertAfter(listContainer);
				$('<ul class="inline buttons">'
					+'<li id="moregold" class="moregold"></li>'
				    +'<li id="moregrey" class="moregrey"></li>'
					+'<li id="moreblack" class="moreblack"></li>'
					+'<li id="moredarkblue" class="moredarkblue"></li>'
					+'<li id="moreblue" class="moreblue"></li>'
					+'<li id="morelightblue" class="morelightblue"></li>'
					+'<li id="morelightblue2" class="morelightblue2"></li>'
					+'<li id="morewatergreen" class="morewatergreen"></li>'
					+'<li id="morelightgreen" class="morelightgreen"></li>'
					+'<li id="moregreen" class="moregreen"></li>'
					+'<li id="moreyellow" class="moreyellow"></li>'
					+'<li id="moreorange" class="moreorange"></li>'
					+'<li id="morered" class="morered"></li>'
					+'<li id="morepurple" class="morepurple"></li>'
					+'<li id="moreviolet" class="moreviolet"></li>'
					+'<li id="morelightviolet" class="morelightviolet"></li>'
					+'<li id="morefucsia" class="morefucsia">'
					+'<li id="beadgold" class="beadgold"></li>'
					+'<li id="beadgrey" class="beadgrey"></li>'
					+'<li id="beadblack" class="beadblack"></li>'
					+'<li id="beaddarkblue" class="beaddarkblue"></li>'
					+'<li id="beadblue" class="beadblue"></li>'
					+'<li id="beadlightblue" class="beadlightblue"></li>'
					+'<li id="beadlightblue2" class="beadlightblue2"></li>'
					+'<li id="beadwatergreen" class="beadwatergreen"></li>'
					+'<li id="beadlightgreen" class="beadlightgreen"></li>'
					+'<li id="beadgreen" class="beadgreen"></li>'
					+'<li id="beadyellow" class="beadyellow"></li>'
					+'<li id="beadorange" class="beadorange"></li>'
					+'<li id="beadred" class="beadred"></li>'
					+'<li id="beadpurple" class="beadpurple"></li>'
					+'<li id="beadviolet" class="beadviolet"></li>'
					+'<li id="beadlightviolet" class="beadlightviolet"></li>'
					+'<li id="beadfucsia" class="beadfucsia"></li>'
				  +'</ul>').appendTo(buttonsDropp);
				var roundList = $('<div class="roundList '+o.roundBg+'List" title="choose another round background for tooltips"></div>').appendTo(listContainer);
				
				chooseButtons = $('ul.buttons').find('li');
				$.each(chooseButtons, function( index, button ){
					$(button).bind('click', function(){
						$(buttonsDropp).css('display','none');
						$('.drag-button').removeClass(o.button);
						$('.drag-button').addClass($(button).attr('class'));
						o.button=$(button).attr('class');
						clickCounter=0;
						return false;
					});
					$(button).bind('mouseover', function(){
						$(button).css('width','36');
						$(button).css('height','36');
						$(button).css('background-size','36px');
						$(button).css('z-index','10');
					});
					$(button).bind('mouseout', function(){
					  $(button).css('width','32');
						$(button).css('height','36');
						$(button).css('background-size','32px');
						$(button).css('z-index','1');
					});
				});
				var clickCounter=0;
				
				$('#'+value.id +' .buttonsList').bind('click', function(){
				  if(clickCounter==0){
				   $(buttonsDropp).css('display','block');
				   clickCounter=1;
				  }else if(clickCounter==1){
				    $(buttonsDropp).css('display','none');
				    clickCounter=0;
				  }
				  return false;
				});
			
			// list of backgrounds to change tooltip background
//			if (self.options.animation) {
			  $('.listContainer').addClass(o.animationBg);
				var bgDropp = $('<div class="bgDropp"></div>').insertAfter(listContainer);
				$('<ul class="inline bg">'
					+'<li id="bgblack" title="black tooltip background" class="bgblack noborder"></li>'
				  +'<li id="bgwhite" title="white tooltip background" class="bgwhite noborder"></li>'
				  +'</ul>').appendTo(bgDropp);
				chooseBg = $('ul.bg').find('li');
				$.each(chooseBg, function( index, bg ){
					$(bg).bind('click', function(){
					  $('.listContainer').removeClass(o.animationBg);
					  $('.listContainer').addClass(bg.id);
						$(bgDropp).css('display','none');
						o.animationBg=bg.id;
					  
						clickCounter2=0;
						return false;
					});
					$(bg).bind('mouseover', function(){
						$(bg).css('border','1px solid red');
						$(bg).css('z-index','10');
					});
					$(bg).bind('mouseout', function(){
					  $(bg).css('border','0');
						$(bg).css('z-index','1');
					});
				});
				var clickCounter2=0;
				$('#'+value.id +' .bgList').bind('click', function(){
				  if(clickCounter2==0){
				   $(bgDropp).css('display','block');
				   clickCounter2=1;
				  }else if(clickCounter2==1){
				    $(bgDropp).css('display','none');
				    clickCounter2=0;
				  }
				  return false;
				});
				var bgRoundDropp = $('<div class="bgRoundDropp"></div>').insertAfter(listContainer);
				$('<ul class="roundBg">'
					+'<li class="ip_img32" title="white round" data-round="roundBgW"><div class="roundBgW"></div><div class="roundBgWIn"></div><div class="roundBgWInner"></div></li>'
				  +'<li class="ip_img32" title="black round" data-round="roundBgB"><div class="roundBgB"></div><div class="roundBgBIn"></div><div class="roundBgBInner"></div></li>'
				  +'<li class="ip_img32"title="no round" data-round=""><div class="noRound"></div></li>'
				  +'</ul>').appendTo(bgRoundDropp);
				chooseRoundBg = $('ul.roundBg').find('li');
				$.each(chooseRoundBg, function( index, roundBg ){
					$(roundBg).bind('click', function(){
					  $('.roundList').removeClass(o.roundBg+'List');
					  $('.roundList').addClass($(roundBg).attr('data-round')+'List');
					  o.roundBg=$(roundBg).attr('data-round');
						$(bgRoundDropp).css('display','none');
						clickBgCounter=0;
						return false;
					});
					$(roundBg).bind('mouseover', function(){
						$(roundBg).css('border','1px solid red');
						$(roundBg).css('z-index','10');
					});
					$(roundBg).bind('mouseout', function(){
					  $(roundBg).css('border','0');
						$(roundBg).css('z-index','1');
					});
				});
				var clickBgCounter=0;
				$('#'+value.id +' .roundList').bind('click', function(){
				  if(clickBgCounter==0){
				   $(bgRoundDropp).css('display','block');
				   clickBgCounter=1;
				  }else if(clickBgCounter==1){
				    $(bgRoundDropp).css('display','none');
				    clickBgCounter=0;
				  }
				  return false;
				});
				var plus=0;
				var bgPar;
				
				$('#'+value.id).droppable({
					accept: '.drag-button',
					drop: function( event, ui ) {
						plus++;
						var countTurn=0;
						var div = $('<div class="more more32 '+o.button+'" title="Click or drag"></div>' )
							.attr("data-button", o.button)
							.attr("data-tooltipbg", o.animationBg)
							.attr("data-round", o.roundBg)
							.attr("data-animationtype", 'ltr-slide')
							.css('position',"absolute")
							.css('top',ui.position.top+"px")
							.css('left',ui.position.left+"px")
							.css('cursor',"pointer")
							.draggable({containment: picture})
							.bind('click', function(event){
								if(event.target == this){
								  var bgPar = $('<p class="bgPar bgblack">tooltip background</p>').appendTo($(this));
								  var pTurn = $('<p class="pTurn" title="turn this tooltip"></p>').appendTo($(this));
								  pTurn.on('click',function(){
									  countTurn = turnTooltip(countTurn,bgPar,$(this));
								  });
								  // TODO controllare questo if
								  if($(this).attr('data-round')){
									  bgRound = $('<div class="ip_img32 clone"><div class="'+$(this).attr('data-round')+'"></div><div class="'+$(this).attr('data-round')+'In"></div><div class="'+$(this).attr('data-round')+'Inner"></div><div class="button '+$(this).attr('data-button')+'"></div></div>').appendTo($(this));
									  bgRound.on('click',function(){
										  bgPar.remove();
										  pTurn.remove();
										  $(this).remove();
									  });
								  }
								  return false;
								}
							})
							.appendTo(this);
						//workaround for firefox issue on trimming border-radius content
						$(".more32").css('overflow','visible');
						var pDelete = $('<p class="pDelete" title="delete this tooltip"></p>')
							.appendTo(div)
							.bind('click', function() {
								$(div).remove();
								})
							.bind('mouseover', function() {
								$(this).css('opacity','0.6');
								})
							.bind('mouseout', function() {
								$(this).css('opacity','1');
								});
//						$( "#textContainer" ).css( "display", "" );
						$('.buttonSave').css('visibility', 'visible');
						$('.thirdStep').css('visibility', 'visible');
						$( ".save" ).button( "option", "disabled", false );
					}
				});
			});
			$('.save').bind('click', function() {
				if($('#textDiv')){
					$('#textDiv').remove();
				}
				var textDiv = $('<div id="textDiv"><h3 class="thirdStep">The code:</h3></div>').insertAfter('.save');
		        var textContainer = $('<textarea id="textContainer"></textarea>').appendTo(textDiv);
				var interaction = $('input[name=radio]:radio:checked').val();
				var moreInfos = '<div id="iPicture" data-interaction="'+interaction+'">\n';
	//			each picture
				$('.ip_slide').each(function( index, value ) {
					var image = $(this).find('.ip_tooltipImg');
					moreInfos=moreInfos+'<div class="ip_slide">\n<img class="ip_tooltipImg" src="images/'+image.attr('title')+'">\n';
					var divs = $(this).find('.more');
	//				each more infos on that picture
					$.each(divs, function( index, value ){
	
						moreInfos=moreInfos+'<div class="ip_tooltip ip_img32" style="top: '
							+$(value).css('top')+'; left: '
							+$(value).css('left')+';" data-button="'+$(this).attr('data-button')
							+'" data-tooltipbg="'+$(this).attr('data-tooltipbg')+'" data-round="'+$(this).attr('data-round')+'" data-animationtype="'+$(this).attr('data-animationtype')+'">\n<p></p>\n</div>\n';
						
					});
					moreInfos=moreInfos+'</div>\n';
				});
				moreInfos = moreInfos+'</div>';
				moreInfos = moreInfos + '<script>$( "#iPicture" ).iPicture();</script>';
				textContainer.val(moreInfos);
				var editor = CodeMirror.fromTextArea(document.getElementById("textContainer"), {mode: "text/html", tabMode: "indent", smartIndent: true});
				CodeMirror.commands["selectAll"](editor);
				var range = { from: editor.getCursor(true), to: editor.getCursor(false) };
		        editor.autoFormatRange(range.from, range.to);
		        window.scrollTo(0,$('body').outerHeight());
			});
		function turnTooltip(countTurn, bgPar, pTurn){
			switch(countTurn){
		  	case 0:
		  		bgPar.css('left','0').css('right','-55px').css('top','40px');
		  		pTurn.css('left','60px').css('right','-40px').css('top','30px');
		  		pTurn.parent('.more').attr('data-animationtype','ttb-slide');
		  		return ++countTurn;
		  		break;
		  	case 1:
		  		bgPar.css('left','-100px').css('right','40px').css('top','0');
		  		pTurn.css('left','-30px').css('top','-12px');
		  		pTurn.parent('.more').attr('data-animationtype','rtl-slide');
		  		return ++countTurn;
		  		break;
		  	case 2:
		  		bgPar.css('left','0').css('right','-55px').css('top','-40px');
		  		pTurn.css('left','65px').css('right','-40px').css('top','-50px');
		  		pTurn.parent('.more').attr('data-animationtype','btt-slide');
		  		return ++countTurn;
		  		break;
		  	case 3:
		  		bgPar.css('left','40px').css('right','-90px').css('top','0');
		  		pTurn.css('left','100px').css('right','-40px').css('top','-12px');
		  		pTurn.parent('.more').attr('data-animationtype','ltr-slide');
		  		return countTurn=0;
		  		break;
		  }
		}
	},

	refresh: function(){
		$('.listContainer').remove();
		$('#textDiv').remove();
		this._create();
	},
	
	// Use the _setOption method to respond to changes to options
	_setOption: function( key, value ) {
	// In jQuery UI 1.8, you have to manually invoke the _setOption method from the base widget	
	$.Widget.prototype._setOption.apply( this, arguments );
		// In jQuery UI 1.9 and above, you use the _super method instead
		//this._super( "_setOption", key, value );
	},
	 
	// Use the destroy method to clean up any modifications your widget has made to the DOM
	destroy: function() {
		$('.listContainer').remove();
		// In jQuery UI 1.8, you must invoke the destroy method from the base widget
		$.Widget.prototype.destroy.call( this );
		// In jQuery UI 1.9 and above, you would define _destroy instead of destroy and not call the base method
		}
	});
  
}( jQuery ) );

