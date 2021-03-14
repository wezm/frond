class Notes::ToggleBox < BaseComponent
  needs toggle : String
  needs checked : Bool = false
  needs label_text : String

  def render
    input type: "checkbox", id: id, class: "toggle-box", attrs: attrs, data_toggle: toggle_class
    label label_text, for: id
  end

  def id : String
    toggle + "-toggle"
  end

  def toggle_class : String
    "." + toggle
  end

  def attrs : Array(Symbol)
    if checked?
      [:checked]
    else
      [] of Symbol
    end
  end
end
