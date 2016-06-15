# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( log_in.js )
Rails.application.config.assets.precompile += %w( inside/neko.css )
Rails.application.config.assets.precompile += %w( inside/risu.css )
Rails.application.config.assets.precompile += %w( inside/usagi.css )
Rails.application.config.assets.precompile += %w( inside/azarashi.css )
Rails.application.config.assets.precompile += %w( inside/help.css )
Rails.application.config.assets.precompile += %w( inside/kujira.css )
Rails.application.config.assets.precompile += %w( inside/kuma.css )
Rails.application.config.assets.precompile += %w( inside/log_in.css )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
