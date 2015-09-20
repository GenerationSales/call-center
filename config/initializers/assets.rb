# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( frontend.css )
Rails.application.config.assets.precompile += %w( frontend.js )
Rails.application.config.assets.precompile += %w( plugins/boostrapv3/css/bootstrap-theme.min.css )
Rails.application.config.assets.precompile += %w( css/animate.min.css )
Rails.application.config.assets.precompile += %w( css/style.css )
Rails.application.config.assets.precompile += %w( css/responsive.css )
Rails.application.config.assets.precompile += %w( css/custom-icon-set.css )
Rails.application.config.assets.precompile += %w( jquery.js )
Rails.application.config.assets.precompile += %w( bootstrap-sprockets.js )
Rails.application.config.assets.precompile += %w( plugins/pace/pace.min.js )
Rails.application.config.assets.precompile += %w( plugins/jquery-validation/js/jquery.validate.min.js )
Rails.application.config.assets.precompile += %w( js/login.js )
Rails.application.config.assets.precompile += %w( plugins/boostrapv3/css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( plugins/font-awesome/css/font-awesome.css )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
