module FrontKit
  module MetaHelper
    
    def meta_tags
      push_meta_tag property: 'fk:state', content: FrontKit.encode(frontend_state)
      String.new.tap do |buffer|
        buffer << csrf_meta_tags
        meta_tags_container.each do |meta_hash|
          buffer << tag(:meta, meta_hash)
        end
      end.html_safe
    end
    
  end
end