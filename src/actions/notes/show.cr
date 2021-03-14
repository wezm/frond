class Notes::Show < BrowserAction
  get "/notes/:note_id" do
    html ShowPage,
      note: NoteQuery.new.user_notes(current_user).find(note_id),
      notes: NoteQuery.new.user_notes(current_user)
  end
end
