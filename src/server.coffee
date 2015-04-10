http = require("http")
_ = require("lodash")
controller = require("./controller")

module.exports = =>  
  port = process.env.PORT || 8081

  http
    .createServer (request, response) =>
      data = ""
      request.on "data", (chunk) => data += chunk
      request.on "end", =>
        req = _.pick(request, ["method", "url", "headers"])
        req.body = data

        controller req, response
    .listen port

  console.log "[!] Listening in port #{port}"