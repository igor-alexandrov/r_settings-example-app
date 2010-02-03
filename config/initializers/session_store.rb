# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rsettings-example-app_session',
  :secret      => '240b97f71e88395b7c13e88eb5547cf075727c7522d2d8694f9887c2002dce564a895a4fd16d8271dcb15ee0f1231ae6cd5b7f5a65b38f3b18022fae0d6b39b7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
