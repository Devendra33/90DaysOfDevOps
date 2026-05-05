# Shell Scripting Cheatsheet

## Task 1: Basics

### 1. Shebang (`#!/bin/bash`)
Tells the interpreter what type of script is written (e.g., `/bin/bash`, `zsh`, etc.).

### 2. Running a Script
- `chmod +x script.sh` — Give executable permission
- `./script.sh` — Run executable script
- `bash script.sh` — Run with bash interpreter

### 3. Comments
- Single line: `# This is a comment`
- Inline: `echo "Hello" # This is an inline comment`

### 4. Variables
- Declaring: `VAR="value"`
- Using: `$VAR`
- Quoting:
  - `"$VAR"` — Expands variables
  - `'$VAR'` — Literal string

### 5. Reading User Input
Use `read` to take input from user.

```bash
read -p "Enter your value: " val
echo "You entered: $val"
```

### 6. Command-Line Arguments
- `$0` — Script name
- `$1` — First argument
- `$#` — Total number of arguments
- `$@` — All arguments
- `$?` — Exit status of last command

---

## Task 2: Operators and Conditionals

### 1. String Comparisons
- `=` — Equal to
- `!=` — Not equal to
- `-z` — True if string is empty
- `-n` — True if string is not empty

### 2. Integer Comparisons
- `-eq` — Equal to
- `-ne` — Not equal to
- `-lt` — Less than
- `-gt` — Greater than
- `-le` — Less than or equal to
- `-ge` — Greater than or equal to

### 3. File Test Operators
- `-f` — True if file exists
- `-d` — True if directory exists
- `-e` — True if file/directory exists (any type)
- `-r` — True if readable
- `-w` — True if writable
- `-x` — True if executable
- `-s` — True if file size > 0 (non-empty)

### 4. `if`, `elif`, `else` Syntax

```bash
if [ "$a" -gt 5 ]; then
    echo "True statements"
elif [ "$a" -eq 3 ]; then
    echo "Check another condition"
else
    echo "False statements"
fi
```

### 5. Logical Operators
- `&&` — AND
- `||` — OR
- `!` — NOT

---

## Task 3: Loops

| Loop         | Use Case                 |
|--------------|--------------------------|
| `for`        | Known list/range         |
| `while`      | Condition-based          |
| `until`      | Run until condition true |
| `break`      | Exit loop                |
| `continue`   | Skip iteration           |
| `while read` | File/stream processing   |

### Examples

1. **For looping over arrays:**
   ```bash
   fruits=("apple" "banana" "mango")
   for item in "${fruits[@]}"; do
       echo "$item"
   done
   # Note: "${#fruits[@]}" gives array length
   ```

2. **Range based:**
   ```bash
   for i in {1..5}; do
       echo "$i"
   done
   ```

3. **Looping over files:**
   ```bash
   for file in *; do  # All files
       echo "$file"
   done

   for file in *.log; do  # All .log files
       echo "$file"
   done
   ```

---

## Task 4: Functions

| Concept       | Usage             |
|----------------|-------------------|
| Define        | `func() {}`       |
| Call          | `func`            |
| Args          | `$1`, `$2`, `$@`  |
| Return status | `return`          |
| Return data   | `echo`            |
| Local vars    | `local var=value` |

### Defining and Calling Functions

```bash
hello() {
    echo "Hello from function"
}

hello <arg1> <arg2>
```

### Return vs Echo

- **Return:** Exit status only (0–255)
  ```bash
  check() {
      return 1
  }
  check
  echo $?  # Prints 1
  ```

- **Echo:** Actual data return
  ```bash
  get_name() {
      echo "DevOps"
  }
  result=$(get_name)
  echo "$result"
  ```

---

## Task 5: Text Processing Commands

### 1. `grep` — Search patterns
- `grep "ERROR" file.log` — Basic search
- `grep -i "error" file.log` — Case-insensitive
- `grep -r "ERROR" /var/log` — Recursive search
- `grep -c "ERROR" file.log` — Count matches
- `grep -n "ERROR" file.log` — Show line numbers
- `grep -v "INFO" file.log` — Exclude pattern
- `grep -E "ERROR|CRITICAL" file.log` — Multiple patterns

### 2. `awk` — Print columns, field separator, patterns, BEGIN/END
- `awk '{print $1, $3}' file.txt` — Print columns
- `awk -F: '{print $1}' /etc/passwd` — Field separator
- `awk '/ERROR/ {print $0}' file.log` — Pattern matching
- `awk 'NR>=1 && NR<=5 {print $0}' file.log` — Line numbers (NR)
- `awk 'BEGIN {print "Start"} {print $1} END {print "End"}' file.txt` — BEGIN/END blocks

### 3. `sed` — Substitution, delete lines, in-place edit
- `sed 's/error/ERROR/' file.txt` — First occurrence
- `sed 's/error/ERROR/g' file.txt` — Global replace
- `sed '/ERROR/d' file.txt` — Delete matching lines
- `sed '1d' file.txt` — Delete first line
- `sed -i 's/error/ERROR/' file.txt` — In-place edit

### 4. `cut` — Extract columns by delimiter
- `cut -d: -f1 /etc/passwd` — By delimiter
- `cut -c1-5 file.txt` — By character position

### 5. `sort` — Alphabetical, numerical, reverse, unique
- `sort file.txt` — Alphabetical
- `sort -n file.txt` — Numeric
- `sort -r file.txt` — Reverse
- `sort -nr file.txt` — Numeric reverse
- `sort -u file.txt` — Unique
- `sort -k2 file.txt` — Sort by column 2
- `sort -h file.txt` — Human-readable (K, M, G)

### 6. `uniq` — Deduplicate, count
- `sort file.txt | uniq` — Remove duplicates
- `sort file.txt | uniq -c` — Count occurrences
- `sort file.txt | uniq -d` — Show duplicates only
- `sort file.txt | uniq -u` — Show unique only

### 7. `tr` — Translate/delete characters
- `echo "hello" | tr 'a-z' 'A-Z'` — Convert case
- `echo "hello123" | tr -d '0-9'` — Delete characters
- `echo "a,b,c" | tr ',' ' '` — Replace characters

### 8. `wc` — Line/word/char count
- `wc -l file.txt` — Lines
- `wc -w file.txt` — Words
- `wc -c file.txt` — Characters
- `wc file.txt` — All stats

### 9. `head` / `tail` — First/last N lines, follow mode
- `head -n 5 file.txt` — First 5 lines
- `tail -n 5 file.txt` — Last 5 lines
- `tail -f file.txt` — Follow logs (real-time)

---

## Task 6: Useful Patterns and One-Liners

- **Find and delete files older than N days:**
  ```bash
  find /var/log -type f -name "*.log" -mtime +7 -delete
  ```

- **Count lines in all `.log` files:**
  ```bash
  find . -name "*.log" -exec wc -l {} + | tail -n 1
  ```

- **Replace a string across multiple files:**
  ```bash
  grep -rl "old_string" . | xargs sed -i 's/old_string/new_string/g'
  ```

- **Check if a service is running:**
  ```bash
  systemctl is-active --quiet nginx && echo "Running" || echo "Stopped"
  ```

- **Monitor disk usage with alerts:**
  ```bash
  df -h | awk '$5+0 > 80 {print "ALERT: " $0}'
  ```

- **Parse CSV or JSON from command line:**
  ```bash
  cut -d',' -f2 file.csv  # Extracts 2nd column
  cat file.json | jq '.users[].name'  # Extracts all user names
  ```

- **Tail a log and filter for errors in real time:**
  ```bash
  tail -f /var/log/syslog | grep -i "error"
  ```

---

## Task 7: Error Handling and Debugging

### 1. Exit Codes
- `$?` — Check last command status
- `exit 0` — Success
- `exit 1` — Failure

### 2. `set -e` — Stop on first error
```bash
set -e
echo "Start"
cp file1.txt /tmp/
cp missing.txt /tmp/  # Fails here
echo "This will NOT run"
```

### 3. `set -u` — Unset variables as error
```bash
set -u
echo $NAME  # Error if NAME not set
```

### 4. `set -o pipefail` — Catch errors in pipes
```bash
set -o pipefail
cat file.txt | grep "text" | sort  # If cat fails, whole pipe fails
```

### 5. `set -x` — Debug mode (trace execution)
```bash
set -x
name="DevOps"
echo "Hello $name"
# Output:
# + name=DevOps
# + echo 'Hello DevOps'
# Hello DevOps
```

### Best Practice: Combine Everything
```bash
set -euo pipefail
```