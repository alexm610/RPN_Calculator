struct stack
{
	double data;
	struct stack *next;
};

struct stack *display(struct stack*);
struct stack *push(struct stack*, double);
struct stack *pop(struct stack*);