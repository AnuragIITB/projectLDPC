library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library work;
use work.ahir_system_global_package.all;
library ModelsimLink;
use ModelsimLink.Utility_Package.all;
use ModelsimLink.Modelsim_FLI_Foreign.all;
entity ahir_system_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of ahir_system_Test_Bench is -- 
  component ahir_system is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      aPosteriori_out_pipe_read_data: out std_logic_vector(31 downto 0);
      aPosteriori_out_pipe_read_req : in std_logic_vector(0 downto 0);
      aPosteriori_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      code_block_in_pipe_write_data: in std_logic_vector(31 downto 0);
      code_block_in_pipe_write_req : in std_logic_vector(0 downto 0);
      code_block_in_pipe_write_ack : out std_logic_vector(0 downto 0);
      code_block_out_pipe_read_data: out std_logic_vector(31 downto 0);
      code_block_out_pipe_read_req : in std_logic_vector(0 downto 0);
      code_block_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      code_block_written_pipe_read_data: out std_logic_vector(7 downto 0);
      code_block_written_pipe_read_req : in std_logic_vector(0 downto 0);
      code_block_written_pipe_read_ack : out std_logic_vector(0 downto 0);
      ebbyNo_in_pipe_write_data: in std_logic_vector(31 downto 0);
      ebbyNo_in_pipe_write_req : in std_logic_vector(0 downto 0);
      ebbyNo_in_pipe_write_ack : out std_logic_vector(0 downto 0);
      initialize_aPriori1_pipe_read_data: out std_logic_vector(31 downto 0);
      initialize_aPriori1_pipe_read_req : in std_logic_vector(0 downto 0);
      initialize_aPriori1_pipe_read_ack : out std_logic_vector(0 downto 0);
      initialize_aPriori2_pipe_read_data: out std_logic_vector(31 downto 0);
      initialize_aPriori2_pipe_read_req : in std_logic_vector(0 downto 0);
      initialize_aPriori2_pipe_read_ack : out std_logic_vector(0 downto 0);
      inputs_written_pipe_read_data: out std_logic_vector(7 downto 0);
      inputs_written_pipe_read_req : in std_logic_vector(0 downto 0);
      inputs_written_pipe_read_ack : out std_logic_vector(0 downto 0);
      is_decoded_out_pipe_read_data: out std_logic_vector(7 downto 0);
      is_decoded_out_pipe_read_req : in std_logic_vector(0 downto 0);
      is_decoded_out_pipe_read_ack : out std_logic_vector(0 downto 0);
      matrix_in_pipe_write_data: in std_logic_vector(15 downto 0);
      matrix_in_pipe_write_req : in std_logic_vector(0 downto 0);
      matrix_in_pipe_write_ack : out std_logic_vector(0 downto 0);
      maxNitr_in_pipe_write_data: in std_logic_vector(15 downto 0);
      maxNitr_in_pipe_write_req : in std_logic_vector(0 downto 0);
      maxNitr_in_pipe_write_ack : out std_logic_vector(0 downto 0);
      rate_in_pipe_write_data: in std_logic_vector(31 downto 0);
      rate_in_pipe_write_req : in std_logic_vector(0 downto 0);
      rate_in_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal top_daemon_tag_in: std_logic_vector(1 downto 0);
  signal top_daemon_tag_out: std_logic_vector(1 downto 0);
  signal top_daemon_start_req : std_logic := '0';
  signal top_daemon_start_ack : std_logic := '0';
  signal top_daemon_fin_req   : std_logic := '0';
  signal top_daemon_fin_ack   : std_logic := '0';
  -- read from pipe aPosteriori_out
  signal aPosteriori_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal aPosteriori_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal aPosteriori_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- write to pipe code_block_in
  signal code_block_in_pipe_write_data: std_logic_vector(31 downto 0);
  signal code_block_in_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal code_block_in_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe code_block_out
  signal code_block_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal code_block_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal code_block_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe code_block_written
  signal code_block_written_pipe_read_data: std_logic_vector(7 downto 0);
  signal code_block_written_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal code_block_written_pipe_read_ack : std_logic_vector(0 downto 0);
  -- write to pipe ebbyNo_in
  signal ebbyNo_in_pipe_write_data: std_logic_vector(31 downto 0);
  signal ebbyNo_in_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal ebbyNo_in_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe initialize_aPriori1
  signal initialize_aPriori1_pipe_read_data: std_logic_vector(31 downto 0);
  signal initialize_aPriori1_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal initialize_aPriori1_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe initialize_aPriori2
  signal initialize_aPriori2_pipe_read_data: std_logic_vector(31 downto 0);
  signal initialize_aPriori2_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal initialize_aPriori2_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe inputs_written
  signal inputs_written_pipe_read_data: std_logic_vector(7 downto 0);
  signal inputs_written_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal inputs_written_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe is_decoded_out
  signal is_decoded_out_pipe_read_data: std_logic_vector(7 downto 0);
  signal is_decoded_out_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal is_decoded_out_pipe_read_ack : std_logic_vector(0 downto 0);
  -- write to pipe matrix_in
  signal matrix_in_pipe_write_data: std_logic_vector(15 downto 0);
  signal matrix_in_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal matrix_in_pipe_write_ack : std_logic_vector(0 downto 0);
  -- write to pipe maxNitr_in
  signal maxNitr_in_pipe_write_data: std_logic_vector(15 downto 0);
  signal maxNitr_in_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal maxNitr_in_pipe_write_ack : std_logic_vector(0 downto 0);
  -- write to pipe rate_in
  signal rate_in_pipe_write_data: std_logic_vector(31 downto 0);
  signal rate_in_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal rate_in_pipe_write_ack : std_logic_vector(0 downto 0);
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  process
  begin --
    Modelsim_FLI_Initialize;
    wait until clk = '1';
    reset <= '0';
    while true loop --
      wait until clk = '0';
      Modelsim_FLI_Listen;
      Modelsim_FLI_Send;
      --
    end loop;
    wait;
    --
  end process;
  -- connect all the top-level modules to Vhpi
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("aPosteriori_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      aPosteriori_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("aPosteriori_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(aPosteriori_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("aPosteriori_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(aPosteriori_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("code_block_in req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      code_block_in_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("code_block_in 0");
      Modelsim_FLI_Get_Port_Value(obj_ref,port_val_string,32);
      code_block_in_pipe_write_data <= Unpack_String(port_val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("code_block_in ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(code_block_in_pipe_write_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("code_block_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      code_block_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("code_block_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(code_block_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("code_block_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(code_block_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("code_block_written req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      code_block_written_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("code_block_written ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(code_block_written_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("code_block_written 0");
      port_val_string := Pack_SLV_To_Vhpi_String(code_block_written_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,8);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("ebbyNo_in req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      ebbyNo_in_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("ebbyNo_in 0");
      Modelsim_FLI_Get_Port_Value(obj_ref,port_val_string,32);
      ebbyNo_in_pipe_write_data <= Unpack_String(port_val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("ebbyNo_in ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(ebbyNo_in_pipe_write_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("initialize_aPriori1 req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      initialize_aPriori1_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("initialize_aPriori1 ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(initialize_aPriori1_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("initialize_aPriori1 0");
      port_val_string := Pack_SLV_To_Vhpi_String(initialize_aPriori1_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("initialize_aPriori2 req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      initialize_aPriori2_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("initialize_aPriori2 ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(initialize_aPriori2_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("initialize_aPriori2 0");
      port_val_string := Pack_SLV_To_Vhpi_String(initialize_aPriori2_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("inputs_written req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      inputs_written_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("inputs_written ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(inputs_written_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("inputs_written 0");
      port_val_string := Pack_SLV_To_Vhpi_String(inputs_written_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,8);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("is_decoded_out req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      is_decoded_out_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("is_decoded_out ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(is_decoded_out_pipe_read_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("is_decoded_out 0");
      port_val_string := Pack_SLV_To_Vhpi_String(is_decoded_out_pipe_read_data);
      Modelsim_FLI_Set_Port_Value(obj_ref,port_val_string,8);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("matrix_in req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      matrix_in_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("matrix_in 0");
      Modelsim_FLI_Get_Port_Value(obj_ref,port_val_string,16);
      matrix_in_pipe_write_data <= Unpack_String(port_val_string,16);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("matrix_in ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(matrix_in_pipe_write_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("maxNitr_in req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      maxNitr_in_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("maxNitr_in 0");
      Modelsim_FLI_Get_Port_Value(obj_ref,port_val_string,16);
      maxNitr_in_pipe_write_data <= Unpack_String(port_val_string,16);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("maxNitr_in ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(maxNitr_in_pipe_write_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("rate_in req");
      Modelsim_FLI_Get_Port_Value(obj_ref,req_val_string,1);
      rate_in_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("rate_in 0");
      Modelsim_FLI_Get_Port_Value(obj_ref,port_val_string,32);
      rate_in_pipe_write_data <= Unpack_String(port_val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("rate_in ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(rate_in_pipe_write_ack);
      Modelsim_FLI_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  ahir_system_instance: ahir_system -- 
    port map ( -- 
      clk => clk,
      reset => reset,
      aPosteriori_out_pipe_read_data  => aPosteriori_out_pipe_read_data, 
      aPosteriori_out_pipe_read_req  => aPosteriori_out_pipe_read_req, 
      aPosteriori_out_pipe_read_ack  => aPosteriori_out_pipe_read_ack ,
      code_block_in_pipe_write_data  => code_block_in_pipe_write_data, 
      code_block_in_pipe_write_req  => code_block_in_pipe_write_req, 
      code_block_in_pipe_write_ack  => code_block_in_pipe_write_ack,
      code_block_out_pipe_read_data  => code_block_out_pipe_read_data, 
      code_block_out_pipe_read_req  => code_block_out_pipe_read_req, 
      code_block_out_pipe_read_ack  => code_block_out_pipe_read_ack ,
      code_block_written_pipe_read_data  => code_block_written_pipe_read_data, 
      code_block_written_pipe_read_req  => code_block_written_pipe_read_req, 
      code_block_written_pipe_read_ack  => code_block_written_pipe_read_ack ,
      ebbyNo_in_pipe_write_data  => ebbyNo_in_pipe_write_data, 
      ebbyNo_in_pipe_write_req  => ebbyNo_in_pipe_write_req, 
      ebbyNo_in_pipe_write_ack  => ebbyNo_in_pipe_write_ack,
      initialize_aPriori1_pipe_read_data  => initialize_aPriori1_pipe_read_data, 
      initialize_aPriori1_pipe_read_req  => initialize_aPriori1_pipe_read_req, 
      initialize_aPriori1_pipe_read_ack  => initialize_aPriori1_pipe_read_ack ,
      initialize_aPriori2_pipe_read_data  => initialize_aPriori2_pipe_read_data, 
      initialize_aPriori2_pipe_read_req  => initialize_aPriori2_pipe_read_req, 
      initialize_aPriori2_pipe_read_ack  => initialize_aPriori2_pipe_read_ack ,
      inputs_written_pipe_read_data  => inputs_written_pipe_read_data, 
      inputs_written_pipe_read_req  => inputs_written_pipe_read_req, 
      inputs_written_pipe_read_ack  => inputs_written_pipe_read_ack ,
      is_decoded_out_pipe_read_data  => is_decoded_out_pipe_read_data, 
      is_decoded_out_pipe_read_req  => is_decoded_out_pipe_read_req, 
      is_decoded_out_pipe_read_ack  => is_decoded_out_pipe_read_ack ,
      matrix_in_pipe_write_data  => matrix_in_pipe_write_data, 
      matrix_in_pipe_write_req  => matrix_in_pipe_write_req, 
      matrix_in_pipe_write_ack  => matrix_in_pipe_write_ack,
      maxNitr_in_pipe_write_data  => maxNitr_in_pipe_write_data, 
      maxNitr_in_pipe_write_req  => maxNitr_in_pipe_write_req, 
      maxNitr_in_pipe_write_ack  => maxNitr_in_pipe_write_ack,
      rate_in_pipe_write_data  => rate_in_pipe_write_data, 
      rate_in_pipe_write_req  => rate_in_pipe_write_req, 
      rate_in_pipe_write_ack  => rate_in_pipe_write_ack); -- 
  -- 
end VhpiLink;
