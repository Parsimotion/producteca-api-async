module.exports = (req, res) =>
  console.log JSON.stringify req

  res.writeHead 200, { "Content-Type": "text/plain" }
  res.end "ok"