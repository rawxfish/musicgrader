Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  provider :facebook, '239666966156370', 'e5690f028390d7241c0206cc3382fedc'
 
  # If you want to also configure for additional login services, they would be configured here.
end