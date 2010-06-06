# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mediabkp_session',
  :secret      => '0c576254a51414d16e380ebc0e343b27049dc93672ea69147efbf1ba1cb1acbb7886ecced46981bdf4b9f69c7cd7dd7911f478410aec6a7e198b1c83a24718a4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
