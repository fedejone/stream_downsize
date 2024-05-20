action = "simulation"
sim_tool = "modelsim"
sim_top = "stream_downsizer_tb"

sim_post_cmd = "vsim -voptargs=+acc -do wave.do -i stream_downsizer_tb"

modules = {
  "local" : [ "../../../tb/stream_downsizer_tb" ],
}
