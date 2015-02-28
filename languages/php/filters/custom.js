var swig = require('swig'),
    S = require('string'),
    util = require('util');

swig.setFilter('joinFromKeysToPHPParams', function (input) {
    var array = [];
    for (var property in input) {
        array.push('$' + property);
    }
    if (array) {
        return array.join(', ');
    } else {
        return '';
    }
});