`define OP 8
`define ADDR 8

module controller(
    clk, nrst,
    ir_load, ir_valid, ir_address,
    pc_inc, pc_load, pc_valid,
    mdr_load,
    mar_load, mar_valid
    m_en, m_rw,
    alu_op,
    alu_valid
);

// Interface defenitions
input clk;  // Clock input
input nrst; // reset (active low)

output ir_load;
output ir_valid;
input ['ADDR-1:0] ir_address;

output pc_inc;
output pc_load;
output pc_valid;

output alu_valid;   // ALU output is ir_valid

output mdr_load;
output mar_load;
output mar_valid;
output m_en;
output m_rw;

output [`OP-1:0] alu_op;    // ALU OP code

// Register defenitions

reg ir_load;
reg ir_valid;

reg pc_inc;
reg pc_load;
reg pc_valid;

reg alu_valid;  // ALU output is ir_valid

reg mdr_load;
reg mar_load;
reg mar_valid;
reg m_en;
reg m_rw;

reg [`OP-1:0] alu_op;   // ALU OP code

reg [3:0] state;    // state variables

always @(posedge clk) begin

    if(nrst==0) begin
        acc <= 0;
    end
    else begin
        case (state)
            8'h00: begin
                mar_load <= 1;
                pc_load <= 1;
                pc_inc <= 1;
            end
        // Complete State Defenitions Here

        // Catch all state to avoid unknown conditions
        default: state <= 0;

        endcase
        if (acc==0) begin
            alu_zero <= 1;
        end
        else begin
            alu_zero <= 0;
        end
    end
end

always @(posedge clk or posedge rst)
begin
    if (rst == 0)
        state = s0;
    else
        case(state)
            s0:
                state = s1;
            s1:
                if (choice)
                    state = s3;
                else
                    state = s0;
            s2:
                state = s0;
            s3:
                state = s0;
            endcase
        end
endmoduel