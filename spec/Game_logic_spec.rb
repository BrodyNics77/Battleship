require './lib/ship'
require './lib/cell'
require './lib/Game_logic'

RSpec.configure do |config| 
    config.formatter = :documentation
    end

RSpec.describe 'Game_logic' do
    before(:each) do
        @computer = Compter.new
    end

    it '#initialze computer and turn' do
        expect(@computer). to be_an_instance_of(Computer)
        expect(@turn). to be_an_instance_of(Turn)

    end

    it "Describes"
end


# Need to build a computer to play against, and maybe a turn function?
# 