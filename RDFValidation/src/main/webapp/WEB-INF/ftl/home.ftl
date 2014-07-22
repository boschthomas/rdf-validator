 <@layout.global>
 	
 	<@content.main>

		<div id="MISSY_breadcrumb"></div>
		<div id="col3_content" class="clearfix">
			<div class="floatbox"> 
			
				<h1>RDF Validation</h1>
				<p>
					Validation of Constraints on
				</p>
				<ul>
					<li>Web Ontology Language 2 (OWL2)
					<li>Description Set Profiles (DSP)</li>
				</ul>
				
				<img src="<@spring.url '/resources/images/constraint-validation-process.png' />" alt="Constraint Validation Process" style="">
			
			</div>
 		</div>
 		
		<!-- IE clearing - important! -->
		<div id="ie_clearing">&nbsp;</div>
		
 	</@content.main>
 	
</@layout.global>

<script>
	$jQ( function() // begin document ready
	{
		<#-- change the size of main content -->
		$jQ( "#col3" ).css( "margin", "0 0 0 150px");
	}); // end of document ready
</script>