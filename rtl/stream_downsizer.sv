
module stream_downsize #(
  parameter T_DATA_WIDTH = 8,
  parameter T_DATA_RATIO = 2
) (
  input  logic                    clk                          ,
  input  logic                    rst_n                        , 
  /*------------------------------------------------------------------------------
  --  slave interface
  ------------------------------------------------------------------------------*/
  input  logic [T_DATA_WIDTH-1:0] s_data_i   [T_DATA_RATIO-1:0],
  input  logic                    s_last_i                     ,
  input  logic                    s_valid_i                    ,
  output logic                    s_ready_o                    ,
  /*------------------------------------------------------------------------------
  --  master interface
  ------------------------------------------------------------------------------*/
  output logic [T_DATA_WIDTH-1:0] m_data_o                     ,
  output logic                    m_last_o                     ,
  output logic                    m_valid_o                    ,
  input  logic                    m_ready_i
);

  logic                                 full_bank  ;
  logic [             T_DATA_RATIO-1:0] pointer    ;
  logic                                 write      ;
  logic                                 read       ;
  logic                                 end_pointer;
  logic [T_DATA_WIDTH*T_DATA_RATIO-1:0] data_reg   ;
  logic                                 last_reg   ;

  assign write       = s_valid_i & s_ready_o;
  assign read        = m_valid_o & m_ready_i;
  assign end_pointer = (pointer == T_DATA_RATIO-1) & read;

  assign m_valid_o = full_bank;
  assign m_data_o  = data_reg[pointer*T_DATA_WIDTH+:T_DATA_WIDTH];
  assign m_last_o  = write & last_reg;
  assign s_ready_o = (((pointer == 0) & !full_bank) | (end_pointer));

/**********************Pointer logic*****************************/
  always_ff @(posedge clk or negedge rst_n) begin : proc_pointer
    if( ~rst_n ) begin
      pointer <= 1'b0;
    end else if ( read ) begin
      if ( end_pointer  ) pointer <= '0;
      else                pointer <= pointer + 1'b1;
    end
  end

/**********************Flag full size*****************************/
  always_ff @(posedge clk or negedge rst_n) begin : proc_full_bank
    if(~rst_n) begin
      full_bank <= 1'b0;
    end else begin
      if (write & !read)                    full_bank <= 1'b1;
      else if (!write & read & end_pointer) full_bank <= 1'b0;
    end
  end

/**********************Parallel2Serial data***********************/
  always_ff @(posedge clk or negedge rst_n) begin : proc_m_data_o
    if( ~rst_n ) begin
      data_reg <= '0;
    end else if (write) begin
      for (int i=0; i<=T_DATA_RATIO-1; i++) begin
        data_reg[i*T_DATA_WIDTH+:T_DATA_WIDTH] <= s_data_i[i];
      end
    end
  end

/**********************last_reg logic*****************************/
  always_ff @(posedge clk or negedge rst_n) begin : proc_last_reg
    if(~rst_n) begin
      last_reg <= 0;
    end else if (write) begin
      last_reg <= s_last_i;
    end
  end

endmodule 
