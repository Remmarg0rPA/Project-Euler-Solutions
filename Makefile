GHC=ghc
OUT=a.out
FILE=0

make:
	@if [ $(FILE) != 0 ]; then\
		$(GHC) --make $(FILE);\
	else \
		echo "You must specify a file name in the 'FILE' variable";\
	fi

make-run:
	@if [ $(FILE) != 0 ]; then\
		$(GHC) --make $(FILE) -o $(OUT) && ./$(OUT);\
	else \
		echo "You must specify a file name in the 'FILE' variable";\
	fi

clean:
	rm -fv *hi *.o a.out