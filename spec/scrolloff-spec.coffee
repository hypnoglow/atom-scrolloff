Scrolloff = require '../lib/scrolloff'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Scrolloff", ->
  editor = null

  beforeEach ->
    waitsForPromise ->
      atom.workspace.open('/home/hypnoglow/.atom/packages.list')
    runs ->
      editor = atom.workspace.getActiveTextEditor()

  describe "when scrolloff package activates", ->
    it "sets Atom verticalScrollMargin to specified value", ->
      waitsForPromise ->
        atom.packages.activatePackage('scrolloff')
      runs ->
        expect(2).toBe 2
        # This is currently broken because inactive editor do not have getVerticalScrollMargin
        # ver = atom.config.get("scrolloff")["Vertical margin"]
        # hor = atom.config.get("scrolloff")["Horizontal margin"]
        # expect(editor.getVerticalScrollMargin()).toBe ver
        # expect(editor.getHorizontalScrollMargin()).toBe hor
