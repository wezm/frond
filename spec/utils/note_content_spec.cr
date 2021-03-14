require "../spec_helper"

describe NoteContent do
  describe "sub_title" do
    context "content is one line" do
      it { NoteContent.new("One line").sub_title.should eq "" }
    end

    context "content is multiple lines" do
      it { NoteContent.new("One line\nAnother line").sub_title.should eq "Another line" }
    end

    context "content is multiple lines longer than 100 chars" do
      it do
        content = (1..100).map { |n| "Line #{n}" }.join("\n")
        expected = (2..5).map { |n| "Line #{n}" }.join(" ")[...50]
        NoteContent.new(content).sub_title.should eq expected
      end
    end

    context "second line is longer than 50 chars" do
      it do
        content = "abcdefghijklmnopqrstuvwxyz" * 2
        NoteContent.new("Title\n" + content).sub_title.should eq content[...50]
      end
    end
  end
end
