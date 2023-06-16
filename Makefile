# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hatesfam <hatesfam@student.abudhabi42.a    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/09 13:57:03 by hatesfam          #+#    #+#              #
#    Updated: 2023/06/16 21:01:46 by hatesfam         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SOURCES = server.c client.c utils.c ft_atoi.c
OBJECTS = $(SOURCES:.c=.o)

SOURCES_B = server_bonus.c client_bonus.c utils.c ft_atoi.c
OBJECTS_B = $(SOURCES_B:.c=.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: server client server_bonus client_bonus

m: server client

bonus: server_bonus client_bonus

server: server.o utils.o ft_atoi.o
	$(CC) -o $@ $< utils.o ft_atoi.o

client: client.o utils.o ft_atoi.o
	$(CC) -o $@ $< utils.o ft_atoi.o

server_bonus: server_bonus.o utils.o ft_atoi.o
	$(CC) -o $@ $< utils.o ft_atoi.o

client_bonus: client_bonus.o utils.o ft_atoi.o
	$(CC) -o $@ $< utils.o ft_atoi.o

%.o: %.c
	$(CC) -c $(CFLAGS) $?

clean:
	rm -f $(OBJECTS)
	rm -f $(OBJECTS_B)
	
fclean: clean
	rm -f server client server_bonus client_bonus

re: fclean all

.PHONY: all bonus clean fclean re