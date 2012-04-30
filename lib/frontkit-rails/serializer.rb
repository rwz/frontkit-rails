require 'base64'
require 'multi_json'
require 'active_support/core_ext/module/delegation'

module FrontKit
  class Serializer
    def encode(hash)
      Base64.encode64(MultiJson.dump(hash)).gsub(/\s+/, '')
    end
    
    def decode(str)
      MultiJson.load(Base64.decode64(str))
    end
  end
  
  class << self
    attr_accessor :serializer
    delegate :encode, :decode, to: 'serializer'
  end
  
  self.serializer = Serializer.new
end