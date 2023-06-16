# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hatesfam <hatesfam@student.abudhabi42.a    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/09 13:57:03 by hatesfam          #+#    #+#              #
#    Updated: 2023/06/15 16:26:31 by hatesfam         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SOURCES = server.c client.c
OBJECTS = $(SOURCES:.c=.o)
SOURCES_B = server_bonus.c client_bonus.c
OBJECTS_B = $(SOURCES_B:.c=.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: server client server_bonus client_bonus

m: server client

bonus: server_bonus client_bonus

server: server.o libft
	$(CC) -o $@ $< -Llibft -lft

client: client.o libft
	$(CC) -o $@ $< -Llibft -lft

server_bonus: server_bonus.o libft
	$(CC) -o $@ $< -Llibft -lft

client_bonus: client_bonus.o libft
	$(CC) -o $@ $< -Llibft -lft

%.o: %.c
	$(CC) -c $(CFLAGS) $?

libft:
	make -C libft

clean:
	rm -f $(OBJECTS)
	rm -f $(OBJECTS_B)
	make -C libft clean
	
fclean: clean
	rm -f server client server_bonus client_bonus libft/libft.a

re: fclean all

.PHONY: all bonus libft clean fclean re