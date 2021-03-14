/* eslint no-console:0 */

// Rails Unobtrusive JavaScript (UJS) is *required* for links in Lucky that use DELETE, POST and PUT.
// Though it says "Rails" it actually works with any framework.
require("@rails/ujs").start();

// Turbolinks is optional. Learn more: https://github.com/turbolinks/turbolinks/
require("turbolinks").start();

// require("mdarea");
import MarkdownArea, { EditorOptions } from 'mdarea';

function toggleSidebar() {
  const checkbox = this;
  const toggleElement = document.querySelector(checkbox.dataset.toggle);
  console.log(checkbox.dataset.toggle);
  if (!toggleElement) return;

  if (checkbox.checked) {
    toggleElement.classList.remove('toggle-box-closed')
  }
  else {
    toggleElement.classList.add('toggle-box-closed')
  }
}

// If using Turbolinks, you can attach events to page load like this:
document.addEventListener("turbolinks:load", function() {
  const options = { keyMap: { inline: [] } }
  document.querySelectorAll('textarea.note-editor').forEach(function(textarea) {
    const editor = new MarkdownArea(textarea, options);
  });

  // Sidebar toggling
  document.querySelectorAll('.toggle-box').forEach(function (checkbox) {
    checkbox.addEventListener("click", toggleSidebar, false);
  });
});
