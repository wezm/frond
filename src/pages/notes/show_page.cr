class Notes::ShowPage < MainLayout
  needs note : Note
  quick_def page_title, "Note with id: #{note.id}"

  def content
    link "Back to all Notes", Notes::Index
    h1 "Note with id: #{note.id}"
    render_actions
    render_note_fields
  end

  def render_actions
    section do
      link "Edit", Notes::Edit.with(note.id)
      text " | "
      link "Delete",
        Notes::Delete.with(note.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_note_fields
    ul do
      li do
        text "content: "
        strong note.content.to_s
      end
      li do
        text "deleted_at: "
        strong note.deleted_at.to_s
      end
    end
  end
end
