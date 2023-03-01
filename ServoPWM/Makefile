all: servoPWM

servoPWM:
	iverilog -o build/servoPWM src/servoPWM.v test/tb_servoPWM.v
	vvp build/servoPWM > build/servoPWM.txt

clean:
	rm ./build/*
