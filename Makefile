TARGET = tsschecker_tool
CFLAGS += -Wall -std=c11
LDFLAGS += -lplist -lpartialzip-1.0 -lz -lcurl -lcrippy-1.0 -lxml2 -lm
SRC_DIR += tsschecker
OBJECTS += $(SRC_DIR)/main.o $(SRC_DIR)/download.o $(SRC_DIR)/jsmn.o $(SRC_DIR)/tss.o $(SRC_DIR)/tsschecker.o
all : $(TARGET)

$(TARGET) : $(OBJECTS)
		$(CC) $(CFLAGS) $(OBJECTS) $(LDFLAGS) -o $(TARGET)
		@echo "Successfully built $(TARGET)"

$(SRC_DIR)/%.o : $(SRC_DIR)/%.c
		$(CC) $(CFLAGS)  $< -c -o $@

install : $(TARGET)
		cp $(TARGET) /usr/local/bin/
		@echo "Installed $(TARGET)"
clean :
		rm -rf tsschecker/*.o $(TARGET)	
