# ICD22 Homework2


## How port your homework1 to homework2

1. **Remove** the main from the `scanner.l`.
2. **Remove** all the `#define [TOKEN] [INDEX]` in `scanner.l` (we define them in parser.y with `%token`).
3. **Add** `#include "parser.h"` in your `scanner.l`.
4. **Add** a `#pragma token on` and `#pragma token off` to control `[INFO]` and `token(type:...)...` message, default is **off**.
5. Scanner should not handle **negative** numbers, please **remove** all `[+-]` at the begining of `integer`, `scientific`, `float` rules in `scanner.l`.  And plese **add** rule of `factor ::= sub factor`in parser to handle negative numbers.

Please follow the grammar in `01-minipascal-spec.pdf ` to write your syntax rule in `parser.y`.

## Some useful online information
[lex & yacc](http://dinosaur.compilertools.net/#lex)

[Makefile](https://www.gnu.org/software/make/manual/make.html)

[C preprocessor(cpp)](https://gcc.gnu.org/onlinedocs/cpp/index.html)

## Visualize your parser

Please use `make debug` in the docker, and it will create a png file.
