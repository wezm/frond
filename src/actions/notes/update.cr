class Notes::Update < BrowserAction
  put "/notes/:note_id" do
    note = NoteQuery.new.user_notes(current_user).find(note_id)
    SaveNote.update(note, params) do |operation, updated_note|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(updated_note.id)
      else
        flash.failure = "It looks like the form is not valid"
        notes = NoteQuery.new.user_notes(current_user)
        html EditPage, operation: operation, note: updated_note, notes: notes
      end
    end
  end
end
