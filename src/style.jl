export style

function style()
  """
  html, body {
    height: 100%;
  }

  html {
    overflow-y: scroll;
  }

  body {
    padding: 0;
    margin: 0;
    background: -moz-linear-gradient(top, rgba(238,238,238,1) 0%, rgba(238,238,238,0) 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(238,238,238,1)), color-stop(100%,rgba(238,238,238,0)));
    background: -webkit-linear-gradient(top, rgba(238,238,238,1) 0%,rgba(238,238,238,0) 100%);
    background: -o-linear-gradient(top, rgba(238,238,238,1) 0%,rgba(238,238,238,0) 100%);
    background: -ms-linear-gradient(top, rgba(238,238,238,1) 0%,rgba(238,238,238,0) 100%);
    background: linear-gradient(to bottom, rgba(238,238,238,1) 0%,rgba(238,238,238,0) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eeeeee', endColorstr='#00eeeeee',GradientType=0 );
  }


  #splash_header {
    font: 300 18px 'light','Helvetica Neue',Arial,Helvetica,sans-serif;
  }
  #room_entry {
    text-align: center;
    width: 100%;
    display: block;
  }

  #username_header {
    font: 300 18px 'light','Helvetica Neue',Arial,Helvetica,sans-serif;
  }

  #username_warning_header {
    font: 300 18px 'light','Helvetica Neue',Arial,Helvetica,sans-serif;
  }

  #warning {
     margin-top: 5px;
  }

  #warning td {
     border: 1px solid black;
     vertical-align: top;
  }

  #colors {
     border-spacing: 0px;
  }

  #good {
     background-color: rgb(190, 231, 190);
  }

  #yellow {
     background-color: rgb(247, 247, 195);
  }

  #bad {
     background-color: rgb(240, 203, 203);
  }

  #chatinput {
    background: none repeat scroll 0 0 #F9F9F9;
    border: 1px solid #CCCCCC;
    border-radius: 0px 0px 5px 5px;
    font: 300 18px/40px 'light','Helvetica Neue',Arial,Helvetica,sans-serif;
    height: 40px;
    letter-spacing: 1px;
    margin-bottom: 0px;
    padding: 5px 10px;
    width: 100%;
  }

  #chatbox {
    height: 95%;
  }

  #chatbox-panel {
    height: calc(100% - 45px);
  }

  #messages {
    overflow: scroll;
    background-color: rgb(249,249,249,0.6);
    border: 1px solid #CCCCCC;
    border-radius: 5px 5px 0px 0px;
    font: 300 18px 'light','Helvetica Neue',Arial,Helvetica,sans-serif;
    height: calc(100% - 45px);
    min-height:100px;
    margin-bottom: 0px;
    padding: 5px 10px;
    width: 100%;
  }

  .small {
      font-size: 12px;
      color: rgb(131, 131, 131);
  }

  .flip {
  -webkit-transform: rotateY(180deg);
  }

  .buttonBox {
    width: 100%;
    height: 100%;
    display: block;
    position: absolute;
    top: 2px;
    left: 2px;
    z-index: 1;
  }
  .button {
    -moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
    -webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
    box-shadow:inset 0px 1px 0px 0px #ffffff;
    background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
    background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
    filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
    background-color:#ededed;
    -moz-border-radius:6px;
    -webkit-border-radius:6px;
    border-radius:6px;
    border:1px solid #dcdcdc;
    display:inline-block;
    color:rgb(78, 78, 78);
    font-family:arial;
    font-size:15px;
    font-weight:bold;
    padding:6px 24px;
    text-decoration:none;
    text-shadow:1px 1px 0px #ffffff;
  }

  .button:hover {
    background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #dfdfdf), color-stop(1, #ededed) );
    background:-moz-linear-gradient( center top, #dfdfdf 5%, #ededed 100% );
    filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf', endColorstr='#ededed');
    background-color:#dfdfdf;
  }
  .button:active {
    position:relative;
    top:1px;
  }


  /* offcanvas userlist on smaller screens, ie. mobile */

  @media screen and (max-width: 768px) {
    .row-offcanvas {
      position: relative;
      -webkit-transition: all 0.25s ease-out;
      -moz-transition: all 0.25s ease-out;
      transition: all 0.25s ease-out;
    }

    .row-offcanvas-right
    .sidebar-offcanvas {
      right: -50%; /* 6 columns */
    }

    .row-offcanvas-left
    .sidebar-offcanvas {
      left: -50%; /* 6 columns */
    }

    .row-offcanvas-right.active {
      right: 50%; /* 6 columns */
    }

    .row-offcanvas-left.active {
      left: 50%; /* 6 columns */
    }

    .sidebar-offcanvas {
      position: absolute;
      top: 0;
      width: 50%; /* 6 columns */
    }

    .btn_off {
      float: left;
      position: absolute;
      top: -20px;
    }
  }

  /* bootstrap overrides */

  body {
  	padding-top:70px; /* header shift */
  }

  .container {
  	max-width: 2170px;
  }

  .panel {
  	background-color:rgba(255,255,255,0.6);
  }

  .panel-default > .panel-heading {
  	background-color:rgba(245,245,245,0.6);
  }

  input[type="file"] {
  	display:inline;
  }

  .navbar-inverse .navbar-brand {
    color: #fff;
  }

  @media screen and (min-width: 768px) {
  	.modal-dialog {
  		width: 680px;
  	}
  }

  .frontpage_header {
  	text-align:center;
  }

  .support {
    color:rgb(179, 47, 47);
    display:none;
  }

  .connect-btn {
    margin-top:22px;
  }

  .username-panel {
    width: 360px;
    margin-left: auto;
    margin-right: auto;
  }

  .form-signin {
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
  }
  .form-signin .form-signin-heading,
  .form-signin .checkbox {
    margin-bottom: 10px;
  }
  .form-signin .checkbox {
    font-weight: normal;
  }
  .form-signin .form-control {
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
       -moz-box-sizing: border-box;
            box-sizing: border-box;
  }
  .form-signin .form-control:focus {
    z-index: 2;
  }
  .form-signin input[type="text"] {
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
  }
  .form-signin input[type="password"] {
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
  }
  """
end
