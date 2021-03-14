class Notes::ShowPage < MainLayout
  needs notes : NoteQuery
  needs note : Note
  quick_def page_title, "Note with id: #{note.id}"

  def content
    main class: "main" do
      mount Notes::ToggleBox, toggle: "aside-1", checked: true, label_text: "Toggle"
      mount Notes::ToggleBox, toggle: "aside-2", label_text: "ℹ"

      h1 note.title
      render_actions
      render_note
    end
    div class: "aside aside-1" do
      div class: "toggle-box-content" do
        ul class: "note-list" do
          notes.each do |note|
            li class: note_list_item_class(note) do
              link Notes::Edit.with(note) do
                strong note.title
                span note.sub_title, class: "note-sub-title"
              end
            end
          end
        end
      end
    end
    div class: "aside aside-2 toggle-box-closed" do
      div class: "toggle-box-content" do
        h2 "Info"

        dl do
          dt "Created"
          dd note.created_at.to_s
        end

        dl do
          dt "Modified"
          dd note.updated_at.to_s
        end

        dl do
          dt "Word Count"
          dd note.word_count.to_s
        end
      end
    end
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

  private def note_list_item_class(note : Note) : String
    classes = ["note-list-item"]
    if current_page?(Notes::Show.with(note))
      classes << "note-list-item-active"
    end
    classes.join(" ")
  end
end
