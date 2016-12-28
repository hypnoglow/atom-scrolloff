settings = require './settings'
{CompositeDisposable} = require 'atom'

module.exports = Scrolloff =
  config: settings.config

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscribeToWorkspace()
      
    @subscriptions.add atom.config.onDidChange "scrolloff", () =>
      @workspaceSubscription.dispose()
      @subscriptions.remove @workspaceSubscription
      @subscribeToWorkspace()
      
  deactivate: ->
    @subscriptions.dispose()

  subscribeToWorkspace: ->
    @workspaceSubscription = atom.workspace.observeTextEditors (editor) ->
      editor.setVerticalScrollMargin atom.config.get("scrolloff")["verticalMargin"]
      editor.setHorizontalScrollMargin atom.config.get("scrolloff")["vorizontalMargin"]
    @subscriptions.add @workspaceSubscription
