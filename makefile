cc = gcc

src_files = $(subst $(src_path)/,,$(wildcard $(src_path)/*.c))
obj1_files = $(src_files:.c=.o)
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

print-%  :
	@echo $* = $($*)

clean : 
	del $(clean_files)

%.o : %.c %.h
	$(cc) -c -I$(inc_path) $< -o $@
	$(cc) -MM -I$(inc_path) $< > $(dep_path)\$*.d
	
app.exe : $(OBJ)
	$(cc) -I$(dep_path) $^ -o $@
	
