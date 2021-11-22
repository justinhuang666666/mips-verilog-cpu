import codes::*;

module regfile (
    input logic clk,
    input logic reset_i,
    input regaddr_t addr_1_i,
    input regaddr_t addr_2_i,
    input regaddr_t addr_3_i,
    input size_t write_data_3_i,
    input logic write_enable_i,
    output size_t read_data_1_o,
    output size_t read_data_2_o
);

  size_t regs[4:0];

  always_ff @(posedge clk) begin
    if (reset_i == 1) begin
      for (integer idx = 0; idx < 32; idx = idx + 1) begin
        regs[idx] <= 0;
      end
    end else if (write_enable_i == 1) begin
      if (addr_3_i != 0) begin
        regs[addr_3_i] <= write_data_3_i;
      end
    end
  end

  always_comb begin
    read_data_1_o = regs[addr_1_i];
    read_data_2_o = regs[addr_2_i];
  end

endmodule