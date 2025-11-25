const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("hi");
});

const PORT = 3000;
app.listen(PORT, () => console.log(`Server berjalan di port ${PORT}`));