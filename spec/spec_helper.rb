require 'rspec'
require File.expand_path '../../lib/frontkit-rails/base', __FILE__

RSpec.configure do |config|
  config.color_enabled = true
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end