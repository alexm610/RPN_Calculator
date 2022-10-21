CC=vlog
FLAGS=-v
OBJS=*.v

default: rpn

rpn: $(OBJS)
	@echo "RPN compilation begun..."
	$(CC) $(FLAGS) $(OBJS)
	@echo "------------------------------------------------------------"
	@echo " Compilation of Reverse Polish Notation Calculator complete "
	@echo "------------------------------------------------------------"