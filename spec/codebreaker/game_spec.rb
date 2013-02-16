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
    
    context "when press h " do
          it "should returt The first number is:" do
            output.should_receive(:puts).with('The first number is:')
            game.stub(:gets).and_return("h")
            game.prompt
        end
    end
    
    context "when win" do
      xit "make congratulations"
    end
    
    context "when y - play again " do
        xit "make y in play again"
    end
    
    context "when n - must be quit" do
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
                marker = Marker.new('1234', '1155')
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
                marker = Marker.new('1234', '1555')
                specify {marker.number_match_count.should == 0}
        end
        context "with 1 extra match and 1 number march" do
                marker = Marker.new('1234', '1525')
                specify {marker.number_match_count.should == 1}
        end
    end
end
end
end
