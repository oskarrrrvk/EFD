with System; use System;

package EFD is

    type Signals is array(1..10) of Integers;
    type Switchs is array(1..2)  of Integers;
    type Rails   is array(1..8)  of Integers;
    protected Station is
    pragma Priority(System.Priority'First + 5);
    procedure set_route(route:String);
    procedure move_switch_position(index: in Integer);
    procedure set_signal_states(states: Signals);
    procedure set_rail_states(states: Rails);
    function get_switch_states return Switchs;
    function get_rail_states return Rails;
    function get_signal_states return Signals;
    procedure make_route;
    private 
    signals: Signals;
    rails: Rails;
    switchs: Switchs;
    route: String;
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
