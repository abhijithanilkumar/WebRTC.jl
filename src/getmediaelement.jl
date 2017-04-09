
function getmedia()
  """
    function getMediaElement(e, t) {
      function E() {
          s.style.marginLeft = i.clientWidth - s.clientWidth - 2 + "px";
          if (d) {
              d.style.width = i.clientWidth / 3 + "px";
              l.style.marginLeft = i.clientWidth / 3 - 30 + "px";
              if (v) v.style["border-top-right-radius"] = "5px"
          } else {
              l.style.marginLeft = i.clientWidth - l.clientWidth - 2 + "px"
          }
          l.style.marginTop = i.clientHeight - l.clientHeight - 2 + "px";
          if (w < 10) {
              w++;
              setTimeout(E, 1e3)
          } else w = 0
      }
      t = t || {};
      if (!e.nodeName || e.nodeName.toLowerCase() != "audio" && e.nodeName.toLowerCase() != "video") {
          if (!e.getVideoTracks().length) {
              return getAudioElement(e, t)
          }
          var n = e;
          e = document.createElement(n.getVideoTracks().length ? "video" : "audio");
          e[!!navigator.mozGetUserMedia ? "mozSrcObject" : "src"] = !!navigator.mozGetUserMedia ? n : window.webkitURL.createObjectURL(n)
      }
      if (e.nodeName && e.nodeName.toLowerCase() == "audio") {
          return getAudioElement(e, t)
      }
      e.controls = false;
      var r = t.buttons || ["mute-audio", "mute-video", "full-screen", "volume-slider", "stop"];
      r.has = function(e) {
          return r.indexOf(e) !== -1
      };
      t.toggle = t.toggle || [];
      t.toggle.has = function(e) {
          return t.toggle.indexOf(e) !== -1
      };
      var i = document.createElement("div");
      i.className = "media-container";
      var s = document.createElement("div");
      s.className = "media-controls";
      i.appendChild(s);
      if (r.has("mute-audio")) {
          var o = document.createElement("div");
          o.className = "control " + (t.toggle.has("mute-audio") ? "unmute-audio selected" : "mute-audio");
          s.appendChild(o);
          o.onclick = function() {
              if (o.className.indexOf("unmute-audio") != -1) {
                  o.className = o.className.replace("unmute-audio selected", "mute-audio");
                  e.muted = false;
                  e.volume = 1;
                  if (t.onUnMuted) t.onUnMuted("audio")
              } else {
                  o.className = o.className.replace("mute-audio", "unmute-audio selected");
                  e.muted = true;
                  e.volume = 0;
                  if (t.onMuted) t.onMuted("audio")
              }
          }
      }
      if (r.has("mute-video")) {
          var u = document.createElement("div");
          u.className = "control " + (t.toggle.has("mute-video") ? "unmute-video selected" : "mute-video");
          s.appendChild(u);
          u.onclick = function() {
              if (u.className.indexOf("unmute-video") != -1) {
                  u.className = u.className.replace("unmute-video selected", "mute-video");
                  e.muted = false;
                  e.volume = 1;
                  e.play();
                  if (t.onUnMuted) t.onUnMuted("video")
              } else {
                  u.className = u.className.replace("mute-video", "unmute-video selected");
                  e.muted = true;
                  e.volume = 0;
                  e.pause();
                  if (t.onMuted) t.onMuted("video")
              }
          }
      }
      if (r.has("take-snapshot")) {
          var a = document.createElement("div");
          a.className = "control take-snapshot";
          s.appendChild(a);
          a.onclick = function() {
              if (t.onTakeSnapshot) t.onTakeSnapshot()
          }
      }
      if (r.has("stop")) {
          var f = document.createElement("div");
          f.className = "control stop";
          s.appendChild(f);
          f.onclick = function() {
              i.style.opacity = 0;
              setTimeout(function() {
                  if (i.parentNode) {
                      i.parentNode.removeChild(i)
                  }
              }, 800);
              if (t.onStopped) t.onStopped()
          }
      }
      var l = document.createElement("div");
      l.className = "volume-control";
      if (r.has("record-audio")) {
          var c = document.createElement("div");
          c.className = "control " + (t.toggle.has("record-audio") ? "stop-recording-audio selected" : "record-audio");
          l.appendChild(c);
          c.onclick = function() {
              if (c.className.indexOf("stop-recording-audio") != -1) {
                  c.className = c.className.replace("stop-recording-audio selected", "record-audio");
                  if (t.onRecordingStopped) t.onRecordingStopped("audio")
              } else {
                  c.className = c.className.replace("record-audio", "stop-recording-audio selected");
                  if (t.onRecordingStarted) t.onRecordingStarted("audio")
              }
          }
      }
      if (r.has("record-video")) {
          var h = document.createElement("div");
          h.className = "control " + (t.toggle.has("record-video") ? "stop-recording-video selected" : "record-video");
          l.appendChild(h);
          h.onclick = function() {
              if (h.className.indexOf("stop-recording-video") != -1) {
                  h.className = h.className.replace("stop-recording-video selected", "record-video");
                  if (t.onRecordingStopped) t.onRecordingStopped("video")
              } else {
                  h.className = h.className.replace("record-video", "stop-recording-video selected");
                  if (t.onRecordingStarted) t.onRecordingStarted("video")
              }
          }
      }
      if (r.has("volume-slider")) {
          var p = document.createElement("div");
          p.className = "control volume-slider";
          l.appendChild(p);
          var d = document.createElement("input");
          d.type = "range";
          d.min = 0;
          d.max = 100;
          d.value = 100;
          d.onchange = function() {
              e.volume = "." + d.value.toString().substr(0, 1)
          };
          p.appendChild(d)
      }
      if (r.has("full-screen")) {
          var v = document.createElement("div");
          v.className = "control " + (t.toggle.has("zoom-in") ? "zoom-out selected" : "zoom-in");
          if (!d && !c && !h && v) {
              s.insertBefore(v, s.firstChild)
          } else l.appendChild(v);
          v.onclick = function() {
              if (v.className.indexOf("zoom-out") != -1) {
                  v.className = v.className.replace("zoom-out selected", "zoom-in");
                  g()
              } else {
                  v.className = v.className.replace("zoom-in", "zoom-out selected");
                  m(i)
              }
          };

          function m(e) {
              if (e.requestFullscreen) {
                  e.requestFullscreen()
              } else if (e.mozRequestFullScreen) {
                  e.mozRequestFullScreen()
              } else if (e.webkitRequestFullscreen) {
                  e.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT)
              }
          }

          function g() {
              if (document.fullscreen) {
                  document.cancelFullScreen()
              }
              if (document.mozFullScreen) {
                  document.mozCancelFullScreen()
              }
              if (document.webkitIsFullScreen) {
                  document.webkitCancelFullScreen()
              }
          }

          function y(e) {
              if (e.srcElement != i) return;
              var n = document.webkitIsFullScreen || document.mozFullScreen || document.fullscreen;
              i.style.width = (n ? window.innerWidth - 20 : t.width) + "px";
              i.style.display = n ? "block" : "inline-block";
              if (t.height) {
                  b.style.height = (n ? window.innerHeight - 20 : t.height) + "px"
              }
              if (!n && t.onZoomout) t.onZoomout();
              if (n && t.onZoomin) t.onZoomin();
              if (!n && v.className.indexOf("zoom-out") != -1) {
                  v.className = v.className.replace("zoom-out selected", "zoom-in");
                  if (t.onZoomout) t.onZoomout()
              }
              setTimeout(E, 1e3)
          }
          document.addEventListener("fullscreenchange", y, false);
          document.addEventListener("mozfullscreenchange", y, false);
          document.addEventListener("webkitfullscreenchange", y, false)
      }
      if (r.has("volume-slider") || r.has("full-screen") || r.has("record-audio") || r.has("record-video")) {
          i.appendChild(l)
      }
      var b = document.createElement("div");
      b.className = "media-box";
      i.appendChild(b);
      b.appendChild(e);
      if (!t.width) t.width = innerWidth / 2 - 50;
      i.style.width = t.width + "px";
      if (t.height) {
          b.style.height = t.height + "px"
      }
      b.querySelector("video").style.maxHeight = innerHeight + "px";
      var w = 0;
      if (t.showOnMouseEnter || typeof t.showOnMouseEnter === "undefined") {
          i.onmouseenter = i.onmousedown = function() {
              E();
              s.style.opacity = 1;
              l.style.opacity = 1
          };
          i.onmouseleave = function() {
              s.style.opacity = 0;
              l.style.opacity = 0
          }
      } else {
          setTimeout(function() {
              E();
              setTimeout(function() {
                  s.style.opacity = 1;
                  l.style.opacity = 1
              }, 300)
          }, 700)
      }
      E();
      i.toggle = function(e) {
          if (typeof e != "string") {
              for (var t = 0; t < e.length; t++) {
                  i.toggle(e[t])
              }
              return
          }
          if (e == "mute-audio" && o) o.onclick();
          if (e == "mute-video" && u) u.onclick();
          if (e == "record-audio" && c) c.onclick();
          if (e == "record-video" && h) h.onclick();
          if (e == "stop" && f) f.onclick();
          return this
      };
      i.media = e;
      return i
  }

  function getAudioElement(e, t) {
      function p() {
          i.style.marginLeft = r.clientWidth - i.clientWidth - 7 + "px";
          i.style.marginTop = r.clientHeight - i.clientHeight - 6 + "px";
          if (h < 10) {
              h++;
              setTimeout(p, 1e3)
          } else h = 0
      }
      t = t || {};
      if (!e.nodeName || e.nodeName.toLowerCase() != "audio" && e.nodeName.toLowerCase() != "video") {
          var n = e;
          e = document.createElement("audio");
          e[!!navigator.mozGetUserMedia ? "mozSrcObject" : "src"] = !!navigator.mozGetUserMedia ? n : window.webkitURL.createObjectURL(n)
      }
      t.toggle = t.toggle || [];
      t.toggle.has = function(e) {
          return t.toggle.indexOf(e) !== -1
      };
      e.controls = false;
      e.play();
      var r = document.createElement("div");
      r.className = "media-container";
      var i = document.createElement("div");
      i.className = "media-controls";
      r.appendChild(i);
      var s = document.createElement("div");
      s.className = "control " + (t.toggle.has("mute-audio") ? "unmute-audio selected" : "mute-audio");
      i.appendChild(s);
      s.style["border-top-left-radius"] = "5px";
      s.onclick = function() {
          if (s.className.indexOf("unmute-audio") != -1) {
              s.className = s.className.replace("unmute-audio selected", "mute-audio");
              e.muted = false;
              if (t.onUnMuted) t.onUnMuted("audio")
          } else {
              s.className = s.className.replace("mute-audio", "unmute-audio selected");
              e.muted = true;
              if (t.onMuted) t.onMuted("audio")
          }
      };
      if (!t.buttons || t.buttons && t.buttons.indexOf("record-audio") != -1) {
          var o = document.createElement("div");
          o.className = "control " + (t.toggle.has("record-audio") ? "stop-recording-audio selected" : "record-audio");
          i.appendChild(o);
          o.onclick = function() {
              if (o.className.indexOf("stop-recording-audio") != -1) {
                  o.className = o.className.replace("stop-recording-audio selected", "record-audio");
                  if (t.onRecordingStopped) t.onRecordingStopped("audio")
              } else {
                  o.className = o.className.replace("record-audio", "stop-recording-audio selected");
                  if (t.onRecordingStarted) t.onRecordingStarted("audio")
              }
          }
      }
      var u = document.createElement("div");
      u.className = "control volume-slider";
      u.style.width = "auto";
      i.appendChild(u);
      var a = document.createElement("input");
      a.style.marginTop = "11px";
      a.style.width = " 200px";
      if (t.buttons && t.buttons.indexOf("record-audio") == -1) {
          a.style.width = " 241px"
      }
      a.type = "range";
      a.min = 0;
      a.max = 100;
      a.value = 100;
      a.onchange = function() {
          e.volume = "." + a.value.toString().substr(0, 1)
      };
      u.appendChild(a);
      var f = document.createElement("div");
      f.className = "control stop";
      i.appendChild(f);
      f.onclick = function() {
          r.style.opacity = 0;
          setTimeout(function() {
              if (r.parentNode) {
                  r.parentNode.removeChild(r)
              }
          }, 800);
          if (t.onStopped) t.onStopped()
      };
      f.style["border-top-right-radius"] = "5px";
      f.style["border-bottom-right-radius"] = "5px";
      var l = document.createElement("div");
      l.className = "media-box";
      r.appendChild(l);
      var c = document.createElement("h2");
      c.innerHTML = t.title || "Audio Element";
      c.setAttribute("style", "position: absolute;color: rgb(160, 160, 160);font-size: 20px;text-shadow: 1px 1px rgb(255, 255, 255);padding:0;margin:0;");
      l.appendChild(c);
      l.appendChild(e);
      r.style.width = "329px";
      l.style.height = "90px";
      c.style.width = r.style.width;
      c.style.height = "50px";
      c.style.overflow = "hidden";
      var h = 0;
      if (t.showOnMouseEnter || typeof t.showOnMouseEnter === "undefined") {
          r.onmouseenter = r.onmousedown = function() {
              p();
              i.style.opacity = 1
          };
          r.onmouseleave = function() {
              i.style.opacity = 0
          }
      } else {
          setTimeout(function() {
              p();
              setTimeout(function() {
                  i.style.opacity = 1
              }, 300)
          }, 700)
      }
      p();
      r.toggle = function(e) {
          if (typeof e != "string") {
              for (var t = 0; t < e.length; t++) {
                  r.toggle(e[t])
              }
              return
          }
          if (e == "mute-audio" && s) s.onclick();
          if (e == "record-audio" && o) o.onclick();
          if (e == "stop" && f) f.onclick();
          return this
      };
      r.media = e;
      return r
  }
  document.write('<link rel="stylesheet" href="https://cdn.WebRTC-Experiment.com/getMediaElement.css">')
  """
end
