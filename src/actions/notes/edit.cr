class Notes::Edit < BrowserAction
  get "/notes/:note_id/edit" do
    note = NoteQuery.new.user_notes(current_user).find(note_id)
    html EditPage,
      operation: SaveNote.new(note),
      note: note,
      notes: NoteQuery.new.user_notes(current_user)
  end
end
