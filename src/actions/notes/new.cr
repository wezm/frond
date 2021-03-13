class Notes::New < BrowserAction
  get "/notes/new" do
    html NewPage, operation: SaveNote.new
  end
end
