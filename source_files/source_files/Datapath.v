////   Data Path /////
module data_path #(
    parameter PC_W = 8,       // Program Counter
    parameter INS_W = 32,     // Instruction Width
    parameter RF_ADDRESS = 5, // Register File Address
    parameter DATA_W = 32,    // Data WriteData
    parameter DM_ADDRESS = 9, // Data Memory Address
    parameter ALU_CC_W = 4    // ALU Control Code Width
 )(
    input                  clk ,    // CLK in datapath figure
    input                  reset,   // Reset in datapath figure      
    input                  reg_write,   // RegWrite in datapath figure
    input                  mem2reg,     // MemtoReg in datapath figure
    input                  alu_src,     // ALUSrc in datapath figure 
    input                  mem_write,   // MemWrite in datapath figure  
    input                  mem_read,    // MemRead in datapath figure          
    input  [ALU_CC_W-1:0]  alu_cc,      // ALUCC in datapath figure
    output          [6:0]  opcode,      // opcode in dataptah figure
    output          [6:0]  funct7,      // Funct7 in datapath figure
    output          [2:0]  funct3,      // Funct3 in datapath figure
    output   [DATA_W-1:0]  alu_result,   // Datapath_Result in datapath figure
    wire      [PC_W-1: 0]  PCPlus4,
    wire      [PC_W-1: 0]  PC,
    wire      [INS_W-1:0]  Instruction,
    wire      [INS_W-1:0]  ExtImm,
    wire     [DATA_W-1:0]  WriteBack_Data,
    wire     [DATA_W-1:0]  Reg1, 
    wire     [DATA_W-1:0]  Reg2,
    wire     [DATA_W-1:0]  SrcB,
    wire     [DATA_W-1:0]  DataMem_read
 );


// Write your code here
//FlipFlop with adder instantiation
FlipFlop ff(.clk(clk), .reset(reset), .d(PCPlus4), .q(PC));
assign PCPlus4 = PC + 3'd4;

//Instruction Memory instantiation
Instmem instmem(.addr(PC), .instruction(Instruction));
assign opcode = Instruction[6:0];
assign funct3 = Instruction[14:12];
assign funct7 = Instruction[31:25];

//RegFile instantiation
RegFile regfile(
    .clk            (clk), 
    .reset          (reset), 
    .rg_wrt_en      (reg_write), 
    .rg_wrt_addr    (Instruction[11:7]), 
    .rg_rd_addr1    (Instruction[19:15]), 
    .rg_rd_addr2    (Instruction[24:20]), 
    .rg_wrt_data    (WriteBack_Data), 
    .rg_rd_data1    (Reg1), 
    .rg_rd_data2    (Reg2)
);

//Immediate Generate instantiation
ImmGen immgen(.InstCode(Instruction), .ImmOut(ExtImm));

//ALU instantiation
alu_32 alu(
    .A_in       (Reg1),
    .B_in       (SrcB), 
    .ALU_Sel    (alu_cc), 
    .ALU_Out    (alu_result), 
    .Carry_Out  (Carry_Out), 
    .Zero       (Zero), 
    .Overflow   (Overflow)
);

//MUX instantiations
mux21 alumux(.S(alu_src), .D1(Reg2), .D2(ExtImm), .Y(SrcB));
mux21 datamux(.S(mem2reg), .D2(DataMem_read), .D1(alu_result), .Y(WriteBack_Data));

//Data memory instantiation
DataMem datamem(
    .MemRead    (mem_read), 
    .MemWrite   (mem_write), 
    .addr       (alu_result[DM_ADDRESS-1:0]), 
    .write_data (Reg2), 
    .read_data  (DataMem_read)
);


endmodule
