#!/bin/sh

set -e

FLEX="lib/jflex-full-1.9.1.jar"
CUP="lib/java-cup-11b.jar"
LIBS="build:lib/java-cup-11b.jar:lib/java-cup-11b-runtime.jar:lib/jflex-full-1.9.1.jar"

if [ -z "$1" ]; then
    echo "execute 'sh build.sh' com os argumentos build, clean ou run"
fi

if [ "$1" = "build" ]; then
	mkdir -p build
	java -jar $FLEX -d build src/calc.flex
	java -jar $CUP -destdir build -parser parser -symbols sym src/calc.cup
	javac -cp "$LIBS" -d build src/Main.java
fi

if [ "$1" = "clean" ]; then
    rm -rf build
fi

if [ "$1" = "run" ]; then
	java -cp "$LIBS" Main
fi
