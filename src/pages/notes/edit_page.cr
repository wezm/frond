class Notes::EditPage < MainLayout
  needs operation : SaveNote
  needs notes : NoteQuery
  needs note : Note
  quick_def page_title, note.title

  def content
    main class: "main" do
      mount Notes::ToggleBox, toggle: "aside-1", checked: true, label_text: "Toggle"
      mount Notes::ToggleBox, toggle: "aside-2", label_text: "ℹ"

      h1 note.title
      render_actions
      render_note_form(operation)
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
      link "Preview", Notes::Show.with(note.id)
      text " | "
      link "Delete",
        Notes::Delete.with(note.id),
        data_confirm: "Are you sure?"
    end
  end

  private def note_list_item_class(note : Note) : String
    classes = ["note-list-item"]
    if current_page?(Notes::Edit.with(note))
      classes << "note-list-item-active"
    end
    classes.join(" ")
  end

  def render_note_form(op)
    form_for Notes::Update.with(note.id) do
      # Edit fields in src/components/notes/form_fields.cr
      mount Notes::FormFields, op

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
