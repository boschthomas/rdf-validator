<form id="form-dsp-tab2" action="<@spring.url '/dsp/exmpgraph/tab2' />" style="padding-left: 25px" class="MISSY_round_right" >	

	<fieldset>
	
	  	<textarea name="rdfGraph" cols="50" rows="20"><#if fileContent??>${fileContent}</#if></textarea>	
	  	
		<#-- form onsite help -->
		<a href="#" class="MISSY_onsiteHelp" style="margin-top:-20px">
			<img src="<@spring.url '/resources/images/gs_icon.question_blue.png' />" class="MISSY_iconOnsitehelp" />
			<span>
				<img class="MISSY_onsiteHelpCallout" src="<@spring.url '/resources/images/onsiteHelpCallout.gif' />">
				<h4 class="MISSY_onsiteHelp">RDF Graph</h4>
				<img src="<@spring.url '/resources/images/gs_icon.question_blue.png' />" class="MISSY_onsiteHelpHeaderIcon" /><br clear="all">
				RDF Graph
			</span>
		</a>
	  	
	</fieldset>
	
	<br />
	<hr />
	
	<fieldset>
		<input 
		  type="button" 
		  name="button_dsp-tab2" 
		  id="button_dsp-tab2" 
		  value=" Next : Validate" 
		  class="buttonSubmit MISSY_loginSubmit" 
		  style="float: right; margin-top: 10px">
	</fieldset>

</form>
<script>
	$jQ(document).ready(function() {
	
	    // check username availability on focus lost
	    $jQ( '#form-dsp-tab2' ).on( "focus", 'input[type="text"]', function (){
	    	if( $jQ(this).hasClass( "form-error" ) ){
	    		$jQ(this).removeClass( "form-error" );
	    		$jQ(this).next( "div.errormsg" ).remove();
	    	}
	    });
	    
	});
</script>