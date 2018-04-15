var n_dark_themes = 34;
var tab = document.location.href;
var link = document.getElementById("dark-mode");
var style = document.getElementById("dark-mode-custom-style");
var head = document.documentElement || document.head || document.querySelector("head");

var hostname = function (url) {
  url = url.replace("www.", '');
  var s = url.indexOf("//") + 2;
  if (s > 1) {
    var o = url.indexOf('/', s);
    if (o > 0) return url.substring(s, o);
    else {
      o = url.indexOf('?', s);
      if (o > 0) return url.substring(s, o);
      else return url.substring(s);
    }
  } else return url;
};

var custom = {
  "ebay": ".ebay.com",
  "yahoo": "www.yahoo.",
  "twitch": ".twitch.tv",
  "github": "github.com",
  "docs": "docs.google.",
  "bing": "www.bing.com",
  "amazon": "www.amazon.",
  "gmail": "mail.google.",
  "tumblr": "www.tumblr.",
  "twitter": "twitter.com",
  "inbox": "inbox.google.",
  "drive": "drive.google.",
  "sites": "sites.google.",
  "youtube": "www.youtube.",
  "dropbox": "www.dropbox.",
  "reddit": "www.reddit.com",
  "maps": ".google.com/maps/",
  "facebook": "www.facebook.",
  "wikipedia": "wikipedia.org",
  "instagram": "www.instagram.",
  "duckduckgo": "duckduckgo.com",
  "stackoverflow": "stackoverflow.com"
};

if (!link) {
  link = document.createElement("link");
  link.setAttribute("type", "text/css");
  link.setAttribute("id", "dark-mode");
  link.setAttribute("rel", "stylesheet");
  if (head) head.appendChild(link);
}

if (!style) {
  style = document.createElement("style");
  style.setAttribute("type", "text/css");
  style.setAttribute("id", "dark-mode-custom-style");
  if (head) head.appendChild(style);
}

var edit = function (href, txt) {
  link.setAttribute("href", href);
  style.textContent = txt;
};

var update = function () {
  var tmp = {};
  for (var name in custom) tmp[name] = true;
  for (var i = 1; i <= n_dark_themes; i++) tmp['dark_' + i] = false;
  tmp["dark_1"] = true;
  tmp["whitelist"] = [];
  tmp["state"] = "light";
  chrome.storage.local.get(tmp, function (e) {
    var id = null;
    var host = hostname(tab);
    /* disable dark mode for chrome newtab page */
    if (tab.indexOf("/chrome/newtab") !== -1) return edit('', '');
    for (var i = 0; i < e.whitelist.length; i++) {
      if (e.whitelist[i] === host) return edit('', '');
    }
    /*  */
    for (var i = 1; i <= n_dark_themes; i++) {
      if (e['dark_' + i]) {
        id = i;
        break;
      }
    }
    /*  */
    for (var name in custom) {
      if (e[name]) {
        if (tab.indexOf(custom[name]) !== -1) {
          var href = e.state === "dark" ? chrome.runtime.getURL("data/content_script/custom/" + name + ".css") : '';
          edit(href, '');
          return;
        }
      }
    }
    /*  */
    if (e.state === "dark") {
      if (id) {
        var href = chrome.runtime.getURL('data/content_script/general/dark_' + id + '.css');
        if (id === 34) chrome.storage.local.get({"custom": ''}, function (e) {edit('', e.custom)});
        else edit(href, '');
      } else edit('', '');
    } else edit('', '');
  });
};

var init = function (e) {
  if (e) tab = e;
  update();
};

var observer = new MutationObserver(function (e) {
  var link_tmp = document.getElementById("dark-mode");
  if (!link_tmp) {
    if (head) head.appendChild(link);
  }
  /*  */
  observer.disconnect();
});

if (window === window.top) update();
else chrome.runtime.sendMessage({"message": "top"}, init);

chrome.storage.onChanged.addListener(update);
observer.observe(document, {"childList": true, "subtree": true});
