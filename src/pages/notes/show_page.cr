class Notes::ShowPage < MainLayout
  needs note : Note
  quick_def page_title, "Note with id: #{note.id}"

  def content
    link "Back to all Notes", Notes::Index

    h1 note.title

    render_actions
    render_note
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

  def render_note
    div do
      simple_format note.content
    end
  end
end
