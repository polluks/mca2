ASSEMBLER6502	= acme
AS_FLAGS	= -v2 -Wtype-mismatch
RM		= rm

PROGS		= mca2.prg
SRCS		= mca2.a _autogenerated.a

all: $(PROGS)

mca2.prg: $(SRCS)
	$(ASSEMBLER6502) $(AS_FLAGS) --outfile mca2.prg --format cbm mca2.a

_autogenerated.a: conv.py situations.py
	./conv.py situations.py > _autogenerated.a

clean:
	-$(RM) -f *.o *.tmp $(PROGS) *~ core
