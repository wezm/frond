class Notes::FormFields < BaseComponent
  needs operation : SaveNote

  def render
    mount Shared::Field, operation.content, &.textarea(autofocus: "true")
  end
end
