class Notes::Edit < BrowserAction
  get "/notes/:note_id/edit" do
    note = NoteQuery.find(note_id)
    html EditPage,
      operation: SaveNote.new(note),
      note: note
  end
end
