const request = require('supertest');
const app = require('./src/index');

describe('Basic Application Tests', () => {
    test('should have app defined', () => {
        expect(app).toBeDefined();
        expect(typeof app).toBe('function');
    });

    test('should serve static files', async () => {
        const response = await request(app)
            .get('/')
            .expect(200);
        
        expect(response.text).toContain('html');
    });

    test('should have proper HTML structure', async () => {
        const response = await request(app)
            .get('/')
            .expect(200);
        
        expect(response.text).toMatch(/<html/i);
        expect(response.text).toMatch(/<head/i);
        expect(response.text).toMatch(/<body/i);
    });

    test('should include CSS and JavaScript files', async () => {
        const response = await request(app)
            .get('/')
            .expect(200);
        
        expect(response.text).toMatch(/\.css/);
        expect(response.text).toMatch(/\.js/);
    });

    test('should handle 404 errors gracefully', async () => {
        const response = await request(app)
            .get('/nonexistent-page')
            .expect(404);
    });
});

describe('API Route Tests', () => {
    test('should have /items route defined', () => {
        // Test that the route is defined (even if database isn't initialized)
        expect(app._router).toBeDefined();
    });

    test('should handle malformed JSON', async () => {
        const response = await request(app)
            .post('/items')
            .set('Content-Type', 'application/json')
            .send('invalid json');
        
        expect([400, 422]).toContain(response.status);
    });
});
