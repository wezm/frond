class Notes::Create < BrowserAction
  post "/notes" do
    SaveNote.create(params, user_id: current_user.id) do |operation, note|
      if note
        flash.success = "Note saved"
        redirect Show.with(note.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
