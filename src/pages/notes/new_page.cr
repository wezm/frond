class Notes::NewPage < MainLayout
  needs operation : SaveNote
  quick_def page_title, "New Note"

  def content
    h1 "New Note"
    render_note_form(operation)
  end

  def render_note_form(op)
    form_for Notes::Create do
      # Edit fields in src/components/notes/form_fields.cr
      mount Notes::FormFields, op

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
