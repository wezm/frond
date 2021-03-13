class Notes::FormFields < BaseComponent
  needs operation : SaveNote

  def render
    mount Shared::Field, operation.content, &.textarea(autofocus: "true", append_class: "note-editor")
  end
end
