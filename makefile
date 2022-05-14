CC=gcc
OBJS=stack_functions.o rpn.o

default: rpn_calc

# to build the hex file, only dependent on obj file
rpn_calc: $(OBJS)
	$(CC) $(OBJS) -o rpn_calc
	@echo "RPN executable file built..."
	@echo "------------------------------------------------------------"
	@echo " Compilation of Reverse Polish Notation Calculator complete "
	@echo "------------------------------------------------------------"

sonar.o: sonar.c prototypes.h
	$(CC) -c sonar.c
	@echo "sonar.obj file built..."

stack_functions.obj: stack_functions.c prototypes.h
	$(CC) -c stack_functions.c 
	@echo "stack_functions.obj file built..."

rpn.obj: rpn.c prototypes.h
	$(CC) -c rpn.c 
	@echo "rpn.obj file built..."

clean: 
	$(RM) rpn.o
	$(RM) stack_functions.o
	$(RM) rpn_calc