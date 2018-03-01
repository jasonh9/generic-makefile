# universal makefile for multi file C/C++ applications
# notes:
# automagic header dependencies
# automagic generation of include dir flags
# automagic determination of source files


CC = g++
TARGET ?= testDriver
SRC_DIRS ?= ./src


BOOST_LIBS += -lboost_filesystem -lboost_system -lboost_regex
LDFLAGS += -rdynamic -pthread
LDLIBS += -pthread -lm $(BOOST_LIBS)

# find all the C related files using the 'find' command with wildcard arguments
SRCS := $(shell find $(SRC_DIRS) -name *.cpp -or -name *.c -or -name *.s)
OBJS := $(addsuffix .o,$(basename $(SRCS)))
DEPS := $(OBJS:.o=.d)

INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

CPPFLAGS ?= $(INC_FLAGS) -MMD -MP


# if you build it, they will come.
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $(TARGET) $(LOADLIBES) $(LDLIBS)

# some help flag
help:
	@echo 'make            build all sources by default'
	@echo 'make all        build all sources'
	@echo 'make clean      remove all binaries'
	@echo 'make help       show this help'

.PHONY: clean
clean:
	$(RM) $(TARGET) $(OBJS) $(DEPS)

-include $(DEPS)
