class NoteQuery < Note::BaseQuery
  def initialize
    defaults &.updated_at.desc_order
  end

  def user_notes(user : User)
    user_id(user.id).not_deleted
  end

  def not_deleted
    deleted_at.is_nil
  end
end
