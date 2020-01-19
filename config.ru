# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
images_dir = "img"
relative_assets = true