require 'spec_helper'

module Codebreaker
    describe Game do
    let(:output) { double('output').as_null_object }
    let(:game) { Game.new(output) }
    
    describe "#start" do
    it "sends a wellcome mess" do
    output.should_receive(:puts).with("Welcome to Codebreaker! \n To see the hint press h and ENTER \n To exit press q and ENTER")
    game.stub(:gets).and_return("")
    game.start
end
end

describe "#ptomtp" do
    it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter guess:')
        game.stub(:gets).and_return("")
        game.start
    end
    
    context "promtp for the Guess number" do
            it 'puts Guess number n ' do
            output.should_receive(:puts).with(/Guess number \d\ /)
            game.stub(:gets).and_return("")
            game.start
          end
    end
    
    context "when with h" do
      it "puts The first number" do
            output.should_receive(:puts).with(/The first number is:\d*\ / )
            game.stub(:gets).and_return("h")
            game.start
      end
    end
    
    context "when y - play again " do
        it "Game guess 0" do
            output.should_receive(:puts).with(/Guess number 0 /)
            game.stub(:gets).and_return("y")
            game.start
        end

    end

    context "when q - must quit" do
        it "should exit" do
            output.should raise_error SystemExit
            game.stub(:gets).and_return("q")
            game.start
        end
    end

     context "puts You have won the game..." do
      xit "make congratulations" do
            output.should_receive(:puts).with(/YOU WIN THE GAME by / )
            game.stub(:gets).and_return("")
            game.start
          end
    end   

    context "more then 30 guesses - you loos" do
        xit "make quit for n"

    end
    

end

describe Marker do
    describe "#exact_match_coutn" do
        context "with no matches" do
                marker = Marker.new('1234', '6666')
                specify {marker.exact_match_count.should == 0}
        end
        
        context "with 1 extra match" do
                marker = Marker.new('1234', '1666')
                specify {marker.exact_match_count.should == 1}
            
        end
        
        context "with 1 number match" do
                marker = Marker.new('1234', '2555')
                specify {marker.exact_match_count.should == 0}
        end
        
        context "with 1 extra match and 1 num match" do
                marker = Marker.new('1234', '1525')
                specify {marker.exact_match_count.should == 1}
        end
    end
    describe "#number match coutn" do
        context "with 1 extra match duplicated in guess" do
                marker = Marker.new('1234', '1166')
                specify {marker.number_match_count.should == 0}
        end
        
        context "with no matches" do
                marker = Marker.new('1234', '6666')
                specify {marker.number_match_count.should == 0}
        end
        context "with 1 number match" do
                marker = Marker.new('1234', '6661')
                specify {marker.number_match_count.should == 1}
        end
        context "with 1 exact match do" do
                marker = Marker.new('1234', '1666')
                specify {marker.number_match_count.should == 0}
        end
        context "with 1 extra match and 1 number march" do
                marker = Marker.new('1234', '1626')
                specify {marker.number_match_count.should == 1}
        end
    end
end
end
end
