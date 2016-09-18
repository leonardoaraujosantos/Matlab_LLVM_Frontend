# Matlab LLVM Frontend

## Idea
* Use the LLVM infrastructure to compile machine code based on Matlab/Octave syntax.
* Generate C/C++/Javascript code from generated IR code.

## Installation
```
git clone https://github.com/leonardoaraujosantos/Matlab_LLVM_Frontend.git
cd Matlab_LLVM_Frontend
mkdir build
cd build
cmake ..
make
```

## Usage
``` bash
mat2llvm simpleFunc.m -o simpleFunc.ll
```

### Where are we?
We're going to work on the part related to Scanning, Parsing, and emiting Intermediate code.

![alt tag](https://raw.githubusercontent.com/leonardoaraujosantos/Matlab_LLVM_Frontend/master/docs/imgs/compiler_wiki.png)


### Reference Tutorials
Bellow we can find some references used by me during the project.

#### Compilers
* https://en.wikipedia.org/wiki/Compiler
* https://en.wikipedia.org/wiki/Static_single_assignment_form
* https://en.wikipedia.org/wiki/Abstract_syntax_tree

#### LLVM
* http://llvm.org/
* http://gnuu.org/2009/09/18/writing-your-own-toy-compiler/
* https://github.com/benbjohnson/llvm-c-kaleidoscope
* http://llvm.org/docs/ProgrammersManual.html
* http://llvm.org/docs/LangRef.html
* http://adriansampson.net/blog/llvm.html
* http://www.wilfred.me.uk/blog/2015/02/21/my-first-llvm-compiler/
* https://idea.popcount.org/2013-07-24-ir-is-better-than-assembly/
* https://pauladamsmith.com/blog/2015/01/how-to-get-started-with-llvm-c-api.html
* http://dev.stephendiehl.com/numpile/
* http://kripken.github.io/emscripten-site/index.html
* http://stackoverflow.com/questions/11485531/what-exactly-phi-instruction-does-and-how-to-use-it-in-llvm

#### Flex Bison
* https://www.cs.wmich.edu/~bhardin/cs4850/flexbison.pdf
* http://alumni.cs.ucr.edu/~lgao/teaching/bison.html
* http://aquamentus.com/flex_bison.html
* http://www.eecg.toronto.edu/~jzhu/csc467/readings/csc467-tut01.pdf
* http://www.eecg.toronto.edu/~jzhu/csc467/readings/csc467-bison-tut.pdf
* https://gist.github.com/codebrainz/2933703
* http://www.eecg.toronto.edu/~jzhu/csc467/readings/csc467-bison-tut.pdf
* https://github.com/jimmahoney/bison_calculator?files=1
* https://www.gnu.org/software/bison/manual/html_node/Graphviz.html

#### Other Matlab frontend
* https://github.com/rose-compiler/matlab-frontend
