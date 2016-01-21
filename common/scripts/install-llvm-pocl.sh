#!/bin/bash -x

ssh-add
if [ $? -ne 0 ]; then echo "Error: could not add ssh key with ssh-add."; return -1; fi
TOP=$PWD
INSTALL=$TOP/install

if [ ! -d llvm ]; then git clone https://github.com/llvm-mirror/llvm.git; fi
cd $TOP/llvm
git checkout release_37; git pull;
cd $TOP/llvm/tools/;
if [ ! -d clang ]; then git clone git@github.com:llvm-mirror/clang.git; fi
cd $TOP/llvm/tools/clang; git checkout release_37; git pull;
cd $TOP/llvm/projects;
if [ ! -d compiler-rt ]; then git clone https://github.com/llvm-mirror/compiler-rt.git; fi
cd $TOP/llvm/projects/compiler-rt; git checkout release_37; git pull;

cd $TOP/llvm;
if [ ! -d build ]; then mkdir build; fi
cd $TOP/llvm/build; 
#../configure --enable-optimized --enable-shared --prefix=$INSTALL && make -j 16  && make install
cmake -DBUILD_SHARED_LIBS=ON -DLLVM_ENABLE_RTTI=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$INSTALL ..
make -j 16 && make install;
cd $TOP;

if [ ! -d pocl ]; then git clone git@github.com:pocl/pocl.git; fi
cd $TOP/pocl
./autogen.sh
mkdir build;
cd build;
../configure --prefix=$INSTALL
make -j 16 && make install
cd ../..;
