# Neovim + tmux Cheat Sheet

> **Leader = `Space`**. `<C-x>` = Ctrl+x, `<A-x>` = Alt+x, `<M-x>` = Alt+x.
> Language-specific maps (Java `<leader>j*`, Go `<leader>c[oc]`) only exist when that filetype is open.

---

## 🧭 Navigation & Windows

| Key | Action | Mnemonic |
|---|---|---|
| `<C-h/j/k/l>` | Move between nvim splits **and** tmux panes (seamless) | **h j k l** = vim motions, Ctrl crosses borders |
| `<C-\>` | Jump to previous split/pane | back**slash** = go back |
| `<A-h/j/k/l>` | Resize split (←/↓/↑/→) | **A**lt = **A**djust size |
| `<C-n>` | Toggle Neo-tree file explorer | **N**eo-tree / **N**avigator |
| `-` | Open Oil (edit dir as a buffer) | `-` points **up** a directory |
| `<leader>bf` | Neo-tree buffers (float) | **B**uffers **F**loat |

## 🔭 Find (Telescope)

| Key | Action | Mnemonic |
|---|---|---|
| `<leader>fa` | Find files | **F**ind **A**ll files |
| `<leader>fg` | Live grep | **F**ind by **G**rep |
| `<leader>fs` | Document symbols | **F**ind **S**ymbols |
| `<leader>rf` | Recent files | **R**ecent **F**iles |

## 🎯 Harpoon (quick file marks)

| Key | Action | Mnemonic |
|---|---|---|
| `<leader>a` | Add current file to list | **A**dd / **A**nchor |
| `<C-a>` | Toggle quick menu | **A**nchor menu |
| `<C-1>`…`<C-4>` | Jump to marked file 1–4 | slot number |

> ⚠️ `<C-1..4>` may not register in some terminals (Ctrl+digit isn't a distinct keycode).

---

## 💡 LSP / Code

| Key | Action | Mnemonic |
|---|---|---|
| `K` | Hover docs | **K** = "**K**now what this is" |
| `<leader>gd` | Go to definition | **G**o **D**efinition |
| `<leader>gi` | Go to implementation | **G**o **I**mplementation |
| `<leader>gr` | References | **G**o **R**eferences |
| `<leader>rn` | Rename symbol | **R**e**N**ame |
| `<leader>ca` | Code action | **C**ode **A**ction |
| `<leader>cf` | Format buffer (conform) | **C**ode **F**ormat |
| `<leader>q` | Toggle diagnostics quickfix | **Q**uickfix |
| `<leader>nh` | Clear search highlight | **N**o **H**ighlight |

**Built-in 0.12 LSP maps (also available):** `grn` rename · `gra` code action · `grr` references · `gri` implementation · `grt` type def · `gO` doc symbols · `gq` format via LSP.

### Completion (native, in insert mode)

| Key | Action | Mnemonic |
|---|---|---|
| `<C-.>` | Trigger completion | `.` = "give me options" |
| `<Tab>` / `<S-Tab>` | Next / previous item | tab through |
| `<CR>` | Confirm selection | Enter to accept |

---

## 🧪 Testing (Neotest — Go / Python / Jest / Vitest)

| Key | Action | Mnemonic |
|---|---|---|
| `<leader>tn` | Run nearest test | **T**est **N**earest |
| `<leader>ta` | Run all tests in project | **T**est **A**ll |
| `<leader>ts` | Toggle summary panel | **T**est **S**ummary |
| `<leader>to` | Toggle output panel | **T**est **O**utput |
| `<leader>tc` | Clear output panel | **T**est **C**lear |
| `<leader>dn` | Debug nearest test | **D**ebug **N**earest |

## 🐛 Debug (DAP)

| Key | Action | Mnemonic |
|---|---|---|
| `<F5>` | Continue / start | IDE standard ▶ |
| `<F10>` | Step over | IDE standard |
| `<F11>` | Step into | IDE standard |
| `<F12>` | Step out | IDE standard |
| `<leader>db` | Toggle breakpoint | **D**ebug **B**reakpoint |
| `<leader>dc` | Run to cursor | **D**ebug to **C**ursor |
| `<leader>dd` | Evaluate var under cursor | **D**ebug **D**ata |
| `<leader>dr` | Open REPL | **D**ebug **R**EPL |
| `<leader>du` | Toggle DAP UI | **D**ebug **U**I |

---

## 🌿 Git (Gitsigns)

| Key | Action | Mnemonic |
|---|---|---|
| `]c` / `[c` | Next / previous hunk | `c` = **c**hange |
| `<leader>hS` | Stage whole buffer | **H**unk **S**tage (big = whole file) |
| `<leader>hR` | Reset whole buffer | **H**unk **R**eset |
| `<leader>hd` | Diff this file | **H**unk **D**iff |
| `<leader>hD` | Diff vs `~` (HEAD~) | **H**unk **D**iff (bigger scope) |
| `<leader>tb` | Toggle line blame | **T**oggle **B**lame |

> Also `:Git` (fugitive) for the full git interface.

## ✂️ Editing (mini.nvim + treesj + autotag)

| Key | Action | Mnemonic |
|---|---|---|
| `<leader>m` | Toggle split/join a block (treesj) | **M**erge ⇄ split |
| `gcc` / `gc{motion}` | Comment line / motion | **G**o **C**omment |
| `sa{motion}{char}` | Surround add | **S**urround **A**dd |
| `sd{char}` | Surround delete | **S**urround **D**elete |
| `sr{old}{new}` | Surround replace | **S**urround **R**eplace |
| `{op}aF` / `{op}iF` | Around / inside function | **F**unction |
| `{op}ac` / `{op}ic` | Around / inside class | **c**lass |
| `{op}aa` / `{op}ia` | Around / inside argument | **a**rgument |
| `{op}ao` / `{op}io` | Around / inside conditional/loop | c**o**ntrol flow |

> `{op}` = operator like `d`elete, `c`hange, `y`ank, or `v`isual. e.g. `daF` = delete a function, `cia` = change inside an argument.
> JSX/HTML/Angular tags auto-close & auto-rename (nvim-ts-autotag) — no keybind.

---

## ☕ Java (jdtls — only in `.java` buffers)

| Key | Action | Mnemonic |
|---|---|---|
| `<leader>jo` | Organize imports | **J**ava **O**rganize |
| `<leader>jv` | Extract variable (also visual) | **J**ava **V**ariable |
| `<leader>jc` | Extract constant | **J**ava **C**onstant |
| `<leader>jt` | Test nearest method | **J**ava **T**est |
| `<leader>jT` | Test whole class | **J**ava **T**est (big T = whole class) |

## 🐹 Go (coverage)

| Key | Action | Mnemonic |
|---|---|---|
| `<leader>co` | Show coverage | **C**overage **O**n |
| `<leader>cc` | Clear coverage | **C**overage **C**lear |

---

## 🖥️ Terminal & Misc

| Key / Cmd | Action | Mnemonic |
|---|---|---|
| `:Tt {cmd}` | Open bottom terminal & run cmd (e.g. `:Tt ./gradlew test`) | **T**erminal **t**ask |
| `<Esc>` (in terminal) | Exit terminal-insert mode | escape the terminal |
| `<leader>cl` | Open Claude Code in a split | **CL**aude |

---

## 🪟 tmux — prefix is `<C-Space>`

> Press & release **`Ctrl+Space`**, *then* the key (it's a sequence, not a chord).

| Key | Action | Mnemonic |
|---|---|---|
| `<prefix> \|` | Split panes side-by-side | `\|` looks like a vertical divider |
| `<prefix> _` | Split panes stacked | `_` looks like a horizontal divider |
| `<prefix> c` | New window (current dir) | **C**reate window |
| `<prefix> r` | Reload tmux.conf | **R**eload |
| `<prefix> z` | Zoom pane (toggle) | **Z**oom |
| `<prefix> x` | Kill pane | **X** it |
| `<prefix> d` | Detach session | **D**etach |
| `<prefix> [` | Copy/scrollback mode (vi keys, `q` to exit) | `[` starts selection |
| `<prefix> n` / `p` | Next / previous window | **N**ext / **P**rev |
| `<prefix> w` | List windows | **W**indows |
| `<C-h/j/k/l>` | Move between panes (no prefix — shared with nvim) | vim motions |

---

### Namespace key
- `<leader>c*` → **C**ode (format, action, coverage, Claude)
- `<leader>d*` → **D**ebug
- `<leader>f*` / `<leader>rf` → **F**ind
- `<leader>g*` → **G**oto (LSP)
- `<leader>h*` → git **H**unks
- `<leader>j*` → **J**ava
- `<leader>t*` → **T**est (+ toggle blame)
