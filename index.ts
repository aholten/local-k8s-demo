const server = Bun.serve({
  port: 3000,
  fetch(req) {
    return new Response("You just deployed an HTTP server to the web with k8s!");
  },
});

console.log(`Listening on http://localhost:${server.port} ...`);
