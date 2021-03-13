class Notes::Delete < BrowserAction
  delete "/notes/:note_id" do
    NoteQuery.find(note_id).delete
    flash.success = "Deleted the record"
    redirect Index
  end
end
