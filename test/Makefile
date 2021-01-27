EXE     := ../parser
SRCS    := $(wildcard */*.p)
OBJS    := $(patsubst %.p,output/%.token,$(SRCS))

all: output $(OBJS)

output/%.token: %.p
	@-mkdir -p output/$$(dirname $^)
	@-./$(EXE) $^ > $@.src 2>$@.info

test: all
	@bash test.sh

output:
	mkdir -p $@

clean:
	$(RM) -rf output
