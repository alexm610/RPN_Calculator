CC=wine64 c51
PORTN=/dev/$(shell ls /dev | grep "cu.usbserial")
DEPS=initialize.h
OBJS=blinky.obj main.obj
export WINEDEBUG=-all

default: main.hex

# to build the hex file, only dependent on obj file
main.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo ".hex file built..."
	@echo " "
	@echo "Compilation of main.c complete."
	@echo " "

# obj file is dependent upon c source code, and initialize.h header file
main.obj: main.c $(DEPS)
	$(CC) -c main.c
	@echo "main.obj file built..."

blinky.obj: blinky.c $(DEPS)
	$(CC) -c blinky.c
	@echo "blinky.obj file built..."

loadflash: 
	@echo "Flashing microcontroller..."
	@echo " "
	./at89lps -r -p$(PORTN) lab5.hex

clean: 
	$(RM) blinky.asm blinky.lkr blinky.lst blinky.map blinky.obj blinky.hex