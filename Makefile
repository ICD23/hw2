SCANNER = scanner
PARSER  = parser
CC      = gcc
CFLAGS  = -Wall -std=c11 -D_POSIX_C_SOURCE=1 -DYYDEBUG=1
LEX     = flex
YACC    = bison
LIBS    = -lfl

YDEBUG	= -x --graph --verbose --report=state

YDEBUGO	= $(PARSER:=.xml) $(PARSER:=.output) $(PARSER:=.png) \
	  $(PARSER:=.html) $(PARSER:=.dot)
EXEC    = $(PARSER)
OBJS    = $(PARSER) \
	      $(SCANNER)
#Note Makefiel have implicit rule for OBJS-> %.o:%.c
OBJS := $(OBJS:=.o)
DEPS := $(OBJS:=.d)

all: $(EXEC)

$(SCANNER): $(SCANNER).c
	$(CC) $(CCFLAGS) $< -o $(SCANNER) $(LIBS)

$(SCANNER).c: %.c: %.l
	$(LEX) -o $@ $<

$(PARSER).c: %.c: %.y
	$(YACC)-d -o $@  $<

.PHONY: debug
debug: $(PARSER).y
	make clean
	$(YACC) $(YDEBUG) -d -o $(PARSER).c  $<
	bash ./debug.sh

$(EXEC): $(OBJS)
	$(CC) -o $@ $^ $(LIBS)

prepare:
	# we have installed the package meet the basic needs
	# you can prepare the extra package you need here, e.g.
	#apt install clang
	#apt install g++

test: all
	make test -C test/

pack:
	make clean
	zip -r icd20-hw2.zip . -x ".*" -x "*.zip" -x "test/*"

.PHONY: clean

clean:
	make clean -C test/
	$(RM) $(SCANNER) $(SCANNER:=.c) $(PARSER:=.c) $(PARSER:=.h) $(DEPS) $(YDEBUGO) $(OBJS) $(EXEC)

DOCKERHUB_ACCOUNT=plaslab
IMAGE_NAME = compiler-f20-hw2
DOCKER_IMG = ${DOCKERHUB_ACCOUNT}/${IMAGE_NAME}:latest

pull:
	docker pull ${DOCKER_IMG}
