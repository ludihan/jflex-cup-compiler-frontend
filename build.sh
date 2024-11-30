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

etapa1() {
    java -jar $FLEX -d build src/etapa1_scanner.flex
    javac -cp "$CLASSPATH" -d build src/Etapa1.java
	java -cp "$CLASSPATH" Etapa1 input/input_etapa1.tinyc
}

etapa2() {
	java -jar $CUP -destdir build -parser Parser -symbols Sym src/etapa2_parser.cup
    javac -cp "$CLASSPATH" -d build src/Etapa2.java
	java -cp "$CLASSPATH" Etapa2
}

etapa3() {
    etapa1
    etapa2
	java -cp "$CLASSPATH" Etapa3
}

example() {
	mkdir -p build
	java -jar $FLEX -d build src/example_scanner.flex
	java -jar $CUP -destdir build -parser Parser -symbols Sym src/example_parser.cup
	javac -cp "$CLASSPATH" -d build src/Example.java
	java -cp "$CLASSPATH" Example
}

clean() {
    echo "build dir deleted"
    rm -rf build
}

mkdir -p build

case "$1" in
    "etapa1")
        etapa1 
        ;;
    "etapa2")
        etapa2 
        ;;
    "etapa3")
        etapa3 
        ;;
    "example")
        example
        ;;
    "clean")
        clean
        ;;
    "")
        echo "please provide an argument to this script!!"
        echo "read the README!!!" 
        ;;
esac
