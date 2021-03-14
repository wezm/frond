require "../spec_helper"

describe TextStats do
  describe "word_count" do
    context "empty string" do
      it { TextStats.new("").word_count.should eq 0 }
    end

    context "space separated" do
      it { TextStats.new("One Two Three").word_count.should eq 3 }
    end

    context "tab and newline separated" do
      it { TextStats.new("One\n\t\tTwo\n\t\tThree").word_count.should eq 3 }
    end
  end
end
