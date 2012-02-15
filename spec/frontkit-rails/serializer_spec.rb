# encoding: UTF-8

require 'spec_helper'

describe FrontKit::Serializer do
  
  STATE_HASH = {
    jp: '岩国に空港ができるの？ 採算取れるのかな？',
    ru: 'тестовая строка с кириллическими символами',
    symbols: '!@#$%^&*()~{}|":<>?'
  }.stringify_keys
  
  it 'serializes hashes to base 64 string' do
    FrontKit.encode(STATE_HASH).should == 'eyJqcCI6IuWyqeWbveOBq+epuua4r+OBjOOBp+OBjeOCi+OBru+8nyDmjqHnrpflj5bjgozjgovjga7jgYvjgarvvJ8iLCJydSI6ItGC0LXRgdGC0L7QstCw0Y8g0YHRgtGA0L7QutCwINGBINC60LjRgNC40LvQu9C40YfQtdGB0LrQuNC80Lgg0YHQuNC80LLQvtC70LDQvNC4Iiwic3ltYm9scyI6IiFAIyQlXiYqKCl+e318XCI6PD4/In0='
  end
  
  it 'unserializes base 64 string back to hashes' do
    FrontKit.decode('eyJqcCI6IuWyqeWbveOBq+epuua4r+OBjOOBp+OBjeOCi+OBru+8nyDmjqHnrpflj5bjgozjgovjga7jgYvjgarvvJ8iLCJydSI6ItGC0LXRgdGC0L7QstCw0Y8g0YHRgtGA0L7QutCwINGBINC60LjRgNC40LvQu9C40YfQtdGB0LrQuNC80Lgg0YHQuNC80LLQvtC70LDQvNC4Iiwic3ltYm9scyI6IiFAIyQlXiYqKCl+e318XCI6PD4/In0=').should == STATE_HASH
  end
  
  it 'garantees that serializing/unserializing generates the same value' do
    FrontKit.decode(FrontKit.encode(STATE_HASH)).should == STATE_HASH
  end
  
end