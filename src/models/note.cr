class Note < BaseModel
  table do
    column content : String
    column deleted_at : Time?

    belongs_to user : User
  end

  def title
    NoteContent.new(content).title
  end

  def sub_title
    NoteContent.new(content).sub_title
  end

  def word_count : UInt32
    TextStats.new(content).word_count
  end
end
