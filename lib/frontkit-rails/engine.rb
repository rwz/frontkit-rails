require 'frontkit-rails/base'

module FrontKit
  class Engine < ::Rails::Engine
    initializer 'frontkit.add_controller_helpers' do
      ApplicationController.send :include, FrontKit::Base
    end
  end
end