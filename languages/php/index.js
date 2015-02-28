var swig = require('swig'),
    util = require('util'),
    S = require('string');

var includeFolder = require('include-folder'),
    folder = includeFolder(__dirname + '/templates');

var render = function (file, params) {
    //return swig.renderFile(util.format('%s/templates/%s.swig', __dirname, file), params);

    //FIXME el nombre del archivo debería ser el mismo
    var fileName = S(file).replace('.', ' ').camelize().s;
    var template = swig.compile(folder[fileName], params);
    return template(params);

};

module.exports = function (ast, options) {
    return {
        files: {
            'api.php': render('resource', ast)
        }
    };
};