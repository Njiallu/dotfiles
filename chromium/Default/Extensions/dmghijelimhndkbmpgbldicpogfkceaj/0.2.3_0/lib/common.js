window.setTimeout(function () {
  if (app.loadReason === "install" || app.loadReason === "startup") {
    var version = config.welcome.version;
    if (!version) app.tab.open(app.homepage() + "?v=" + app.version() + "&type=install", true);
    else if (config.welcome.open) {
      if (app.version() !== version) {
        app.tab.open(app.homepage() + "?v=" + app.version() + "&p=" + version + "&type=upgrade", true);
      }
    }
    config.welcome.version = app.version();
  }
}, 3000);

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

var update = function (state) {
  app.button.label = 'Current State: ' + state.toUpperCase();
  app.button.icon = {
    "path": {
      "16": '../../data/icons/' + state + '/16.png',
      "32": '../../data/icons/' + state + '/32.png',
      "48": '../../data/icons/' + state + '/48.png',
      "64": '../../data/icons/' + state + '/64.png'
    }
  };
};

app.button.onCommand(function () {
  config.addon.state = config.addon.state === "dark" ? "light" : "dark";
  update(config.addon.state);
});

chrome.contextMenus.onClicked.addListener(function (e) {
  if (e.menuItemId === "dark-mode-context-menu") {
    var pageUrl = e.pageUrl;
    chrome.storage.local.get({"whitelist": []}, function (o) {
      var whitelist = o.whitelist;
      whitelist.push(hostname(pageUrl));
      whitelist = whitelist.filter(function (element, index, array) {return element && array.indexOf(element) === index});
      chrome.storage.local.set({"whitelist": whitelist}, function () {});
    });
  }
});

window.setTimeout(function () {update(config.addon.state)}, 300);
chrome.contextMenus.create({"contexts": ["page"], "id": "dark-mode-context-menu", "title": "Exclude from Dark Mode"});
