COMPLR = gcc
CFLAGS = -Wall -Wextra -g
SRCDIR = lib
INCDIR = header
BINDIR = bin
TARGET = algorithms
DEPEND = 

SOURCES := main.c $(wildcard $(SRCDIR)/*.c) $(wildcard *.c)
HEADERS := $(wildcard $(INCDIR)/*.h) $(wildcard *.h)
OBJECTS := $(SOURCES:.c=.o)

$(BINDIR)/$(TARGET): $(OBJECTS)
	@mkdir $(BINDIR)
	@$(COMPLR) $(CFLAGS) -I$(INCDIR) $^ -o $@ $(DEPEND)
	@echo "Executable created: $(BINDIR)/$(TARGET)"

%.o: %.c $(HEADERS)
	@$(COMPLR) $(CFLAGS) -I$(INCDIR) -c $< -o $@ $(DEPEND)

run:
	@./$(BINDIR)$(TARGET)

debug:
	@gdb ./$(BINDIR)/$(TARGET)

clean:
	@rm -rf $(SRCDIR)/*.o
	@rm -rf *.o
	@rm -rf $(BINDIR)
	@echo "Cleaned up the mess."

.PHONY: clean