import Base:writemime

function html_body(app)
    """
    <body>

      <title>webRTC.jl</title>

      <meta name="viewport" content="width=device-width; initial-scale=1;">
      <meta name="description" content="Transfer files(of any size) and messages in the browser using WebRTC.">
      <meta name="author" content="erbbysam">
      <link rel="shortcut icon" href="images/favicon.ico">


      <!-- jquery -->
      <script src="ext-js/jquery.js"></script>
      <script src="ext-js/jquery.browser.min.js"></script>
      <script src="ext-js/base64-arraybuffer.js"></script><!--used for debugging -->
      <script src="ext-js/idb.filesystem.min.js"></script>
      <!-- OTR -->
      <script src="ext-js/otr/salsa20.js"></script>
      <script src="ext-js/otr/bigint.js"></script>
      <script src="ext-js/otr/crypto.js"></script>
      <script src="ext-js/otr/eventemitter.js"></script>
      <script src="ext-js/otr/otr.js"></script>
      <!-- additional crypto-js -->
      <script src="ext-js/crypto-js/core.js"></script>
      <script src="ext-js/crypto-js/rabbit.js"></script>
      <!-- Bootstrap core CSS -->
      <!--link href="bootstrap/css/bootstrap.css" rel="stylesheet"--> <!-- min. -->

      <!-- site CSS -->
      <!--link type="text/css" href="style.css" rel="stylesheet"></link-->
      <style type="text/css">
        $(style())
      </style>
      <!--  site js  -->
      <script src="js/crypto.js"></script>
      <script src="js/webrtc-data.io.js"></script>
    	<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    		<div class="container">
    			<div class="navbar-header">
    				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
    					<span class="icon-bar"></span>
    					<span class="icon-bar"></span>
    					<span class="icon-bar"></span>
    				</button>
    				<span class="navbar-brand">webRTC.jl</span>
    			</div>
    			<div class="collapse navbar-collapse">
    <!-- 				<ul class="nav navbar-nav">
    					<li><a data-toggle="modal" href="#myModal">About</a></li>

    				</ul> -->
    			</div>
    		</div>
    	</div>
    	<div id="alerts"></div>

    	<div id="roomprompt" style="display:none">
    		<div class="panel panel-default username-panel">
    			<div class="panel-body">
    				<div class="frontpage_header">To get started create a new room:</div>
    				<span id="room_entry">
    					<form id="webrtc_room_form" class="form-signin">
    						<input id="existing" type="text" placeholder="room name" value="" />
    						<button class="btn btn-lg btn-primary btn-block connect-btn" type="submit">Create</button>

    					</form>

    					or
    					<div id="newRoom" class="btn btn-lg btn-primary btn-block connect-btn">Generate a random room name</div><br />
    				</span>
    				<br />
    			</div>
    		</div>

    	</div>

    	<div id="userprompt" style="display:none">
    		<div class="panel panel-default username-panel">
    			<div class="panel-body">
    				<form id="webrtc_input_form" class="form-signin">
    					<span class="small" id="room_state"></span>
    					<input id="username" type="text" class="form-control" placeholder="username" value="" autofocus>
    					<!-- <select id="encryption_type" class="form-control"><option value="NONE" selected="selected">Do not use OTR</option><option value="OTR">Use OTR</option></select>

    					<input id="encryption_key" class="form-control"type="text" style="display:none;" placeholder="OTR password" value="" />
    					<br><br> -->
    					<!-- <div class="g-recaptcha" data-sitekey="6Ld2JRATAAAAAD-46Y40ceDzqPMikw6FWMIEMEV3"></div> -->
    					<br />
    					<button class="btn btn-lg btn-primary btn-block connect-btn" type="submit">connect</button>
    				</form>
    			</div>
    		</div>
    	</div>

    	<div id="chat_display" style="display:none;">

    		<div class="row row-offcanvas row-offcanvas-left">

    			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
    				<div class="sidebar-nav panel panel-default">
    					<div class="panel-heading"><span id="roomname"></span></div>
    					<div id="filelist" class="panel-body small">

    						<span id="filelist_cointainer"></span>
    					</div>
    				</div><!--/.well -->
    			</div><!--/span-->

    			<div class="col-xs-12 col-sm-9">
    				<div id="chatbox" class="panel panel-default">
    					<span class="visible-xs"><button type="button" class="btn btn-primary btn-xs btn_off" data-toggle="offcanvas">Toggle User List</button></span>
    					<div class="panel-heading"><input type="file" id="select_file" name="select_file" class="small" /></div>
    					<div id="chatbox-panel" class="panel-body">
    						<div id="messages"></div>
    						<input id="chatinput" style="display:none;" type="text" placeholder="Message:"/>
    						<div id="pleasewait">
    							Please wait a few seconds to connect.
    						</div>
    					</div>
    				</div>
    			</div>

    		</div>
    	</div>

    	<!-- Bootstrap core js -->
    	<script src="bootstrap/js/bootstrap.min.js"></script>

    	<!-- more site js -->
    	<script src="js/file-io.js"></script>
    	<script src="js/script.js"></script>
    </body>

    """
end

function Base.writemime(io::IO, ::MIME"text/html", app::WebRTCApplication)
    print(io, html_body(app))
end
