class Notes::Index < BrowserAction
  get "/notes" do
    html IndexPage, notes: NoteQuery.new
  end
end
