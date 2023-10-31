const scanner = require("sonarqube-scanner");

const currentVersion = new Date().getTime().toString();

console.log(currentVersion);

scanner(
  {
    serverUrl: "http://localhost:9000",
    token: "sqp_38b07c2d2a162411bc8ec9eca611a14ffb3f3a5d",
    options: {
      "sonar.projectVersion": currentVersion,
    },
  },
  () => process.exit()
);
