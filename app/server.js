const express = require('express');
const app = express();
const PORT = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.send("🚀 CI/CD Working — Auto Deployed by Naveen!");
});

app.listen(PORT, () => console.log(`App listening on ${PORT}`));
