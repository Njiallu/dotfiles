var config = {};

config.welcome = {
  set open (val) {app.storage.write('support', val)},
  get version () {return app.storage.read("version")},
  set version (val) {app.storage.write("version", val)},
  get open () {
    var flag = navigator.userAgent.toLowerCase().indexOf('firefox') !== -1;
    return app.storage.read('support') !== undefined ? app.storage.read('support') : (flag ? false : true);
  }
};

config.addon = {
  set state (val) {app.storage.write("state", val)},
  get state () {return app.storage.read("state") !== undefined ? app.storage.read("state") : "light"}
};
