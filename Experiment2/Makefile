#File: Makefile
#Project: RLGlue framework for B659-Reinforcement Learning spring 2017
#Author: Adam White, Matthew Schlegel
#Last Modified By: Matthew Schlegel
#Modified On: Jan 3, 2017
#
include Makefile.settings

###################################
#Don't change unless you know what you are doing!!!!! ALSO I WILL BE USING THE ORIGINAL VERSION OF THIS FILE.

ifeq ($(language_selection), c)
GXX = $(CC)
else ifeq ($(language_selection), c++)
GXX = $(PP)
else ifeq ($(language_selection), cpp)
GXX = $(PP)
else
GXX = $(CC)
endif

#Function for making sure the bin directory exists.
dir_guard=@mkdir -p $(@D)

# -g for debugging add extra options if you want for both c and cpp compiling
OPTS = -g

# Command line extra flags for c compiling
CFLAGS := $(EXTRA_CFLAGS)

# Command line extra flags for CXX (i.e. if you want c++11 use  make language_selection = c++ EXTRA_CXXFLAGS = -std=c++11) compiling
CPPFLAGS := $(EXTRA_CPPFLAGS)
#For C++11 uncomment below and comment above.
#CPPFLAGS := -std=c++11 $(EXTRA_CPPFLAGS)

ifeq ($(language_selection), c)
CXXFLAGS = $(CFLAGS)
else ifeq ($(language_selection), c++)
CXXFLAGS = $(CPPFLAGS)
else ifeq ($(language_selection), cpp)
CXXFLAGS = $(CPPFLAGS)
else
CXXFLAGS = $(CFLAGS)
endif

OBJSTMP1 = $(FILES:%.cxx=%.o)
OBJSTMP2 = $(OBJSTMP1:%.c=%.o)
OBJS = $(OBJSTMP2:%.cpp=%.o)

#You shouldn't have to change this. Only for compiling the RLGlue framework
RLGLUEOBJS = rlglue/RL_glue.o
RLGLUEFOLDER = rlglue/


all:	$(BUILD)$(PROG)
	
#run make clean to cleanup the executable and bin files.
clean:
	rm -rf $(BIN) $(BUILD)$(PROG)

run: $(BUILD)$(PROG)
	./$(BUILD)$(PROG)

$(BUILD)$(PROG): $(addprefix $(BIN), $(OBJS)) $(addprefix $(BIN), $(RLGLUEOBJS))
	$(dir_guard)
	$(GXX) $(OPTS) $(CXXFLAGS) $(INCLUDE) -o $@ $^ $(LIBS)

$(BIN)$(RLGLUEFOLDER)%.o: $(SRC)$(RLGLUEFOLDER)%.c
	$(dir_guard)
	$(CC) -c $(OPTS) $(CFLAGS) $(INCLUDE) $< -o $@

$(BIN)%.o: $(SRC)%.c
	$(dir_guard)
	$(CC) -c $(OPTS) $(CFLAGS) $(INCLUDE) $< -o $@
	
$(BIN)%.o: $(SRC)%.cpp
	$(dir_guard)
	$(PP) -c $(OPTS) $(CFLAGS) $(INCLUDE) $< -o $@

$(BIN)%.o: $(SRC)%.cxx
	$(dir_guard)
	$(GXX) -c $(OPTS) $(CXXFLAGS) $(INCLUDE) $< -o $@

##################################
