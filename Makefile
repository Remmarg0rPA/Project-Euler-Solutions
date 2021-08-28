GHC=ghc
OUT=a.out
FILE=0

make:
	@if [ $(FILE) != 0 ]; then\
		$(GHC) --make $(FILE);\
	else \
		echo "You must specify a file name in the variable 'FILE' ";\
	fi

make-run:
	@if [ $(FILE) != 0 ]; then\
		$(GHC) --make $(FILE) -o $(OUT);\
	else \
		echo "You must specify a file name in the variable 'FILE' ";\
	fi; \
	./$(OUT)

clean:
	rm -fv *hi *.o *.out