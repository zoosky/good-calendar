<!DOCTYPE html>
<!--[if IE 9]><html class="no-js ie9"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js"><!--<![endif]-->
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Good Calendar</title>
		<meta name="description" content="Flexible Calendar with jQuery and CSS3" />
		<meta name="keywords" content="responsive, calendar, jquery, plugin, full page, flexible, javascript, css3, media queries" />
		<meta name="author" content="Ke Mao" />
		<meta name="theme design" content="Codrops" />		
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="gc/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="gc/css/calendar.css" />
		<link rel="stylesheet" type="text/css" href="gc/css/custom_1.css" />
		<link rel="stylesheet" type="text/css" href="gc/css/avgrund.css" />
	</head>
	<body>
		<div class="container remodal-bg">	
			<!-- Codrops top bar -->
			<div class="codrops-top clearfix">
				<a href="#"><strong>&raquo; Subscribe: </strong>receive email notification on upcoming events</a>
				<span class="right">
					<a id="about" href="#"><strong>About</strong></a>
				</span>
			</div><!--/ Codrops top bar -->
			<div class="custom-calendar-wrap custom-calendar-full">
				<div class="custom-header clearfix">
					<h2>Good Calendar <span>
						<span>Demo</span> 
						<!-- | <a href="index2.html">Demo 2</a> | <a href="index3.html">Demo 3</a>
						 | <a href="index4.html">Demo 4</a> -->
						 </span>
					</h2>
					<h3 class="custom-month-year">
						<span id="custom-month" class="custom-month"></span>
						<span id="custom-year" class="custom-year"></span>
						<nav>
							<span id="custom-prev" class="custom-prev"></span>
							<span id="custom-next" class="custom-next"></span>
							<span id="custom-current" class="custom-current" title="Go to current date"></span>
						</nav>
					</h3>
				</div>
				<div id="calendar" class="fc-calendar-container"></div>
			</div>
		</div><!-- /container -->


		<script type="text/javascript" src="gc/js/jquery.min.js"></script>
		<script type="text/javascript" src="gc/js/jquery.calendario.js"></script>
		<script type="text/javascript" src="gc/js/data.js"></script>
        <script type="text/javascript" src="gc/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="gc/js/data.js"></script>
        <script src="gc/js/modernizr.custom.63321.js"></script>
		<script src="gc/js/jquery.avgrund.min.js"></script>

		<script type="text/javascript">	
			$(function() {

				$('#about').avgrund({
					height: 200,
					holderClass: 'custom',
					showClose: true,
					showCloseText: 'X',
					onBlurContainer: '.container',
					template: '<p style="margin: 12px 0 10px;padding: 5px 10px;"> <strong>Good Calendar V1.0 </strong> </p>'
						+ '<p>Developed by: Ke Mao @ LH</p>'
						+ '<p>Supported by: Goodenough College Software</p>'
						+ '<p>Theme by: Codrops</p>'
						+ '<p>Feedback: kemao.py at gmail.com</p>'
				});				

                var pop_title = '', pop_content = '';
                $(document).popover({
                    delay: { show: 100, hide: 200 },
                    html: true,
                    trigger: 'hover',
                    selector: 'div.fc-content',
                    placement: 'auto',
                    content: function() {
                                return pop_content;
                             },
                    title: function() {
                                return pop_title;
                           },
                    container: 'body'
                });

				var transEndEventNames = {
                        'WebkitTransition' : 'webkitTransitionEnd',
                        'MozTransition' : 'transitionend',
                        'OTransition' : 'oTransitionEnd',
                        'msTransition' : 'MSTransitionEnd',
                        'transition' : 'transitionend'
                },
                transEndEventName = transEndEventNames[ Modernizr.prefixed( 'transition' ) ],
                $wrapper = $( '#custom-inner' ),
                $calendar = $( '#calendar' ),
                cal = $calendar.calendario({
					onDayClick : function( $el, $contentEl, dateProperties ) {

						// for( var key in dateProperties ) {
						// 	console.log( key + ' = ' + dateProperties[ key ] );
						// }

					},                	
                    onDayMouseenter : function( $el, data, dateProperties ) {
                        if( data.content.length > 0 ) {
                            pop_title = dateProperties.monthname + ' ' + dateProperties.day + ', ' + dateProperties.year;
                            pop_content = data.content.join('');
                            // logFeed(data);
                        }
                    },
                    caldata : codropsEvents,
                    events: 'mouseenter',
                    displayWeekAbbr : true,
                    fillEmpty: false
                }),	

				$month = $( '#custom-month' ).html( cal.getMonthName() ),
				$year = $( '#custom-year' ).html( cal.getYear() );

				$( '#custom-next' ).on( 'click', function() {
					cal.gotoNextMonth( updateMonthYear );
				} );
				$( '#custom-prev' ).on( 'click', function() {
					cal.gotoPreviousMonth( updateMonthYear );
				} );
				$( '#custom-current' ).on( 'click', function() {
					// location.reload();
					cal.gotoNow( updateMonthYear );
				} );

				function updateMonthYear() {
					$month.html( cal.getMonthName() );
					$year.html( cal.getYear() );
				}

                function logFeed( data ) {              
                    console.log(data);
                }
			
			});
		</script>

		<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		  ga('create', 'UA-40319516-2', 'auto');
		  ga('send', 'pageview');

		</script>

	</body>
</html>
