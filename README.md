# Dr_Quine

> *A self-reproducing computer program (quine) exploration based on Kleene's Recursion Theorem.*

---

## Table of Contents
1. [Theoretical Background](#theoretical-background)
   - [What is a Quine?](#what-is-a-quine)
   - [Kleene's Recursion Theorem & Fixed Points](#kleenes-recursion-theorem--fixed-points)
2. [Project Structure](#project-structure)
3. [Program Specifications & Implementations](#program-specifications--implementations)
   - [1. Colleen (C & ASM)](#1-colleen-c--asm)
   - [2. Grace (C & ASM)](#2-grace-c--asm)
   - [3. Sully (C & ASM)](#3-sully-c--asm)
4. [Compilation & Build Rules](#compilation--build-rules)
5. [Automated Testing & Verification](#automated-testing--verification)

---

## Theoretical Background

### What is a Quine?
A **quine** is a computer program that takes no input and produces a copy of its own source code as its only output. 
- Opening the source file directly (e.g., using `open("Colleen.c")` or `cat`) is considered cheating.
- Using command-line argument pointers such as `argv` or environment inspection is also forbidden.
- The program must independently reconstruct its entire source text from its internal data representations and execution logic.

### Kleene's Recursion Theorem & Fixed Points
In mathematical logic and computability theory, **Stephen Cole Kleene's second recursion theorem** (1938) proves that for any computable function $F$, there exists a program index $e$ such that $F(e)$ computes the same function as $e$. That is:
$$\phi_{F(e)} = \phi_e$$

In lambda calculus and programming semantics, this corresponds to finding a **fixed point** for program evaluation ($Y f = f (Y f)$). A quine is essentially a concrete realization of Kleene's theorem: the program contains a data payload representing a blueprint/template of itself, and a code component that interprets that template and reproduces both the code and the data payload.

---

## Project Structure

The project contains two distinct implementations fulfilling the mandatory specifications: one in **C** and one in **x86_64 Assembly (NASM)**.

```
dr_quine/
├── Makefile             # Root Makefile orchestrating C and ASM builds & test suites
├── en.subject.pdf       # 42 Subject specification
├── README.md            # Comprehensive documentation
├── C/
│   ├── Makefile         # C build rules (all, clean, fclean, re)
│   ├── Colleen.c        # Quine with dual comments & auxiliary function
│   ├── Grace.c          # Quine without declared main, 3 defines, 1 comment
│   └── Sully.c          # Metamorphic quine decrementing integer counter (5 -> 0)
└── ASM/
    ├── Makefile         # Assembly build rules (NASM + GCC linking)
    ├── Colleen.s        # x86_64 NASM quine with dual comments & auxiliary function
    ├── Grace.s          # x86_64 NASM quine executed via macro, 3 defines, 1 comment
    └── Sully.s          # x86_64 NASM metamorphic quine decrementing counter (5 -> 0)
```

---

## Program Specifications & Implementations

### 1. Colleen (C & ASM)
- **Target Executable**: `Colleen`
- **Output**: Outputs exact source code to standard output (`stdout`).
- **Subject Constraints**:
  - Must define a `main` function.
  - Must contain at least two different comments:
    - One comment inside the `main` function.
    - One comment outside the program (global scope).
  - Must define and invoke an auxiliary function in addition to `main`.
- **Implementation Strategy**:
  - **C (`C/Colleen.c`)**: Uses POSIX parameter formatting (`%1$c`, `%2$c`, `%3$s`) where argument 1 is newline (`10`), argument 2 is double quote (`34`), and argument 3 is the encoded format string itself. The helper function `print_source(char *s)` is invoked from `main`.
  - **ASM (`ASM/Colleen.s`)**: Uses 64-bit System V AMD64 ABI calling conventions with `printf` from libc. Arguments are placed in `rdi` (format string), `rsi` (10), `rdx` (34), and `rcx` (format string pointer). `rax` is zeroed (`xor eax, eax`) as required by the ABI for variadic calls.

### 2. Grace (C & ASM)
- **Target Executable**: `Grace`
- **Output**: Writes its source code into a file named `Grace_kid.c` (or `Grace_kid.s` for assembly).
- **Subject Constraints**:
  - Strictly **no declared `main`** in regular source format.
  - Strictly **three preprocessor definitions** (`#define` / `%define` / `%macro`).
  - Strictly **one comment**.
  - Must run by **calling a macro**.
- **Implementation Strategy**:
  - **C (`C/Grace.c`)**:
    - Define 1: `#define FILENAME "Grace_kid.c"`
    - Define 2: `#define STR "..."`
    - Define 3: `#define EXEC() int main(void) { ... }`
    - Program executes at file scope through the macro invocation `EXEC()`.
  - **ASM (`ASM/Grace.s`)**:
    - Define 1: `%define FILENAME "Grace_kid.s", 0`
    - Define 2: `%define STR "...", 0`
    - Macro 3: `%macro RUN 0 ... %endmacro`
    - The file concludes with the macro call `RUN`, expanding `main:` and performing the file write via the Linux `open` syscall and `dprintf`.

### 3. Sully (C & ASM)
- **Target Executable**: `Sully`
- **Behavior**:
  - Starts with an integer constant `i = 5`.
  - Introspects its source filename via the preprocessor macro `__FILE__` (avoiding forbidden `argv` usage).
  - Detects whether it is running as root `Sully` or a child `Sully_X`.
  - Decrements `i` for child instances (`5 -> 4 -> 3 -> 2 -> 1 -> 0`).
  - Writes a child source file `Sully_X.c` / `Sully_X.s` containing the updated integer.
  - Compiles the child source file into executable `Sully_X`.
  - Executes `./Sully_X` conditionally: only if the resulting counter $X > 0$.
  - Generates exactly 13 files when run from an external or parent location:
    - Root `Sully` executable
    - 6 child source files (`Sully_5` down to `Sully_0`)
    - 6 child binaries (`Sully_5` down to `Sully_0`)
- **Implementation Strategy**:
  - **C (`C/Sully.c`)**: Uses `strrchr` and `strncmp` to examine `__FILE__`. Compiles child source files using `clang` (or fallback `gcc`) with `-Wall -Wextra -Werror`.
  - **ASM (`ASM/Sully.s`)**: Implements string searching using `strstr` on the built-in NASM `__FILE__` macro string. Assembles with `nasm -f elf64` and links with `gcc -no-pie`, removing intermediate `.o` files to maintain clean file counts.

---

## Compilation & Build Rules

### Root Makefile
The root Makefile delegates to the subdirectories and provides a top-level test runner:
```bash
make          # Builds both C and ASM programs
make c        # Builds C programs only
make asm      # Builds ASM programs only
make clean    # Cleans object files in C/ and ASM/
make fclean   # Removes all object files, executables, and child artifacts
make re       # Performs full fclean and rebuild
make test     # Runs end-to-end automated validation on all 6 programs
```

### Compiler & Assembler Flags
- **C Programs**: `clang -Wall -Wextra -Werror` (or `gcc` if `clang` is not present).
- **ASM Programs**: `nasm -f elf64` linked with `gcc -no-pie`.

---

## Automated Testing & Verification

Run the complete test suite with:
```bash
make test
```

### Manual Verification Steps (as specified in 42 Subject)

#### 1. Test Colleen (C):
```bash
cd C
gcc -Wall -Wextra -Werror Colleen.c -o Colleen
./Colleen > tmp_Colleen
diff -u Colleen.c tmp_Colleen # Zero differences expected
```

#### 2. Test Grace (C):
```bash
cd C
gcc -Wall -Wextra -Werror Grace.c -o Grace
./Grace
diff -u Grace.c Grace_kid.c   # Zero differences expected
```

#### 3. Test Sully (C):
```bash
mkdir -p /tmp/sully_c_eval && cd /tmp/sully_c_eval
gcc -Wall -Wextra -Werror <path_to>/dr_quine/C/Sully.c -o Sully
./Sully
ls -al | grep Sully | wc -l   # Exactly 13 files expected
diff <path_to>/dr_quine/C/Sully.c Sully_0.c # Only integer 5 vs 0 difference
diff Sully_3.c Sully_2.c                     # Only integer 3 vs 2 difference
```

#### 4. Test Assembly Programs (ASM):
```bash
cd ASM
make
./Colleen > tmp_Colleen && diff -u Colleen.s tmp_Colleen
./Grace && diff -u Grace.s Grace_kid.s
```
And similarly for `ASM/Sully.s`.
