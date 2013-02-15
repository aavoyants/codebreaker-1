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
        it "mus be only one hint" do
            pending
        end
    end
    
    context "when win" do
        it "shold say..." do
            pending "make congratulations"
        end
    end
    
    it "when y - play again " do
        pending "make y in play again"
    end
    
    it "when n - must be quit" do
        pending "make quit for n"
    end
end

describe Marker do
    describe "#exact_match_coutn" do
        context "with no matches" do
            it "returns 0" do
                marker = Marker.new('1234', '6666')
                marker.exact_match_count.should == 0
            end
        end
        
        context "with 1 extra match" do
            it "return 1" do
                marker = Marker.new('1234', '1666')
                marker.exact_match_count.should == 1
            end
        end
        
        context "with 1 number match" do
            it "return 0" do
                marker = Marker.new('1234', '2555')
                marker.exact_match_count.should == 0
            end
        end
        
        context "with 1 extra match and 1 num match" do
            it "returs 1" do
                marker = Marker.new('1234', '1525')
                marker.exact_match_count.should == 1
            end
        end
    end
    describe "#number match coutn" do
        context "with 1 extra match duplicated in guess" do
            it "returns 0" do
                marker = Marker.new('1234', '1155')
                marker.number_match_count.should == 0
            end
        end
        
        context "with no matches" do
            it "returs 0" do
                marker = Marker.new('1234', '6666')
                marker.number_match_count.should == 0
            end
        end
        context "with 1 number match" do
            it "returns 1" do
                marker = Marker.new('1234', '6661')
                marker.number_match_count.should == 1
            end
        end
        context "with 1 exact match do" do
            it "returns 0" do
                marker = Marker.new('1234', '1555')
                marker.number_match_count.should == 0
            end
        end
        context "with 1 extra match and 1 number march" do
            it "returns 1" do
                marker = Marker.new('1234', '1525')
                marker.number_match_count.should == 1
            end
        end
    end
end
end
end
