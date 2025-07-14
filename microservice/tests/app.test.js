const request = require('supertest');
const app = require('../src/index');

describe('POST /DevOps', () => {
  it('should return success message and JWT', async () => {
    const res = await request(app)
      .post('/DevOps')
      .set('X-Parse-REST-API-Key', '2f5ae96c-b558-4c7b-a590-a501ae1c3f6c')
      .send({
        message: 'This is a test',
        to: 'Juan Perez',
        from: 'Rita Asturia',
        timeToLifeSec: 45
      });

    expect(res.statusCode).toBe(200);
    expect(res.body.message).toBe('Hello Juan Perez your message will be send');
    expect(res.headers['x-jwt-kwy']).toBeDefined();
  });

  it('should return ERROR for non-POST methods', async () => {
    const res = await request(app).get('/DevOps');
    expect(res.statusCode).toBe(405);
    expect(res.text).toBe('ERROR');
  });
});

