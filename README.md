# GenericMakefile
Generic Makefile for C++

## 使用手順
01. Makefile をコピーしてルートディレクトリに設置する．
02. SRCDIR，および，CFLAGS を設定する．  
    例:   
```
      SRCDIR  = \*.cpp source/\*.cpp
      CFLAGS  = -L/home/usr/lib -I/home/usr/include
      CFLAGS += -Wall -O3
```

## 想定するディレクトリ構成
```
 exampledir
 |
 + Makefile
 |
 + make_temp/ (temporary directory for make)
 |
 +  *.cpp
 |
 + source/
 |  |
 |  + *.cpp
 |  |
 |  └ SubDir1
 |      |
 |      + *.cpp
 |
 + exe (executable file)
 ```
