module.exports = {
  testEnvironment: 'node',
  testMatch: ['**/test_*.js'],
  collectCoverage: true,
  coverageDirectory: 'coverage',
  coverageReporters: ['text', 'lcov', 'html'],
  verbose: true,
  setupFilesAfterEnv: ['<rootDir>/jest.setup.js']
};
