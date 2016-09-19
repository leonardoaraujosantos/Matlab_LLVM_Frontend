# Matlab LLVM Frontend

## Scanning and Parsing
Roughly speaking, scanning divides the input into meaningful chunks, called tokens,
and parsing figures out how the tokens relate to each other. For example, consider this
snippet of C code:
```C
alpha = beta + gamma ;
```
A scanner divides this into the tokens alpha, equal sign, beta, plus sign, gamma, and
semicolon. Then the parser determines that beta + gamma is an expression, and that the
expression is assigned to alpha.

### Emiting code
After the parser outputs an AST tree, we just emit LLVM code for each tree node. The result is LLVM working version of a matlab program.

### Example Matlab Input
``` matlab
function result = justSum(a,b)
  result = a + b
end
```

### Result LLVM IR
``` llvm
; Simple sum function
define double @justSum(double %a, double %b) #0 {
  %result = fadd double %a, %b
  ret double %result
}
```

### Chaning LLVM IR to output something .... (printf is part of LLVM)
``` llvm
; Declare 8-byte vector ['4','+','4','=','%','f','\0A','\00']
@.str = private unnamed_addr constant [8 x i8] c"4+4=%f\0A\00", align 1

; Declare prototype for printf
declare i32 @printf(i8*, ...)

; Same function
define double @justSum(double %a, double %b) #0 {
  %result = fadd double %a, %b 
  ret double %result
}

; main function 
define i32 @main() #0 {
  %1 = call double @justSum(double 4.000000e+00, double 4.000000e+00)
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), double %1)
  ret i32 0
}
```
### Interpretting IR

#### Interpret LLVM IR
```
lli justSum.ll

4+4=8.000000
```

#### Convert LLVM IR to byte code
```
llvm-as justSum.ll -o justSum.bc
```

### Motivation
After our program is converted to LLVM IR we can do a lot of stuff like:
* Convert to other languages (Ex: Javascript or C/C++)
* Compile to other architectures (ARM, x86-64, Mips, etc...)

#### Generate x86-64
```
llc -march=x86-64 justSum.ll -o justSum.S
```

#### Compile generated x86-64 Assembly code
```
clang -o justSum justSum.S
```

#### Generate ARM 64-bit
```
llc -march=aarch64 justSum.ll -o justSum.S
```
#### Generate Javascript (requires emscripten)
```
emcc justSum.ll -o justSum.js
```
``` JavaScript
function _justSum($a,$b){
 var label=0;


 var $result=($a)+($b);
 return $result;
}

```
Creating a webpage with results
```
emcc justSum.ll -o justSum.html
```


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
* https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_Form
* https://en.wikipedia.org/wiki/Just-in-time_compilation
* https://en.wikipedia.org/wiki/Formal_grammar
* https://en.wikipedia.org/wiki/Parsing

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
* http://llvm.org/devmtg/2013-11/slides/Zakai-Emscripten.pdf

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

#### Antlr (Version 3 output C/C++ code)
* https://theantlrguy.atlassian.net/wiki/display/ANTLR3/Code+Generation+Targets
* https://github.com/ewiger/decade/tree/master/lib/mparser

#### Other Matlab frontend
* https://github.com/rose-compiler/matlab-frontend
