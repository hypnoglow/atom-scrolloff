settings = require './settings'

module.exports = Scrolloff =
  config: settings.config

  activate: (state) ->
    atom.workspace.observeTextEditors (editor) ->
      editor.setVerticalScrollMargin atom.config.get("scrolloff")["Vertical margin"]
      editor.setHorizontalScrollMargin atom.config.get("scrolloff")["Horizontal margin"]
