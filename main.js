const express = require("express");
const app = express();

const { exec } = require("child_process");

const port = 3000;

app.get("/", (req, res) => {
  const { param1 } = req.query;
  exec(`bash ./main.sh ${param1}`, (err, stdout, stderr) => {
    console.log(`================ err: ${err}\n`);
    console.log(`================ stdout: ${stdout}\n`);
    console.log(`================ stderr: ${stderr}\n`);
    if (err) {
      res.status(500).json({
        result: "failed",
        message: stderr
      });
    } else {
      res.status(200).json({
        result: "success",
        message: stdout
      });
    }
  });
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
