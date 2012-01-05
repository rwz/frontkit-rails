require 'base64'
require 'multi_json'

module FrontKit
  class Serializer
    def encode(hash)
      Base64.encode64(MultiJson.encode(hash)).strip
    end
    
    def decode(str)
      MultiJson.decode(Base64.decode64(str))
    end
  end
  
  class << self
    attr_accessor :serializer
    delegate :encode, :decode, to: 'serializer'
  end
  
  self.serializer = Serializer.new
end