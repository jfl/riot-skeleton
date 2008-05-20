<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Riot Project Skeleton - ${currentPage.title}</title>

	<link rel="stylesheet" type="text/css" href="${request.contextPath}/riot-utils/joined.css?files=/style/yui.reset.css,grid.css,main_${currentSite.theme!}.css" />

	<@inplace.callbacks>
		// Register a callback that is invoked when an element is updated,
		// to update Shadowbox links contained in this element.
		addRiotEditCallback(function(el) {
			Shadowbox.clearCache();
			Shadowbox.setup();
		});
	</@inplace.callbacks>

	<#--
	  - NOTE: Though the Riot toolbar uses prototype.js and scriptaculous 
	  - internally you don't have to load these libraries manually, unless
	  - you want to use either Txt2Img or Shadowbox. 
	  -->

	<#-- Txt2Img -->
    <@riot.script src="prototype/prototype.js" />
    <script src="${c.resource('/riot-utils/txt2img.js?locale=' + .locale)}" type="text/javascript"></script>

	<#-- Shadowbox (see http://mjijackson.com/shadowbox) -->
	<link href="${c.resource('/style/shadowbox/css/shadowbox.css')}" rel="stylesheet" type="text/css" media="screen" />
	<@riot.script src="scriptaculous/effects.js" />
    <script type="text/javascript" src="${c.resource('/style/shadowbox/js/adapter/shadowbox-prototype.js')}"></script>
    <script type="text/javascript" src="${c.resource('/style/shadowbox/js/shadowbox.js')}"></script>
    <script type="text/javascript">
		document.observe('dom:loaded', function() {
			Shadowbox.init({
				assetURL: '${request.contextPath}/style/shadowbox/',
				fadeDuration: 0.15,
				resizeDuration: 0.15
			})
		});
    </script>
</head>
<body class="${bodyClass!"default"}">
<div id="container" class="container">
	<div id="header" class="header">
		<div class="padding">
			<@c.include header />
		</div>
	</div>
	<div id="wrapper" class="wrapper">
		<div id="content" class="content">
			<div class="padding">
				<@c.include content />
			</div>
		</div>
	</div>
	<div id="navigation" class="navigation">
		<div class="padding">
			<@c.include navigation />
		</div>
	</div>
	<#if extra??>
		<div id="extra" class="extra">
			<div class="padding">
				<@c.include extra />
			</div>
		</div>
	</#if>
	<div id="footer" class="footer">
		<div class="padding">
			<span class="poweredby">Powered by</span><span class="riot">Riot</span>
		</div>
	</div>
</div>

<#if currentSite.googleAnalyticsCode??>
	<script type="text/javascript">
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script type="text/javascript">
		var pageTracker = _gat._getTracker("${currentSite.googleAnalyticsCode}");
		pageTracker._initData();
		pageTracker._trackPageview();
	</script>
</#if>

<@inplace.toolbar />
</body>
</html>
