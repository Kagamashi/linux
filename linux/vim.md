# Vim Shortcuts for Operators

## Basic Modes
- **Normal Mode:** Press `Esc` to enter Normal mode where you can navigate and use commands.
- **Insert Mode:** Press `i` to enter Insert mode where you can type text.
- **Visual Mode:** Press `v` to enter Visual mode where you can select text.

## Common Operators
- **`d` - Delete**
  - `d` + `motion` or `d` + `text object` (e.g., `d$` deletes from the cursor to the end of the line)
  - `dd` - Delete the current line
  - `d` + `w` - Delete a word
  - `d` + `p` - Delete to the end of the paragraph

- **`y` - Yank (Copy)**
  - `y` + `motion` or `y` + `text object` (e.g., `y$` yanks from the cursor to the end of the line)
  - `yy` - Yank the current line
  - `y` + `w` - Yank a word
  - `y` + `p` - Yank to the end of the paragraph

- **`c` - Change**
  - `c` + `motion` or `c` + `text object` (e.g., `c$` changes from the cursor to the end of the line)
  - `cc` - Change the current line
  - `c` + `w` - Change a word
  - `c` + `p` - Change to the end of the paragraph

- **`>` - Indent**
  - `>` + `motion` or `>` + `text object` (e.g., `>}` indents to the end of the paragraph)
  - `>>` - Indent the current line
  - `>` + `w` - Indent a word
  - `>` + `p` - Indent to the end of the paragraph

- **`<` - Unindent**
  - `<` + `motion` or `<` + `text object` (e.g., `<}` unindents to the end of the paragraph)
  - `<<` - Unindent the current line
  - `<` + `w` - Unindent a word
  - `<` + `p` - Unindent to the end of the paragraph

## Text Objects
- **`iw` - Inner Word**
  - Operates on the word under the cursor (e.g., `diw` deletes the inner word)

- **`aw` - A Word**
  - Operates on the word and surrounding whitespace (e.g., `yaw` yanks the word and space)

- **`i$` - Inner Line End**
  - Operates from the cursor to the end of the line (e.g., `di$` deletes to the end of the line)

- **`a$` - A Line End**
  - Operates from the start to the end of the line (e.g., `ya$` yanks the entire line)

- **`ip` - Inner Paragraph**
  - Operates on the paragraph under the cursor (e.g., `cip` changes the paragraph)

- **`ap` - A Paragraph**
  - Operates on the paragraph and surrounding whitespace (e.g., `yap` yanks the paragraph)

## Combining Commands
- **`d` + `d`** - Delete two lines
- **`y` + `y`** - Yank two lines
- **`c` + `c`** - Change two lines

## Additional Tips
- Use **Visual Mode** (`v`) to select text and then apply operators like `d`, `y`, or `c` to operate on the selected text.
- Use **`:`** to enter Command-line mode for more advanced operations and commands.

Happy Vimming!

https://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/
https://ryanstutorials.net/linuxtutorial/cheatsheetvi.php