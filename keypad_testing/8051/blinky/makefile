CC=wine64 c51
PORTN=/dev/cu.usbserial-DN01CSVW
DEPS=prototypes.h
OBJS=main.obj blinky.obj initialize.obj # the hex file is named after which of these obj's is first
export WINEDEBUG=-all

default: main.hex

# to build the hex file, only dependent on obj file
main.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo ".hex file built..."
	@echo " "
	@echo "Compilation of blinky complete."
	@echo " "

# obj file is dependent upon c source code, and initialize.h header file
main.obj: main.c $(DEPS)
	$(CC) -c main.c
	@echo "main.obj file built..."

blinky.obj: blinky.c $(DEPS)
	$(CC) -c blinky.c
	@echo "blinky.obj file built..."

initialize.obj: initialize.c $(DEPS)
	$(CC) -c initialize.c 
	@echo "initialize.obj file built..."

flash: 
	@echo "Flashing microcontroller..."
	@echo " "
	at89lps -r -p$(PORTN) main.hex

clean: 
	$(RM) blinky.asm blinky.lkr blinky.lst blinky.map blinky.obj blinky.hex
	$(RM) initialize.asm initialize.lst initialize.obj 
	$(RM) main.asm main.lst main.obj 