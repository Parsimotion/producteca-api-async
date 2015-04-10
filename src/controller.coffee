azure = require("azure-storage")

module.exports = (request, response) =>
  console.log JSON.stringify request
  
  azure.createQueueService process.env.STORAGE_NAME, process.env.STORAGE_KEY
  
  enqueue = (message) =>
    queue.createMessage process.env.QUEUE_KEY, JSON.stringify(message), =>
  
  end = =>
    response.writeHead 200, { "Content-Type": "text/plain" }
    response.end "ok"

  #---

  enqueue request