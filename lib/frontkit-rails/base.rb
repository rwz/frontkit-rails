require 'frontkit-rails/serializer'
require 'frontkit-rails/state'
require 'frontkit-rails/meta_container'
require 'active_support/concern'

module FrontKit
  module Base
    extend ActiveSupport::Concern
    
    included do
      # todo
    end
    
    # instance methods
    
    def frontend_state
      @_frontend_state ||= FrontKit::State.new(
        production: Rails.env.production?
        alert: alert,
        notice: notice
      )
    end
    
    def push_frontend_state(key, value)
      front_end_state[key] = value
    end
    
    def merge_fronent_state(hash)
      front_end_state.deep_merge!(hash)
    end
    
    def meta_tags_container
      @_meta_tags_container = FrontKit::MetaContainer.new
    end
    
    def push_meta_tag(hash)
      meta_tags_container.push(hash)
    end
  end
end