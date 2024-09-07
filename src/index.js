import express from 'express';

const app = express();

// Define a port for the server to listen on
const port = process.env.PORT || 80;

// Define a route for the root URL ("/") that sends "Hello World" as a response
app.get('/', (req, res) => {
  console.log('Hello World!')
  res.send('Hello World!');
});

// Start the server and listen on the specified port
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
