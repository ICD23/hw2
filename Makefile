SCANNER = scanner
PARSER  = parser
CC      = gcc
CFLAGS  = -Wall -std=c11
LEX     = flex
YACC    = bison
LIBS    = -lfl

EXEC    = $(PARSER)
OBJS    = $(PARSER) \
	      $(SCANNER)
OBJS := $(OBJS:=.o)
DEPS := $(OBJS:=.d)

all: $(EXEC)

$(SCANNER): $(SCANNER).c
	$(CC) $(CCFLAGS) $< -o $(SCANNER) $(LIBS)

$(SCANNER).c: %.c: %.l
	$(LEX) -o $@ $<

$(PARSER).c: %.c: %.y
	$(YACC) -d -o $@ -v $<

$(EXEC): $(OBJS)
	$(CC) -o $@ $^ $(LIBS)

prepare:
	# we have installed the package meet the basic needs
	# you can prepare the extra package you need here, e.g.
	#apt install clang
	#apt install g++
	sudo apt install flex=2.6.4-6.2
	sudo apt install libfl-dev
	sudo apt install bison

test: all
	make test -C test/

pack:
	make clean
	zip -r icd22-hw2.zip . -x ".*" -x "*.zip" -x "test/*"

.PHONY: clean

clean:
	make clean -C test/
	$(RM) $(SCANNER) $(SCANNER:=.c) $(PARSER:=.c) $(PARSER:=.h) $(DEPS) $(PARSER:=.output) $(OBJS) $(EXEC)

DOCKERHUB_ACCOUNT=plaslab
IMAGE_NAME = compiler-f20-hw2
DOCKER_IMG = ${DOCKERHUB_ACCOUNT}/${IMAGE_NAME}:latest

pull:
	docker pull ${DOCKER_IMG}
