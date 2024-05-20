onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /stream_downsizer_tb/clk
add wave -noupdate /stream_downsizer_tb/rst_n
add wave -noupdate /stream_downsizer_tb/s_last_i
add wave -noupdate /stream_downsizer_tb/s_valid_i
add wave -noupdate /stream_downsizer_tb/s_ready_o
add wave -noupdate -radix hexadecimal /stream_downsizer_tb/m_data_o
add wave -noupdate /stream_downsizer_tb/m_last_o
add wave -noupdate /stream_downsizer_tb/m_valid_o
add wave -noupdate /stream_downsizer_tb/m_ready_i
add wave -noupdate -radix hexadecimal /stream_downsizer_tb/data_1
add wave -noupdate -radix hexadecimal /stream_downsizer_tb/data_2
add wave -noupdate -radix hexadecimal /stream_downsizer_tb/data_3
add wave -noupdate -radix hexadecimal /stream_downsizer_tb/data_4
add wave -noupdate -radix hexadecimal /stream_downsizer_tb/data_5
add wave -noupdate -radix hexadecimal /stream_downsizer_tb/data_6
add wave -noupdate -radix hexadecimal /stream_downsizer_tb/data_7
add wave -noupdate -radix hexadecimal /stream_downsizer_tb/data_8
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/clk
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/rst_n
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/s_last_i
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/s_valid_i
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/s_ready_o
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/m_data_o
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/m_last_o
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/m_valid_o
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/m_ready_i
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/full_bank
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/pointer
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/write
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/read
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/end_pointer
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/data_reg
add wave -noupdate /stream_downsizer_tb/uut_stream_downsize/last_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {93287 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 346
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {960052 ps}
