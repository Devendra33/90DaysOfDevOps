# Day 38 — YAML Practice

## Task 1: Key-Value Pairs
Create `person.yaml` that describes yourself with:
- `name`
- `role`
- `experience_years`
- `learning` (boolean)

**Answer 1:** Refer to `person.yaml`

---

## Task 2: Lists
Add to `person.yaml`:
- `tools` — a list of 5 DevOps tools you know or are learning
- `hobbies` — a list using inline format: `[item1, item2]`

**Answer 2:** Refer to `person.yaml`

---

## Task 3: Nested Objects
Create `server.yaml` that describes a server with nested objects:
- `server` with keys: `name`, `ip`, `port`
- `database` with keys: `host`, `name`, `credentials`
  - `credentials` should contain `user` and `password`

**Answer 3:** Refer to `server.yaml`

---

## Task 4: Multi-line Strings
In `server.yaml`, add a `startup_script` field using both styles:
1. `|` block style — preserves newlines
2. `>` folded style — collapses lines into one paragraph

Write in your notes: When would you use `|` vs `>`?

**Answer 4:** Refer to `server.yaml`

---

## Task 5: Validate Your YAML
1. Install `yamllint` or use an online validator.
2. Validate both `person.yaml` and `server.yaml`.
3. Intentionally break the indentation — observe the validation error.
4. Fix the indentation and validate again.

**Answer 5:** Done

---

## Task 6: Spot the Difference
Read both blocks and write what is wrong with the second one.

### Block 1 — correct
```yaml
name: devops
tools:
  - docker
  - kubernetes
```

### Block 2 — broken
```yaml
name: devops
tools:
- docker
  - kubernetes
```

**Answer 6:** The second block has wrong indentation. The second list item should be aligned with the first item, not indented under it.

