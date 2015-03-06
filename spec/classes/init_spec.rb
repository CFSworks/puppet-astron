require 'spec_helper'
describe 'astron' do

  context 'with defaults for all parameters' do
    it { should contain_class('astron') }
  end
end
