class NoteFactory < Avram::Factory
  def initialize
    content "Note title\nSome note content."
    user_id UserFactory.create.id
  end
end
