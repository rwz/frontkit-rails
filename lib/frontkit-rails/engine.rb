require 'frontkit-rails/base'

module FrontKit
  class Engine < ::Rails::Engine

    config.to_prepare do
      ApplicationController.send :include, FrontKit::Base
    end

  end
end