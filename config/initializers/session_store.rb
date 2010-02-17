# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_FileUploadProgress_session',
  :secret      => 'f67810ca7b0e94c3f1953ad218556fce87cfa764630e598362b0c4358ca4c7068095de6a2fc61362f07f2ac2b9f285d79e37eeda2a0c720cf7812cb0748f5da4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
