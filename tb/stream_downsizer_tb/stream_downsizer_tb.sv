`timescale 1ns/1ps
parameter T_DATA_WIDTH = 8;
parameter T_DATA_RATIO = 4;

module stream_downsizer_tb ();
  logic                    clk                        ;
  logic                    rst_n                      ;
  logic [T_DATA_WIDTH-1:0] s_data_i [T_DATA_RATIO-1:0];
  logic                    s_last_i                   ;
  logic                    s_valid_i                  ;
  logic                    s_ready_o                  ;
  logic [T_DATA_WIDTH-1:0] m_data_o                   ;
  logic                    m_last_o                   ;
  logic                    m_valid_o                  ;
  logic                    m_ready_i                  ;


  stream_downsize #(
    .T_DATA_WIDTH(T_DATA_WIDTH),
    .T_DATA_RATIO(T_DATA_RATIO)
  ) uut_stream_downsize (
    .clk      (clk      ),
    .rst_n    (rst_n    ),
    .s_data_i (s_data_i ),
    .s_last_i (s_last_i ),
    .s_valid_i(s_valid_i),
    .s_ready_o(s_ready_o),
    .m_data_o (m_data_o ),
    .m_last_o (m_last_o ),
    .m_valid_o(m_valid_o),
    .m_ready_i(m_ready_i)
  );

  task wait_clk(int i);
    repeat (i) @(posedge clk);
  endtask : wait_clk

  initial begin
    clk = 0;
    rst_n = 1;
    s_last_i = '0;
    forever #2 clk = ~clk ;
  end

  initial begin
    wait_clk(10);
    rst_n = 0;
    wait_clk(10);
    m_ready_i <= '1;
    rst_n = 1;
    wait_clk(1);
  end

  initial begin
    wait(~rst_n);
    for (int i= 0; i <= T_DATA_RATIO-1; i++) begin
      s_data_i[i] <= '0;
    end
    s_valid_i <= '0;
    s_last_i <= '0;
    wait(rst_n);
    repeat(200) begin
      @(posedge clk);
      s_valid_i = '1;
      if (s_ready_o !== 0) begin
        for (int i= 0; i <= T_DATA_RATIO-1; i++) begin
          s_data_i[i] <= $urandom();
        end
        s_valid_i <= ($urandom_range(100,0) < 80) ? 1 : 0;
        s_last_i <= ($urandom_range(100,0) < 90) ? 1 : 0;
      end
      m_ready_i <=($urandom_range(100,0) < 10) ? 1 : 0;
    end
    $stop();
    m_ready_i = 1;
  end

  logic [T_DATA_WIDTH-1:0] data_1;
  logic [T_DATA_WIDTH-1:0] data_2;
  logic [T_DATA_WIDTH-1:0] data_3;
  logic [T_DATA_WIDTH-1:0] data_4;
  logic [T_DATA_WIDTH-1:0] data_5;
  logic [T_DATA_WIDTH-1:0] data_6;
  logic [T_DATA_WIDTH-1:0] data_7;
  logic [T_DATA_WIDTH-1:0] data_8;
  assign data_1 = s_data_i[0];
  assign data_2 = s_data_i[1];
  assign data_3 = s_data_i[2];
  assign data_4 = s_data_i[3];
  assign data_5 = s_data_i[4];
  assign data_6 = s_data_i[5];
  assign data_7 = s_data_i[6];
  assign data_8 = s_data_i[7];

endmodule
