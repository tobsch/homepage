# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tobias-schlottke_session',
  :secret      => '60f29ba2b5a8d98617fd223a39151b8114c84c51eed0eabc8b5de8f7f98d98515a5ef4fc9eed600957ce927f895e373d7465cc211dd633f0cb30c49fa12f2311'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
