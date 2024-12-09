i - switch between command to insert modes
Esc - switch between insert to command mode

Command mode:
  o - open a new line and enter in insert mode
  O - open a new line above current position and enter in insert mode
  :wq - write and quit
  :q! - quit without save
  :w! - force write
  u - undo
  ctrl + r - redo
  gg - go to file begin
  G - go to last line
  dd - delete current line
  x - delete current character
  d$ - delete from current point to end of line

Search:
  :/texttosearch
  n - next occurence
  N - previous occurence
  :300 - go to line 300

Replace:
  :%s/one/ONE/g - replace all occurrences of one with ONE
  :%s/one/ONE - replace first occurrences of one with INE

Cut and paste:
  v - select text
  y - copy text selected text
  p - paste copied text
  d - delete selected text
