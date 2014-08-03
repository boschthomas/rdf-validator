<form id="form-dsp-tab4" action="<@spring.url '/dsp/ngraph/tab4' />" style="padding-left: 25px" class="MISSY_round_right">

	<fieldset>
	
		<table>
	        <tr style="background:transparent">
	            <td style="width:50%">
	            	<input id="fileupload4" style="width:100%;max-width:none" type="file" name="files[]" data-url="<@spring.url '/dsp/upload' />" multiple />
				</td>
	            <td>
	            	<div id="progress4" class="progress" style="width:70%;display:none">
				        <div class="bar" style="width: 0%;"></div>
				    </div>
				</td>
	        </tr>
	    </table>
	  	
		<textarea 
		  name="inferenceRules" 
		  id="inferenceRules" 
		  class="mandatory MISSY_textarea_resize" 
		  cols="50" 
		  rows="20" 
		  style="width:63%"
		  onkeyup="adaptHeight( $jQ( this ) );"></textarea>
		  
		<#-- form onsite help -->
		<a href="#" class="MISSY_onsiteHelp" style="margin-top:-20px">
			<img src="<@spring.url '/resources/images/gs_icon.question_blue.png' />" class="MISSY_iconOnsitehelp" />
			<span>
				<img class="MISSY_onsiteHelpCallout" src="<@spring.url '/resources/images/onsiteHelpCallout.gif' />">
				<h4 class="MISSY_onsiteHelp">Inference Rules</h4>
				<img src="<@spring.url '/resources/images/gs_icon.question_blue.png' />" class="MISSY_onsiteHelpHeaderIcon" /><br clear="all">
				Inference Rules
			</span>
		</a>
	  	
	</fieldset>
	
	<br />
	<hr />
	
	<fieldset>
		<input 
		  type="button" 
		  name="button_dsp-tab4" 
		  id="button_dsp-tab4" 
		  value="Next: Check Constraints" 
		  class="buttonSubmit MISSY_loginSubmit" 
		  style="float: right; margin-top: 10px">
	</fieldset>
	
</form>	

<script>
	$jQ('#fileupload4').fileupload({
        dataType: 'json',
 
        done: function (e, data) {
         	$jQ('#inferenceRules').val( data.result.fileContent );
        },
 
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $jQ('#progress4 .bar').css('width', progress + '%').html( progress + '%');
        	$jQ('#progress4').show();
            if( progress == 100 )
            	window.setTimeout( function(){$jQ('#progress4').fadeOut( "slow" ); } , 3000);
        }
    });
</script>