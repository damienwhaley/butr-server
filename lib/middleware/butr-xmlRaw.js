/*
 * Butr Universal Travel Reservations
 * A bleeding edge business management system for the travel industry.
 * 
 * Copyright (C) 2012 Whalebone Studios and contributors.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/**
 * Contributed module dependencies.
 */

var http = require('http');

/**
 * Exports a function to handle the text/xml posting data. Returns a string in the
 * req.body member.
 * @author Damien Whaley <damien@whalebonestudios.com>
 * @param options
 *   - Object containing the options. The strict option if not passed or
 *     set to true (default is true) checks to make sure that the first
 *     five chars are "<?xml".
 * @return function
 * @api public
 */
exports = module.exports = function(options){
  var options = options || {}
    , strict = options.strict === false
      ? false
      : true;

  return function json(req, res, next) {
    if (req._body) return next();
    req.body = req.body || '';

    // check Content-Type
    if ('text/xml' != mime(req)) return next();

    // flag as parsed
    req._body = true;

    // assemble
    var buf = '';
    req.setEncoding('utf8');
    req.on('data', function(chunk){ buf += chunk; });
    req.on('end', function(){
      if (strict && buf.substring(0, 5) !== '<?xml') return next(error(400));   	  
      req.body = buf;
      next();
    });
  };
};

/**
 * Returns the mime type of the current request
 * @author TJ Holowaychuk <tj@vision-media.ca>
 * @param req
 *   - Object containing the request
 * @returns
 *   - String containing the mime type
 */
function mime(req) {
  var str = req.headers['content-type'] || '';
  return str.split(';')[0];
}

/**
 * Returns the mime type of the current request
 * @author TJ Holowaychuk <tj@vision-media.ca>
 * @param req
 *   - Object containing the request
 * @returns
 *   - String containing the mime type
 */
function error(code){
  var err = new Error(http.STATUS_CODES[code]);
  err.status = code;
  return err;
}