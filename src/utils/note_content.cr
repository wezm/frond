class NoteContent
  LIMIT = 50

  def initialize(@content : String)
  end

  def title : String
    @content.each_line.first { "" }
  end

  def sub_title : String
    @content.each_line.skip(1).first(4).join(" ").each_char.first(LIMIT).join
  end
end
