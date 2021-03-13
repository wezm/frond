class Notes::Index < BrowserAction
  get "/notes" do
    html IndexPage, notes: NoteQuery.new.user_notes(current_user)
  end
end
