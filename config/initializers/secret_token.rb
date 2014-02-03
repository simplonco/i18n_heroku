# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
HerokuApp::Application.config.secret_key_base = 'e8c92b3133e971b9fc4741070904f84de43a34740db268081e0a186e6e5eb5645c3d8aa0ad1b6fe2d750099372f8a76e52f803d243e2102fc247960fb904e7d8'
