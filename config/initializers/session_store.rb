# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_osurb_session',
  :secret      => 'ae2e7331bd0b329f7942776dfdd090e4676b1db6bbcc3d7fce41fef7c0854be535777cd53f01aa06e48fa3563dc501a095c6d240fcd1f1216fd6853ef604946c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
