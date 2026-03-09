with System; use System;

package EFD is

    type Signal is (RED, GREEN, YELLOW, WHITE, GREEN_YELLOW, RED_WHITE, GREEN_WHITE);
    type Rail is (OCCUPIED, FREE);
    type Switch is (STRAIGHT, REVERS);

    type Array_Signals is array(1..10) of Signal;
    type Array_Switchs is array(1..2)  of Switch;
    type Array_Rails   is array(1..8)  of Rail;
    
    protected Station is
    pragma Priority(System.Priority'First + 5);
        procedure move_switch_position(index: in Integer);
        procedure set_signal_states(states: Array_Signals);
        procedure set_rail_states(states: Array_Rails);
        function get_switch_states return Switchs;
        function get_rail_states return Rails;
        function get_signal_states return Signals;
        procedure set_route(route:String);
        procedure make_route;
	procedure remove_route(route);
    private 
        signals: Array_Signals;
        rails: Array_Rails;
        switchs: Array_Switchs;
        routes: array (Integer <>) of String;
    end Station;
    
    protected Protections is
    pragma Priority(System.Priority'First + 5);
        procedure check_scape_material(cve2:in Integer, cve_2:in Integuer);
        function get_scape_material return Boolean;
    private
        scape_material: Boolean;
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
