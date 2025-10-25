// Jest setup file
// This file runs before each test file

// Set test timeout
jest.setTimeout(10000);

// Global test setup
beforeAll(() => {
  console.log('Starting test suite...');
});

afterAll(() => {
  console.log('Test suite completed.');
});
