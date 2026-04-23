const PULSEIQ_API_KEY = process.env.PULSEIQ_API_KEY;
const PULSEIQ_PROJECT_ID = process.env.PULSEIQ_PROJECT_ID || '69ea6b8b2051b66d00a63e5b';
const PULSEIQ_ENDPOINT = process.env.PULSEIQ_ENDPOINT || 'https://pulseiq-ffio.onrender.com/api/ingest/event';

async function track(eventName, userId = null, properties = {}, anonymousId = 'server_event') {
  if (!PULSEIQ_API_KEY || !eventName) {
    return;
  }

  try {
    await fetch(PULSEIQ_ENDPOINT, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': PULSEIQ_API_KEY,
      },
      body: JSON.stringify({
        projectId: PULSEIQ_PROJECT_ID,
        eventName,
        userId: userId || undefined,
        anonymousId,
        properties,
      }),
    });
  } catch {}
}

module.exports = { track };
