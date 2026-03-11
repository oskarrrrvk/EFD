with System; use System;

package EFD is

    type Signal is (RED, GREEN, YELLOW, WHITE, GREEN_YELLOW, RED_WHITE, GREEN_WHITE);
    type Rail is (OCCUPIED, FREE, ITINERARY, MANOUVER, EXCEED, PROTECT);
    type Switch is (STRAIGHT, REVERS);

    type Array_Signals is array(1..10) of Signal;
    type Array_Switchs is array(1..2)  of Switch;
    type Array_Rails   is array(1..8)  of Rail;
    
    protected Station is
    pragma Priority(System.Priority'First + 5);
        procedure move_switch_position(index: in Integer);
        procedure set_signal_states(states: Array_Signals);
        procedure set_rail_states(states: Array_Rails);
        function get_switch_states return Array_switchs;
        function get_rail_states return Array_rails;
        function get_signal_states return Array_signals;
        procedure set_route(route:String);
	function check_available_route return Boolean;
        procedure make_route(cvs: out array(Integer <>) of Rail);
	procedure remove_route(route);
    private 
        signals: Array_Signals;
        rails: Array_Rails;
        switchs: Array_Switchs;
        routes: array (1..2) of String;
    end Station;
    
    protected Protections is
    pragma Priority(System.Priority'First + 5);
        procedure check_scape_material(desire_cvs:Array_Rail, real_cvs:Array_Rail, blockade: Integer);
	procedure check_switch_position(desire_pos: in Switch, real_pos: in Switch, switch_index: Integer);
	function get_scape_material return array(1..2) of Boolean;
	function get_switch_error return array(1..Array_switchs'Length) of Boolean;
    private
        scape_material: array(1..2) of Boolean;
	switch_error:array(1..Array_switchs'Length) of Boolean;
    end Protections;
      
    procedure idle;
   
    task Route is
    end Route;

    task Risks is
    end Risks;

    task Dispatcher is 
        -- pragma Priority(System.Priority'First + 1);
    end Dispatcher;
end EFD;
