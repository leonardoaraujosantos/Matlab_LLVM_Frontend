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

#### LLVM
* http://gnuu.org/2009/09/18/writing-your-own-toy-compiler/
* https://github.com/benbjohnson/llvm-c-kaleidoscope

#### Flex Bison
* https://www.cs.wmich.edu/~bhardin/cs4850/flexbison.pdf
* http://alumni.cs.ucr.edu/~lgao/teaching/bison.html
* http://aquamentus.com/flex_bison.html
* http://www.eecg.toronto.edu/~jzhu/csc467/readings/csc467-tut01.pdf
* http://www.eecg.toronto.edu/~jzhu/csc467/readings/csc467-bison-tut.pdf

#### Other Matlab frontend
* https://github.com/rose-compiler/matlab-frontend
