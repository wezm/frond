class Notes::Delete < BrowserAction
  delete "/notes/:note_id" do
    note = NoteQuery.new.user_notes(current_user).find(note_id)
    SaveNote.update(note, deleted_at: Time.utc) do |operation, updated_note|
      if operation.saved?
        flash.success = "Note deleted"
      else
        flash.failure = "Unable to delete note"
      end
      redirect Index
    end
  end
end
