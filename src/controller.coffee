azure = require("azure-storage")
Promise = require("bluebird")
Promise.promisifyAll azure

module.exports = (request, response) =>
  console.log new Date()
  console.log JSON.stringify request
  console.log "----------"

  enqueue = (message) =>
    service = azure.createQueueService process.env.STORAGE_NAME, process.env.STORAGE_KEY

    service.createQueueIfNotExistsAsync process.env.QUEUE_NAME
    .then -> service.createMessageAsync process.env.QUEUE_NAME, JSON.stringify(message)

##########################

  enqueue request
  .then (algo) ->
    response.writeHead 200
    response.end()
  .catch (err) ->
    response.writeHead err.statusCode, { "Content-Type": "application/json" }
    response.end JSON.stringify err
