#-include $(obj1_files_files:.c=.o)
src_files = $(wildcard $(src_path)/*.c)
obj1_files := $(patsubset %.c,%.o,$(wildcard $(src_path)/*.c))

cc = gcc
#src_files = DIO.c LCD.c main.c
#obj1_files = DIO.o LCD.o main.o
obj2_files = ashry-yehia-seif-tharwat.o
OBJ = $(obj1_files) $(obj2_files)
link_target = app.exe
clean_files = $(obj1_files) $(link_target)

src_path = ./Src
inc_path = ./Inc
dep_path = ./Dependencies

vpath %.c $(src_path)
vpath %.h $(inc_path)
#vpath %.o $(dep_path)

clean : 
	del $(clean_files)
	
#%.o : %.c %.h
#	$(cc) -c -o $@ $< -I$(inc_path)

%.o : %.c %.h
	$(cc) -c -I$(inc_path) $< -o $(dep_path)/$@
	
app.exe : $(OBJ)
	$(cc) -I$(dep_path) $^ -o $@

#%.d : %.c
#	$(cc) -M -I$(inc_path) $< -MF $(dep_path)/$@

#%.o : %.c %.h
#	$(cc) -MD -c $< -o $@
	
#%.o : %.d
#	$(cc) -c -I$(inc_path) $< -o $@