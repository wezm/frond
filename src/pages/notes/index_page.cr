class Notes::IndexPage < MainLayout
  needs notes : NoteQuery
  quick_def page_title, "All Notes"

  def content
    h1 "Notes"
    link "New Note", to: Notes::New
    render_notes
  end

  def render_notes
    main class: "main" { text "No note selected" }
    div class: "aside aside-1" do
      ul class: "note-list" do
        notes.each do |note|
          li class: "note-list-item" do
            link Notes::Show.with(note) do
              strong note.title
              span note.sub_title, class: "note-sub-title"
            end
          end
        end
      end
    end
  end
end
