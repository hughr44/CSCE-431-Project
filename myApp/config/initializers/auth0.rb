Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'SGz4nLLzVxpT51gm9I0z0WVuROVa4Mkb',
    'IXD0B1wugaWHrvpibocjjLOf5Qcus4VbKdkRYdlPzQKmrkgOnVXuJelcWvjetlSA',
    'dev-n65vg56p.auth0.com',
    callback_path: '/auth/auth0/callback',
    authorize_params: {
      scope: 'openid email profile'
    }
  )
end