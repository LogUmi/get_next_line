NAME =	libftgetnextline.a
DIRSR =	srcs/
DIROB =	objs/
DIRLI =	includes/
FILEH = get_next_line.h
FILEHB = get_next_line_bonus.h
FILEC =	get_next_line.c \
		get_next_line_utils.c 
SRCS =	$(addprefix $(DIRSR), $(FILEC))
OBJS =	$(addprefix $(DIROB), $(FILEC:.c=.o))
HDRS =	$(addprefix $(DIRLI), $(FILEH))
FILEBONUS = get_next_line_bonus.c \
			get_next_line_utils_bonus.c 
SRCSBONUS =	$(addprefix $(DIRSR), $(FILEBONUS))
OBJSBONUS =	$(addprefix $(DIROB), $(FILEBONUS:.c=.o))
HDRSBONUS = $(addprefix $(DIRLI), $(FILEHB))
CC =	cc
FLAGS =	-Wall -Wextra -Werror
AR =	ar -crs

all:		initdir $(NAME)

$(NAME):	$(OBJS)
			$(AR) $(NAME) $(OBJS)

$(DIROB)%.o:	$(DIRSR)/%.c $(HDRS)
				$(CC) $(FLAGS) -c $< -o $@ -I$(DIRLI)

# Création du dossier obj/ si nécessaire
initdir:
			mkdir -p $(DIROB)

bonus:		initdir $(OBJS) $(OBJSBONUS)
			$(AR) $(NAME) $(OBJS) $(OBJSBONUS)

$(DIROB)%_bonus.o:	$(DIRSR)/%_bonus.c $(HDRSBONUS)
					$(CC) $(FLAGS) -c $< -o $@ -I$(DIRLI)

clean:	
			rm -rf $(OBJS) $(OBJSBONUS)

fclean:		clean
			rm -rf $(NAME)

re:			fclean all

.PHONY:		all clean fclean re