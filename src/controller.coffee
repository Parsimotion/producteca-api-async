azure = require("azure-storage")

module.exports = (request, response) =>
  console.log new Date()
  console.log JSON.stringify request
  console.log "----------"
  
  enqueue = (message) =>
    azure
      .createQueueService process.env.STORAGE_NAME, process.env.STORAGE_KEY
      .createMessage process.env.QUEUE_NAME, JSON.stringify(message), =>
  
  end = =>
    response.writeHead 200, { "Content-Type": "text/plain" }
    response.end "ok"

  #---

  enqueue request