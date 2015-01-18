Package.describe({
  name: 'miguelalarcos:afwrap-xdatetime',
  summary: 'wrap over xdatetime so it works ok with autoform',
  version: '0.1.0',
  git: ' /* Fill me in! */ '
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.2.1');
  api.use('coffeescript', 'client');
  api.use('jquery', 'client');
  api.use('templating', 'client');
  api.use('aldeed:autoform', 'client');
  api.use('momentjs:moment', 'client');
  api.use('miguelalarcos:xdatetime', 'client');
  api.addFiles('wrap.coffee', 'client');
});

