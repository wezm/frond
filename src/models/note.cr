class Note < BaseModel
  table do
    column content : String
    column deleted_at : Time?

    belongs_to user : User
  end

  def title
    content.each_line.first { "" }
  end
end