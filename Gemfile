source "https://rubygems.org"

gem "fastlane"
gem "cocoapods", '~> 1.13.0'

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
