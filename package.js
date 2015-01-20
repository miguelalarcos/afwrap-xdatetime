Package.describe({
  name: 'miguelalarcos:afwrap-xdatetime',
  summary: 'wrap over xdatetime so it works ok with autoform',
  version: '0.1.4',
  git: 'https://github.com/miguelalarcos/afwrap-xdatetime.git'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.2.1');
  api.use('coffeescript', 'client');
  api.use('jquery', 'client');
  api.use('templating', 'client');
  api.use('aldeed:autoform@4.2.2', 'client');
  api.use('momentjs:moment@2.8.4', 'client');
  api.use('miguelalarcos:xdatetime@0.1.3', 'client');
  api.addFiles('wrap.coffee', 'client');
});

