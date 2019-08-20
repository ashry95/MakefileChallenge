vpath %.c ./Src

dep= ./Dependencies/

cc= gcc

CFlag= 


src= DIO.c  \
     LCD.c  \
     main.c \
     

inc= -I./Inc/

obj= DIO.o  \
     LCD.o  \
     main.o \

all : $(obj)
	cd Dependencies ; $(cc) $^ ashry-yehia-seif-tharwat.o -o  $@


clean:


%.o : %.c
	$(cc) -c $(inc)  $< -o $(dep)$@


