Marked Style: EdMath

Snippets
========

Type *key* then CTRL-J in insert mode to trigger, TAB for next placeholder, CTRL-TAB for previous placeholder and CTRL-L to list matching snippets.

The Next and Previous key maps only apply inside the snippet expansion.  Insert and List only apply in insert mode.

Entries in bold below are in my custom `~/.vim/UltiSnips` directory



all languages
-------------

| key      | expands to                                 |
|:---------|:-------------------------------------------|
| box      | variable width box using comment character |
| bbox     | 80 char wide box                           |
| lorem    | 50 characters of lorem ipsum text          |
| modeline | vim tabstop comment                        |
| date     | YYY-MM-DD date                             |
| time     | HH:MM time                                 |
| datetime | YYYY-MM-DD HH:MM timestamp                 |

markdown
--------

| key       | expands to                   |
|:----------|:-----------------------------|
| link      | link                         |
| img       | image                        |
| fnt       | footnote                     |
| cbl       | codeblock                    |
| refl      | reference link               |
| **ms**    | `Marked Style: EdMath`       |
| **$**     | `\\( \\)`                    |
| **$$**    | `\\[ \\]`                    |
| **align** | `\begin{align}..\end{align}` |

You can use `\h` to fixup all headings and `\t` to fixup a table.

python
------

| key    | expands to                                     |
|:-------|:-----------------------------------------------|
| #!     | at start of first line `#!/usr/bin/env/python` |
| **"**  | triple quote docstring on 1 line               |
| doc    | triple quote docstring on 3 lines              |
| ifmain | calls main() if not a module                   |
| from   | from module import name                        |
| def    | function with docstring                        |
| class  | class template including a constructor         |
| attr   | template methods for attribute access          |
| desc   | template methods for descriptors               |
| cmp    | template methods for comparison                |
| **r**  | read only property, getter only                |
| **rw** | read-write property with setter and getter     |
| ld     | lambda                                         |
| ipdb   | insert breakpoint                              |
| getopt | option processing block                        |

ruby
----

| key    | expands to                                   |
|:-------|:---------------------------------------------|
| #!     | at start of first line `#!/usr/bin/env/ruby` |
| class  | class template including a constructor       |
| defi   | class constructor only, `def initialize()`   |
| **#**  | code interpolation in a string               |
| **r**  | `attr_reader`                                |
| **w**  | `attr_writer`                                |
| **rw** | `attr_accessor`                              |
| For    | `for x..y.each {}`                           |
| case   | case with a when, must follow a space or tab |
| sw     | same as case                                 |
| optp   | option parser block                          |
| opt    | specific option in options block             |

bash
----

| key   | expands to                                   |
|:------|:---------------------------------------------|
| #!    | at start of first line `#!/usr/bin/env/bash` |
| temp  | create a temp file                           |
| if    | if .. fi template                            |
| case  | case .. esac template                        |
| while | while .. done template                       |

C
-

| key       | expands to                       |
|:----------|:---------------------------------|
| main      | main function with args          |
| **stdio** | `#include <stdio.h>`             |
| **{**     | start a block                    |
| **fori**  | `for (int i; i < count; i++) {}` |

C++
---

includes all the C snippets

| key       | expands to                        |
|:----------|:----------------------------------|
| **ios**   | `#include <iostream>`             |
| **use**   | `using namespace std;`            |
| ns        | namespace wrapper                 |
| **ld**    | lambda                            |
| **fora**  | `for (auto i; i < count; i++) {}` |
| **forin** | `for (auto %x: c) {}`             |
| vec       | `std::vector<int> v;`             |
| map       | `std::map<key, value> m;`         |


Verilog
-------

| key    | expands to        |
|--------|-------------------|
| al     | always block      |
| mod    | module block      |
| if     | if statement      |
| ife    | if else           |
| eif    | else if           |
| el     | else statement    |
| while  | while statement   |
| repeat | repeat statement  |
| case   | case statement    |
| casez  | casez statement   |
| inc    | include statement |
