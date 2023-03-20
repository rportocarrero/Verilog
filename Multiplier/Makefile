all: Multiply

Multiply:
	iverilog -o build/multiply src/multiply.v test/tb_multiply.v
	vvp build/multiply > build/multiply.txt

clean:
	rm ./build/*