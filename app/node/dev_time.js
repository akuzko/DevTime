require.extensions['.coffee'] = function(module, filename) {
  var content = require('coffee-script').compile(require('fs').readFileSync(filename, 'utf8'));
  module._compile(content, filename);
};
require('./dev_time.server.coffee').start();
