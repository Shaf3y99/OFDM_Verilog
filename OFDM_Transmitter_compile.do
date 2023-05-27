vmap -c
vlib work
cd whdlOFDMTx
do whdlOFDMTx_compile.do
cd ..
vmap work_whdlOFDMTx whdlOFDMTx/work
vlog  OFDM_Transmitter_tc.v
vlog  OFDM_Transmitter.v
