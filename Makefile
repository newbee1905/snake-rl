PYTHON_INCLUDE = /usr/include/python3.8
PYTHON_LIB = /usr/lib/python3.8

CSNAKE_DIR = csnake

INCLUDE_DIR = $(CSNAKE_DIR)/include
SRC_DIR = $(CSNAKE_DIR)/src
BUILD_DIR = $(CSNAKE_DIR)/build

CFLAGS = -I$(PYTHON_INCLUDE) -L$(PYTHON_LIB) -lpython3.8 -I$(INCLUDE_DIR)

# List all source files in the src directory
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)

# Generate corresponding object file names
OBJ_FILES := $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRC_FILES))

lib: $(BUILD_DIR)/csnake.so

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(BUILD_DIR)
	gcc -c -o $@ $< $(CFLAGS)

$(BUILD_DIR)/csnake.so: $(OBJ_FILES)
	gcc -shared -o $@ $^

clean:
	rm -rf $(BUILD_DIR)

.PHONY: clean
