Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'E4BS7yDQdMG3nBPVOn5F33ONkGCLeN4y',
    'YOUR_CLIENT_SECRET',
    'dev-n65vg56p.auth0.com',
    callback_path: '/auth/auth0/callback',
    authorize_params: {
      scope: 'openid email profile'
    }
  )
end