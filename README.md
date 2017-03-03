# GenericMakefile
Generic Makefile for C/C++

動作の詳細: https://admiswalker.blogspot.jp/2017/02/makefile.html

## 使用手順
_1. Makefile をコピーしてルートディレクトリに設置する．(Makefile 以外のファイルは，動作確認用のサンプルコードである)  
_2. SRCDIR，および，CFLAGS を設定する．  
    例:   
```
      SRCDIR  = *.cpp source/*.cpp source/SubDir1/*.cpp
      CFLAGS  = -L/home/usr/lib -I/home/usr/include
      CFLAGS += -Wall -O3
```
_3. make する  

## 想定するディレクトリ構成例
```
 exampledir/
   |
   + Makefile (this file)
   |
   + exe (executable file)
   |
   + make_temp/ (temporary directory for make)
   |
   + *.cpp
   |
   + source/
   |   |
   |   + *.cpp
   |   |
   |   + SubDir1/
   |       |
   |       + *.cpp
   |
   + include/
       |
       + *.hpp
 ```
