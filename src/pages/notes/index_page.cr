class Notes::IndexPage < MainLayout
  needs notes : NoteQuery
  quick_def page_title, "All Notes"

  def content
    h1 "All Notes"
    link "New Note", to: Notes::New
    render_notes
  end

  def render_notes
    ul do
      notes.each do |note|
        li do
          link note.title, Notes::Show.with(note)
        end
      end
    end
  end
end
