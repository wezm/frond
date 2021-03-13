class Notes::Show < BrowserAction
  get "/notes/:note_id" do
    html ShowPage, note: NoteQuery.find(note_id)
  end
end
