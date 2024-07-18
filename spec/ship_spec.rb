require './lib/ship'

RSpec.configure do |config|
    config.formatter = :documentation
    end

RSpec.describe 'Ship' do
    before(:each) do
        @cruiser = Ship.new("Cruiser", 3)
    end

    it 'exists' do
        expect(@cruiser).to be_a(Ship)
    end

    it 'has a name and length' do
        expect(@cruiser.name).to eq("Cruiser")
        expect(@cruiser.length).to eq(3)
    end
    
    describe 'Ship health' do
        it 'exists' do
            expect(@cruiser.health).to eq(3)
        end
    end
end