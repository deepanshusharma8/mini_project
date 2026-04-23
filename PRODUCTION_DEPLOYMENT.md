# Production Deployment Guide

## Backend Setup

### Environment Configuration
Update `.env.production` with production values:
```env
NODE_ENV=production
PORT=5000
MONGODB_URI=mongodb+srv://user:password@cluster.mongodb.net/interview-portal
JWT_SECRET=your_secure_jwt_secret_key_here
JWT_EXPIRE=7d
CORS_ORIGIN=https://yourdomain.com
```

### Deployment Steps
1. Install dependencies: `npm install`
2. Build/start: `npm start`
3. Use PM2 for process management (optional):
   ```bash
   npm install -g pm2
   pm2 start server.js --name interview-portal
   pm2 save
   ```

## Frontend Setup

### Environment Configuration
Update `.env.production` with production values:
```env
VITE_API_URL=https://api.yourdomain.com/api
VITE_APP_NAME=PrepMaster
VITE_APP_VERSION=1.0.0
```

### Build & Deploy
1. Install dependencies: `npm install`
2. Build: `npm run build`
3. Deploy `dist/` folder to static hosting (Vercel, Netlify, AWS S3, etc.)

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `POST /api/auth/logout` - Logout user

### Questions
- `GET /api/questions` - Get all questions
- `GET /api/questions?domain=javascript` - Get questions by domain
- `GET /api/questions/:id` - Get single question

## Security Best Practices

1. **Environment Variables**: Never commit `.env.production` to version control
2. **CORS**: Whitelist only authorized domains
3. **JWT Token**: Keep secret key secure and rotate regularly
4. **HTTPS**: Always use HTTPS in production
5. **Rate Limiting**: Consider implementing rate limiting middleware
6. **Input Validation**: Validate and sanitize all inputs
7. **Error Handling**: Don't expose sensitive error details in production

## Monitoring

- Monitor API response times using request metadata
- Set up error logging and alerting
- Monitor database connection pool
- Track authentication failures

## Scaling Considerations

1. Use load balancer for multiple backend instances
2. Implement database replication/backup
3. Use CDN for static frontend assets
4. Cache frequently accessed data (Redis)
5. Implement job queues for async operations
