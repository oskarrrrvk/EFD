with System; use System;

package EFD is

    type Signal is (RED, GREEN, YELLOW, GREEN_YELLOW, RED_WHITE, GREEN_WHITE);
    type Rail is (OCCUPIED, FREE, ITINERARY, MANOUVER, EXCEED, PROTECT);
    type Switch is (STRAIGHT, REVERS);

    type Array_Signals is array(1..10) of Signal;
    type Array_Switchs is array(1..2)  of Switch;
    type Array_Rails   is array(1..8)  of Rail;
   
    type Movement is record
        route_name: String;
	cvs_states: Array_Rails;
	Signals_states: Array_Signals:
    end record;

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
        procedure make_route();
	procedure remove_route(route);
    private 
        signals: Array_Signals:=(YELLOW,RED,RED,RED,RED,RED,RED,RED,RED,YELLOW);
	rails: Array_Rails:=(FREE,FREE,FREE,FREE,FREE,FREE,FREE,FREE);
	switchs: Array_Switchs:=(STRAIGHT,STRAIGHT);
	routes: array (1..2) of String:=("","");
	movements: array ( Integer <>) of Movement :=(
	    ("I E1 S1/2", 
	        (ITINERARY,ITINERARY,ITINERARY,ITINERARY,FREE,FREE,FREE,FREE),
		(YELLOW,YELLOW,GREEN,RED,RED,RED,RED,RED,RED,RED)),
	    ("I E1 S2/2",
		(ITINERARY,ITINERARY,ITINERARY,FREE,ITINERARY,FREE,FREE,FREE),
		(YELLOW,YELLOW,GREEN_YELLOW,RED,RED,RED,RED,RED,RED,RED)),
	    ("M E1 S1/2",
	    	(MANOUVER,MANOUVER,MANOUVER,MANOUVER,FREE,FREE,FREE,FREE),
	    	(YELLOW,RED_WHITE,GREEN,RED,RED,RED,RED,RED,RED,RED)),
	    ("M E1 S2/2",
		(MANOUVER,MANOUVER,MANOUVER,FREE,MANOUVER,FREE,FREE,FREE),
	        (YELLOW,RED_WHITE,GREEN_YELLOW,RED,RED,RED,RED,RED,RED,RED)),
	    ("R E1 S1/2",
	        (EXCEED,EXCEED,EXCEED,EXCEED,FREE,FREE,FREE,FREE),
		(YELLOW,RED_WHITE,GREEN,RED,RED,RED,RED,RED,RED,RED)),
	    ("R E1 S2/2",
		(EXCEED,EXCEED,EXCEED,RED,EXCEED,FREE,FREE,FREE),
	        (YELLOW,RED_WHITE,GREEN_YELLOW,RED,RED,RED,RED,RED,RED,RED)),
		);
    end Station;
    
    protected Protections is
    pragma Priority(System.Priority'First + 5);
        procedure check_scape_material(desire_cvs:Array_Rail, real_cvs:Array_Rail, blockade: Integer);
	procedure check_switch_position(desire_pos: in Switch, real_pos: in Switch, switch_index: Integer);
	function get_scape_material return array(1..2) of Boolean;
	function get_switch_error return array(1..Array_switchs'Length) of Boolean;
    private
        scape_material: array(1..2) of Boolean:=(False,False);
	switch_error:array(1..Array_switchs'Length) of Boolean:=(False,False);
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
