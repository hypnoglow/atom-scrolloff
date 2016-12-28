settings = require './settings'

module.exports = Scrolloff =
  config: settings.config

  activate: (state) ->
    @subscribeToWorkspace()
      
    atom.config.onDidChange "scrolloff", () =>
      @workspaceSubscription.dispose()
      @subscribeToWorkspace()

  subscribeToWorkspace: ->
    @workspaceSubscription = atom.workspace.observeTextEditors (editor) ->
      editor.setVerticalScrollMargin atom.config.get("scrolloff")["verticalMargin"]
      editor.setHorizontalScrollMargin atom.config.get("scrolloff")["vorizontalMargin"]