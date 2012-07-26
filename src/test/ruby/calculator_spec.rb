require 'java'
java_import 'example.Calculator'

describe Calculator do
  it "should add two numbers together" do
    Calculator.new.plus(1, 1).should == 2
  end
end
