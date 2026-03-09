with System; use System;
with Ada.Real_Time use Ada.Real_Time;

package body EFD is

    ------------------
    ------IDLE--------
    ------------------
   
    procedure idle is
    begin
        loop
	    null;
	end loop;
    end idle;

    ---------------------------
    -----Protected Objects-----
    ---------------------------

    protected body Station is
        procedure move_switch_position(index: Integer, position: Switch) is
	begin
	    switchs(index) := position
	end move_switch_position;

        procedure set_signal_states(states:Array_Signals) is
	    i: Integer := 0;
	begin 
	    for i in 1..signals'Length loop
	        signals(i) := states(i);
	    end loop;
	end set_signal_states

        procedure set_rail_states(states:Array_Rails) is 
	    i: Integer := 0;
	begin 
	    for i in rails'Length loop
	        rails(i) := states(i);
	    end loop;
	end set_rail_states;


        function get_switch_states is 
	begin
	    return switchs;
	end get_switch_states;

        function get_rail_states is
	begin
            return rails;
	end get_rail_states;

	function get_signal_states is
	begin
	    return signals;
	end get_signal_states;

	procedure set_route(rt:String) is
            i: Integer := 0:
	    saved : Boolean := False;
	begin
	    while i < routes'Length AND saved = False loop
	        if routes(i) = '' then
		    routes(i) = rt;
		end if;
		i ++;
	    end loop;
	end set_route;
    end Station;

    protected Protections is
    begin

    end Protections; 
end EFD;


