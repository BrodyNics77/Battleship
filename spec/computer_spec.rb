require './spec/spec_helper'

RSpec.configure do |config|
    config.formatter = :documentation
    end

RSpec.describe 'Computer' do
    before(:each) do
        @computer = Computer.new
    end

    it 'exists' do
        expect(@computer).to be_a(Computer)
    end

end