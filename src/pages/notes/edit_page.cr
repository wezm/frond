class Notes::EditPage < MainLayout
  needs operation : SaveNote
  needs note : Note
  quick_def page_title, "Edit Note with id: #{note.id}"

  def content
    link "Back to all Notes", Notes::Index
    h1 "Edit Note with id: #{note.id}"
    render_note_form(operation)
  end

  def render_note_form(op)
    form_for Notes::Update.with(note.id) do
      # Edit fields in src/components/notes/form_fields.cr
      mount Notes::FormFields, op

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
