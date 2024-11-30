#!/bin/sh

set -e

OS=`uname`
FLEX="lib/jflex-full-1.9.1.jar"
CUP="lib/java-cup-11b.jar"

if [ "$OS" = "Linux" ]; then
    CLASSPATH="build:lib/java-cup-11b.jar:lib/java-cup-11b-runtime.jar:lib/jflex-full-1.9.1.jar"
else
    CLASSPATH="build;lib/java-cup-11b.jar;lib/java-cup-11b-runtime.jar;lib/jflex-full-1.9.1.jar"
fi

if [ -z "$1" ]; then
    echo "please provide an argument to this script!!"
    echo "read the README!!!"
fi

if [ "$1" = "etapa1" ]; then
	mkdir -p build
fi

if [ "$1" = "etapa2" ]; then
	mkdir -p build
fi

if [ "$1" = "etapa3" ]; then
	mkdir -p build
fi

if [ "$1" = "example" ]; then
	mkdir -p build
	java -jar $FLEX -d build src/example_scanner.flex
	java -jar $CUP -destdir build -parser Parser -symbols Sym src/example_parser.cup
	javac -cp "$CLASSPATH" -d build src/Example.java
    echo "### DONE COMPILING ###"
	java -cp "$CLASSPATH" Example
fi

if [ "$1" = "clean" ]; then
    echo "build dir deleted"
    rm -rf build
fi
