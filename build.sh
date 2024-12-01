#!/bin/sh

set -e

OS=$(uname)
FLEX="lib/jflex-full-1.9.1.jar"
CUP="lib/java-cup-11b.jar"

if [ "$OS" = "Linux" ]; then
    CLASSPATH="build:lib/java-cup-11b.jar:lib/java-cup-11b-runtime.jar:lib/jflex-full-1.9.1.jar"
else
    CLASSPATH="build;lib/java-cup-11b.jar;lib/java-cup-11b-runtime.jar;lib/jflex-full-1.9.1.jar"
fi

build_lexer() {
    java -jar $FLEX -d build src/"$1"
}

build_parser() {
    java -jar $CUP -destdir build src/"$1"
}

mkdir -p build

case "$1" in
    "etapa1")
        build_lexer "etapa1_scanner.flex"

        javac -cp "$CLASSPATH" -d build build/scanner.java


        java -cp "$CLASSPATH" scanner input/input.txt
        ;;
    "etapa2")
        echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa
        build_lexer "etapa2_scanner.flex"

        echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
        build_parser "etapa2_parser.cup"

        javac -cp "$CLASSPATH" -d build build/scanner.java
        javac -cp "$CLASSPATH" -d build build/sym.java
        javac -cp "$CLASSPATH" -d build build/parser.java


        javac -cp "$CLASSPATH" -d build src/Etapa2.java
        java -cp "$CLASSPATH" Etapa2
        ;;
    "etapa3")
        echo "nao feito"
        ;;
    "clean")
        echo "build dir deleted"
        rm -rf build
        ;;
    "")
        echo "please provide an argument to this script!!"
        echo "read the README!!!"
        ;;
esac
