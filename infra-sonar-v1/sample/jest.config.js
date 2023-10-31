module.exports = {
  preset: "ts-jest",
  testEnvironment: "node",
  coverageDirectory: "coverage",
  collectCoverage: true,
  coverageReporters: ["text", "html", "lcov"],
};
