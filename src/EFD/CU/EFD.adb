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
        
	function check_available_route(cvs: array(Integer <>) of Rail) return Boolean is
	    available: Boolean := True;
	begin
	    for i in 1..cvs'Length loop
	        if cvs(i) = OCCUPIED then
		    available = False;
		end if;
	    end loop;
	    return available;
	end check_available_route;
        
	procedure make_route is
	end make_route;
        procedure remove_route(route: String) is
            for i in 1..routes'Length loop
	        if routes(i) = route then
		    routes(i) = "":
		end if;
	    end loop;	    
	end remove_route;	
    end Station;

    protected Protections is
    begin

        procedure check_scape_material(desire_cvs:Array_Rails, real_cvs:Array_Rails, blockade: Integer) is
	begin 
            if desire_cvs'Length /= real_cvs'Length
	    then
	        return;
	    end if;
	    for i in 1..desire_cvs'Length loop
	        if desire_cvs(i) = FREE and real_cvs(i) = OCCUPIED
		then
		    scape_material(blockade) = True;
		else 
		    scape_material(blockade) = False;
		end if;
	    end loop;
	end check_scape_material;

        procedure check_switch_position(desire_pos:in Switch, real_pos:in Switch, switch_index:in Integer) is
	begin
	    if desire_pos /= real_pos then
		switch_error(switch_index) := True;
	    else 
		    switch_error(switch_index) := False;
	    end if;
	end check_switch_position;	

	function get_scape_material is
	begin
	    return scape_material;
	end get_scape_material;
	
	function get_switch_error is
	    return switch_error;
	end get_switch_error;
   
    end Protections; 
end EFD;


