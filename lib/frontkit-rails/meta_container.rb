module FrontKit
  class MetaContainer
    VALID_ATTRS   = %w(name property content)
    ESCAPE_ATTRS  = %w(content)
    
    def initialize
      @container = []
    end
    
    def push(hash)      
      escaped_hash = hash.inject(Hash.new) do |memo, (key, value)|
        key = key.to_s.downcase
        value = CGI.escapeHTML(value) if key.in?(ESCAPE_ATTRS)
        memo[key] = value; memo
      end
      
      invalid_attrs = escaped_hash.keys - VALID_ATTRS
      if invalid_attrs.any?
        raise ArgumentError, "Illegal meta tag attributes: #{invalid_attrs * ', '}"
      end

      @container.push(escaped_hash)
    end
    
    def each(&block)
      @container.uniq.each { |escaped_hash| block.call(escaped_hash) }
    end
  end
end