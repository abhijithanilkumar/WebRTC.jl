import Base:writemime

function html_body(app)
    """
        <title>WebRTC.jl</title>

        <script>
            if(!location.hash.replace('#', '').length) {
                location.href = location.href.split('#')[0] + '#' + (Math.random() * 100).toString().replace('.', '');
                location.reload();
            }
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <link rel="author" type="text/html" href="https://plus.google.com/+MuazKhan">
        <meta name="author" content="Muaz Khan">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <meta name="title" content="Video Conferencing" />
        <meta name="description" content="Video Conferencing using WebRTC." />
        <meta name="keywords" content="WebRTC, Video Conferencing, Demo, Example, Experiment" />

        <link rel="stylesheet" href="https://cdn.webrtc-experiment.com/style.css">
        <script>
          $(getmedia())
        </script>

        <style>
            audio, video {
                -moz-transition: all 1s ease;
                -ms-transition: all 1s ease;
                -o-transition: all 1s ease;
                -webkit-transition: all 1s ease;
                transition: all 1s ease;
                vertical-align: top;
            }
            input {
                border: 1px solid #d9d9d9;
                border-radius: 1px;
                font-size: 2em;
                margin: .2em;
                width: 30%;
            }
            .setup {
                border-bottom-left-radius: 0;
                border-top-left-radius: 0;
                font-size: 102%;
                height: 47px;
                margin-left: -9px;
                margin-top: 8px;
                position: absolute;
            }
            p { padding: 1em; }
            li {
                border-bottom: 1px solid rgb(189, 189, 189);
                border-left: 1px solid rgb(189, 189, 189);
                padding: .5em;
            }
        </style>
        <script>
            document.createElement('article');
            document.createElement('footer');
        </script>

        <!-- scripts used for video-conferencing -->
        <script>
          $(firebase())
        </script>
        <script>
          $(peerconnection())
        </script>
        <script>
          $(conference())
        </script>

        <!-- script used to stylize video element -->



        <body onload="sh_highlightDocument();">
            <article>
                <header style="text-align: center;">
                    <h1>
                        WebRTC.jl
                    </h1>
                </header>

                <!-- <div class="github-stargazers"></div> -->

                <!-- just copy this <section> and next script -->
                <section class="experiment">
                    <section>
    <!--                     <span>
                            Private ?? <a href="/video-conferencing/" target="_blank" title="Open this link in new tab. Then your conference room will be private!"><code><strong id="unique-token">#123456789</strong></code></a>
                        </span> -->
    <!--                     <input type="text" id="conference-name">
                        <button id="setup-new-room" class="setup">Setup New Conference</button> -->
                        <input type = "text" id = "conference-name">
                        <input type = "button" id = "setup-new-room" class = "setup" value="Setup Conference" style="float: right;">
                    </section>

                    <!-- list of all available conferencing rooms -->
                    <table style="width: 100%;" id="rooms-list"></table>

                    <!-- local/remote videos container -->
                    <div id="videos-container"></div>
                </section>

                <script>
                    var config = {
                        openSocket: function(config) {
                            var channel = config.channel || location.href.replace( /\/|:|#|%|\.|\[|\]/g , '');
                            var socket = new Firebase('https://webrtc.firebaseIO.com/' + channel);
                            socket.channel = channel;
                            socket.on("child_added", function(data) {
                                config.onmessage && config.onmessage(data.val());
                            });
                            socket.send = function(data) {
                                this.push(data);
                            };
                            config.onopen && setTimeout(config.onopen, 1);
                            socket.onDisconnect().remove();
                            return socket;
                        },
                        onRemoteStream: function(media) {
                            var mediaElement = getMediaElement(media.video, {
                                width: (videosContainer.clientWidth / 2) - 50,
                                buttons: ['mute-audio', 'mute-video', 'full-screen', 'volume-slider']
                            });
                            mediaElement.id = media.streamid;
                            videosContainer.insertBefore(mediaElement, videosContainer.firstChild);
                        },
                        onRemoteStreamEnded: function(stream, video) {
                            if (video.parentNode && video.parentNode.parentNode && video.parentNode.parentNode.parentNode) {
                                video.parentNode.parentNode.parentNode.removeChild(video.parentNode.parentNode);
                            }
                        },
                        onRoomFound: function(room) {
                            var alreadyExist = document.querySelector('button[data-broadcaster="' + room.broadcaster + '"]');
                            if (alreadyExist) return;
                            if (typeof roomsList === 'undefined') roomsList = document.body;
                            var tr = document.createElement('tr');
                            tr.innerHTML = '<td><strong>' + room.roomName + '</strong> shared a conferencing room with you!</td>' +
                                '<td><button class="join">Join</button></td>';
                            roomsList.insertBefore(tr, roomsList.firstChild);
                            var joinRoomButton = tr.querySelector('.join');
                            joinRoomButton.setAttribute('data-broadcaster', room.broadcaster);
                            joinRoomButton.setAttribute('data-roomToken', room.roomToken);
                            joinRoomButton.onclick = function() {
                                this.disabled = true;
                                var broadcaster = this.getAttribute('data-broadcaster');
                                var roomToken = this.getAttribute('data-roomToken');
                                captureUserMedia(function() {
                                    conferenceUI.joinRoom({
                                        roomToken: roomToken,
                                        joinUser: broadcaster
                                    });
                                }, function() {
                                    joinRoomButton.disabled = false;
                                });
                            };
                        },
                        onRoomClosed: function(room) {
                            var joinButton = document.querySelector('button[data-roomToken="' + room.roomToken + '"]');
                            if (joinButton) {
                                // joinButton.parentNode === <li>
                                // joinButton.parentNode.parentNode === <td>
                                // joinButton.parentNode.parentNode.parentNode === <tr>
                                // joinButton.parentNode.parentNode.parentNode.parentNode === <table>
                                joinButton.parentNode.parentNode.parentNode.parentNode.removeChild(joinButton.parentNode.parentNode.parentNode);
                            }
                        }
                    };
                    function setupNewRoomButtonClickHandler() {
                        btnSetupNewRoom.disabled = true;
                        document.getElementById('conference-name').disabled = true;
                        captureUserMedia(function() {
                            conferenceUI.createRoom({
                                roomName: (document.getElementById('conference-name') || { }).value || 'Anonymous'
                            });
                        }, function() {
                            btnSetupNewRoom.disabled = document.getElementById('conference-name').disabled = false;
                        });
                    }
                    function captureUserMedia(callback, failure_callback) {
                        var video = document.createElement('video');
                        getUserMedia({
                            video: video,
                            onsuccess: function(stream) {
                                config.attachStream = stream;
                                callback && callback();
                                video.setAttribute('muted', true);
                                var mediaElement = getMediaElement(video, {
                                    width: (videosContainer.clientWidth / 2) - 50,
                                    buttons: ['mute-audio', 'mute-video', 'full-screen', 'volume-slider']
                                });
                                mediaElement.toggle('mute-audio');
                                videosContainer.insertBefore(mediaElement, videosContainer.firstChild);
                            },
                            onerror: function() {
                                alert('unable to get access to your webcam');
                                callback && callback();
                            }
                        });
                    }
                    var conferenceUI = conference(config);
                    /* UI specific */
                    var videosContainer = document.getElementById('videos-container') || document.body;
                    var btnSetupNewRoom = document.getElementById('setup-new-room');
                    var roomsList = document.getElementById('rooms-list');
                    if (btnSetupNewRoom) btnSetupNewRoom.onclick = setupNewRoomButtonClickHandler;
                    function rotateVideo(video) {
                        video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(0deg)';
                        setTimeout(function() {
                            video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(360deg)';
                        }, 1000);
                    }
                    (function() {
                        var uniqueToken = document.getElementById('unique-token');
                        if (uniqueToken)
                            if (location.hash.length > 2) uniqueToken.parentNode.parentNode.parentNode.innerHTML = '<h2 style="text-align:center;"><a href="' + location.href + '" target="_blank">Share this link</a></h2>';
                            else uniqueToken.innerHTML = uniqueToken.parentNode.parentNode.href = '#' + (Math.random() * new Date().getTime()).toString(36).toUpperCase().replace( /\./g , '-');
                    })();
                    function scaleVideos() {
                        var videos = document.querySelectorAll('video'),
                            length = videos.length, video;
                        var minus = 130;
                        var windowHeight = 700;
                        var windowWidth = 600;
                        var windowAspectRatio = windowWidth / windowHeight;
                        var videoAspectRatio = 4 / 3;
                        var blockAspectRatio;
                        var tempVideoWidth = 0;
                        var maxVideoWidth = 0;
                        for (var i = length; i > 0; i--) {
                            blockAspectRatio = i * videoAspectRatio / Math.ceil(length / i);
                            if (blockAspectRatio <= windowAspectRatio) {
                                tempVideoWidth = videoAspectRatio * windowHeight / Math.ceil(length / i);
                            } else {
                                tempVideoWidth = windowWidth / i;
                            }
                            if (tempVideoWidth > maxVideoWidth)
                                maxVideoWidth = tempVideoWidth;
                        }
                        for (var i = 0; i < length; i++) {
                            video = videos[i];
                            if (video)
                                video.width = maxVideoWidth - minus;
                        }
                    }
                    window.onresize = scaleVideos;
                </script>
            </article>
        </body>

    """
end

function Base.writemime(io::IO, ::MIME"text/html", app::WebRTCApplication)
    print(io, html_body(app))
end
