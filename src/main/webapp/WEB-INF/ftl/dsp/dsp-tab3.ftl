<form style="padding-left: 25px"  id="form-dsp-tab3" action="<@spring.url '/dsp/ngraph/tab3' />" class="MISSY_round_right">

	
	<fieldset>
	
		<table>
	        <tr style="background:transparent">
	            <td style="width:50%">
	            	<input id="fileupload3" style="width:100%;max-width:none" type="file" name="files[]" data-url="<@spring.url '/dsp/upload' />" multiple />
				</td>
	            <td>
	            	<div id="progress3" class="progress" style="width:70%;display:none">
				        <div class="bar" style="width: 0%;"></div>
				    </div>
				</td>
	        </tr>
	    </table>
	
	  	<textarea name="data" id="data" cols="50" rows="20"></textarea>	 
	  	
		<#-- form onsite help -->
		<a href="#" class="MISSY_onsiteHelp" style="margin-top:-20px">
			<img src="<@spring.url '/resources/images/gs_icon.question_blue.png' />" class="MISSY_iconOnsitehelp" />
			<span>
				<img class="MISSY_onsiteHelpCallout" src="<@spring.url '/resources/images/onsiteHelpCallout.gif' />">
				<h4 class="MISSY_onsiteHelp">Data</h4>
				<img src="<@spring.url '/resources/images/gs_icon.question_blue.png' />" class="MISSY_onsiteHelpHeaderIcon" /><br clear="all">
				Data
			</span>
		</a>
	 
	</fieldset>
	
	<br />
	<hr />
	
	<fieldset>
		<input 
		  type="button" 
		  name="button_dsp-tab3" 
		  id="button_dsp-tab3" 
		  value="Next: Inference Rules" 
		  class="buttonSubmit MISSY_loginSubmit" 
		  style="float: right; margin-top: 10px">
	</fieldset>
	
</form>

<script>
  	$jQ(function() {
    	$jQ("#text_output")
		  .wrap('<div/>')
		    .css({'overflow':'hidden'})
		      .parent()
		        .css({'display':'inline-block',
		              'overflow':'hidden',
		              'height':function(){return $jQ('#text_output',this).height();},
		              'width': '100%',
		              'paddingBottom':'12px',
		              'paddingRight':'12px'
		
		             }).resizable({
		             	grid: [10000, 1]
		             })
		                .find('#text_output')
		                  .css({overflow:'auto',
		                        width:'100%',
		                        height:'100%'});
		  	});
		  	
	$jQ('#fileupload3').fileupload({
        dataType: 'json',
 
        done: function (e, data) {
         	$jQ('#data').val( data.result.fileContent );
        },
 
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $jQ('#progress3 .bar').css('width', progress + '%').html( progress + '%');
        	$jQ('#progress3').show();
            if( progress == 100 )
            	window.setTimeout( function(){$jQ('#progress3').fadeOut( "slow" ); } , 3000);
        }
    });
 </script>