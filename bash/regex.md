
# Regular Expressions in Bash

## 1. Basic Regular Expressions (BRE) vs Extended Regular Expressions (ERE)
- **BRE** (default in `grep` and `sed`): Some special characters must be escaped.
- **ERE** (used with `grep -E`, `sed -E`, or `awk`): More powerful, fewer escapes needed.

## 2. Common Regex Patterns
- `.`  : Matches any single character (except newline).
- `^`  : Anchors the match to the start of a line.
- `$`  : Anchors the match to the end of a line.
- `[]` : Character class, matches any one of the enclosed characters.
- `|`  : Alternation (logical OR), matches either pattern on either side.
- `*`  : Matches zero or more of the preceding character.
- `+`  : Matches one or more of the preceding character (ERE only).
- `?`  : Matches zero or one of the preceding character (ERE only).
- `()` : Grouping of expressions (ERE only).
- `\`  : Escape special characters.

---

## 3. Using Regular Expressions with Bash Commands

### 3.1. `grep`
**Example**: Searching for lines that contain "error":
```bash
grep "error" logfile.txt
```

**With extended regex**:
```bash
grep -E "error|warning" logfile.txt  # Match either "error" or "warning"
```

### 3.2. `sed`
**Example**: Replacing "error" with "ERROR":
```bash
sed 's/error/ERROR/g' logfile.txt
```

**Example**: Deleting lines that start with `#` (comments):
```bash
sed '/^#/d' script.sh
```

### 3.3. `awk`
**Example**: Printing lines that contain "error":
```bash
awk '/error/ { print }' logfile.txt
```

**Example**: Matching lines that start with "info" or "debug":
```bash
awk '/^(info|debug)/ { print }' logfile.txt
```

---

## 4. Anchors and Boundaries

### 4.1. Start (`^`) and End (`$`) Anchors
**Example**: Match lines that start with "INFO":
```bash
grep "^INFO" logfile.txt
```

**Example**: Match lines that end with ".txt":
```bash
grep ".txt$" filelist.txt
```

### 4.2. Word Boundaries (`\b`)
**Example**: Match whole word "error":
```bash
grep -E "\berror\b" logfile.txt
```

---

## 5. Quantifiers

### 5.1. `*` (Zero or more)
**Example**: Match "go", "goo", "gooo", etc.:
```bash
grep "go*" logfile.txt
```

### 5.2. `+` (One or more, ERE only)
**Example**: Match "go" followed by one or more "o":
```bash
grep -E "go+" logfile.txt
```

### 5.3. `?` (Zero or one, ERE only)
**Example**: Match "color" or "colour":
```bash
grep -E "colou?r" logfile.txt
```

---

## 6. Character Classes

### 6.1. Bracket Expressions (`[]`)
**Example**: Match either "a", "e", or "i":
```bash
grep "[aei]" file.txt
```

**Example**: Match any digit:
```bash
grep "[0-9]" file.txt
```

### 6.2. Negating Character Classes
**Example**: Match any character except "a", "e", or "i":
```bash
grep "[^aei]" file.txt
```

---

## 7. Grouping and Alternation

### 7.1. Grouping (`()`, ERE only)
**Example**: Match "cat" or "dog":
```bash
grep -E "(cat|dog)" animals.txt
```

**Example**: Match "go" followed by zero or more "o" and then "gle":
```bash
grep -E "go(o*)gle" file.txt
```

### 7.2. Alternation (`|`, ERE only)
**Example**: Match either "cat" or "dog":
```bash
grep -E "cat|dog" animals.txt
```

---

## 8. Practical Examples

### 8.1. Matching Digits and Letters
**Example**: Match lines containing any digits:
```bash
grep "[0-9]" file.txt
```

**Example**: Match lines containing letters from "a" to "z":
```bash
grep "[a-z]" file.txt
```

### 8.2. Ignoring Case with `-i`
**Example**: Match "error" regardless of case:
```bash
grep -i "error" logfile.txt
```

### 8.3. Using Regex in Scripts
**Example**: Check if a string matches a regex pattern:
```bash
if [[ "$string" =~ ^[A-Za-z]+$ ]]; then
    echo "The string contains only letters"
else
    echo "The string contains other characters"
fi
```

---

## 9. Summary
- **`grep`**: Use for searching files based on patterns.
- **`sed`**: Use for text substitution and manipulation.
- **`awk`**: Use for text processing and extracting fields.
- **Anchors**: Use `^` and `$` to match the start and end of lines.
- **Character Classes**: Use `[]` to define a set of characters to match.
- **Quantifiers**: Use `*`, `+`, and `?` to define repetition.
- **Alternation**: Use `|` to match one of several patterns.
- **Case-insensitive Search**: Use `-i` with `grep` to ignore case.

Regular expressions are a powerful tool for text processing and pattern matching in Bash scripts and command-line utilities. Mastering regex can greatly enhance your ability to manipulate and search text efficiently.
