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
    
    describe 'health' do
        it 'exists' do
            expect(@cruiser.health).to eq(3)
        end

        it 'means the ship is not sunk' do
            expect(@cruiser.sunk?).to eq false
        end

        it '#hit ship can lose health' do
            @cruiser.hit

            expect(@cruiser.health).to eq(2)
        end
        
        it '#sunk? wont be sunk if health is over 0' do
            @cruiser.hit
            @cruiser.hit

            expect(@cruiser.health).to eq(1)
            expect(@cruiser.sunk?).to eq false

            @cruiser.hit

            expect(@cruiser.health).to eq(0)
            expect(@cruiser.sunk?).to eq true
        end
    end
end