cc = gcc

src_path = ./Src
inc_path = ./Inc
dep_path = .\Dependencies

src_files1 = $(subst $(src_path)/,,$(wildcard $(src_path)/*.c))
src_files2 = $(wildcard $(src_path)/*.c)
obj_files1 = $(subst .c,.o,$(src_files1))
obj_files2 = ashry-yehia-seif-tharwat.o
dep_files1 = $(subst .c,.d,$(src_files1))
dep_files2 = $(subst .c,.d,$(subst $(src_path)/,$(dep_path)\,$(src_files2)))
link_target = app.exe
clean_files = $(obj_files1) $(link_target) $(dep_files2)