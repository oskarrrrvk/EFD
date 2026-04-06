with Kernel.Serial_Output; use Kernel.Serial_Output;
with Ada.Real_Time; use Ada.Real_Time;
with System; use System;

package EFD is

   type Signal is (RED, GREEN, YELLOW, GREEN_YELLOW, RED_WHITE, GREEN_WHITE);
   type Rail is (OCCUPIED, FREE, ITINERARY, MANOUVER, EXCEED, PROTECT);
   type Switch is (STRAIGHT, REVERS, UNUSED);

   type Array_Signals is array(1..10) of Signal;
   type Array_Switchs is array(1..2)  of Switch;
   type Array_Rails   is array(1..8)  of Rail;
   type Array_Routes  is array(1..2)  of String;
   type Array_Scape_Material is array(1..2) of Boolean;
   type Array_switch_error is array(1..2) of Boolean;

   type Movement is record
      route_name: String(1..20);
	   cvs_states: Array_Rails;
	   Signals_states: Array_Signals;
      switchs_pos: Array_Switchs;
   end record;

   type Movement_List is array (Positive range <>) of Movement;

   protected Station is
   pragma Priority(System.Priority'First + 5);
      procedure move_switch_position(index: in Integer; position: in Switch);
      procedure set_signal_states(states: in Array_Signals);
      procedure set_rail_states(states: in Array_Rails);
      function get_switch_states return Array_Switchs;
      function get_rail_states return Array_Rails;
      function get_signal_states return Array_Signals;
      function get_switchs_movement (route:String) return Array_Switchs;
      function get_rails_movement (route: String) return Array_Rails;
      function get_signals_movement (route: String) return Array_Signals;
      procedure set_route(rt: in String; routes: in out Array_Routes );
      procedure set_marked_route(route: in String);
      procedure set_supervised_route(route: in String);
      function get_marked_routes return Array_Routes;
      function get_supervised_routes return Array_Routes;
      function check_available_route (route: String) return Boolean; 
      procedure make_route(route: in String);
      procedure remove_supervised_route(main_signal_name: in String);
      procedure remove_marked_route(main_signal_name: in String);
      procedure monitorise_movements;
      private 
         signals: Array_Signals:=(YELLOW,RED,RED,RED,RED,RED,RED,RED,RED,YELLOW);
         rails: Array_Rails:=(FREE,FREE,FREE,FREE,FREE,FREE,FREE,FREE);
         switchs: Array_Switchs:=(STRAIGHT,STRAIGHT);
         marked_routes: Array_Routes := ("","");
         supervised_routes: Array_Routes := ("","");
         movements: Movement_List := (
            ("I E1 S1/2", 
               (ITINERARY,ITINERARY,ITINERARY,ITINERARY,PROTECT,FREE,FREE,FREE),
               (YELLOW,YELLOW,GREEN,RED,RED,RED,RED,RED,RED,RED),
               (STRAIGHT,UNUSED)),
            ("I E1 S2/2",
               (ITINERARY,ITINERARY,ITINERARY,FREE,ITINERARY,PROTECT,FREE,FREE),
               (GREEN_YELLOW,YELLOW,GREEN_YELLOW,RED,RED,RED,RED,RED,RED,RED),
               (REVERS,UNUSED)),
            ("M E1 S1/2",
               (MANOUVER,MANOUVER,MANOUVER,MANOUVER,FREE,FREE,FREE,FREE),
               (YELLOW,RED_WHITE,GREEN,RED,RED,RED,RED,RED,RED,RED),
               (STRAIGHT,UNUSED)),
            ("M E1 S2/2",
               (MANOUVER,MANOUVER,MANOUVER,FREE,MANOUVER,FREE,FREE,FREE),
               (GREEN_YELLOW,RED_WHITE,GREEN_YELLOW,RED,RED,RED,RED,RED,RED,RED),
               (REVERS,UNUSED)),
            ("R E1 S1/2",
               (EXCEED,EXCEED,EXCEED,EXCEED,FREE,FREE,FREE,FREE),
               (YELLOW,GREEN_WHITE,GREEN,RED,RED,RED,RED,RED,RED,RED),
               (STRAIGHT,UNUSED)),
            ("R E1 S2/2",
               (EXCEED,EXCEED,EXCEED,FREE,EXCEED,FREE,FREE,FREE),
               (GREEN_YELLOW,GREEN_WHITE,GREEN_YELLOW,RED,RED,RED,RED,RED,RED,RED),
               (REVERS,UNUSED)),
            ("I E2 S1/1", 
               (FREE,FREE,PROTECT,ITINERARY,FREE,ITINERARY,ITINERARY,ITINERARY),
               (RED,RED,RED,RED,RED,RED,RED,GREEN,YELLOW,YELLOW),
               (UNUSED,STRAIGHT)),
            ("I E2 S2/1",
               (FREE,FREE,PROTECT,FREE,ITINERARY,ITINERARY,ITINERARY,ITINERARY),
               (RED,RED,RED,RED,RED,RED,RED,GREEN_YELLOW,YELLOW,GREEN_YELLOW),
               (UNUSED,REVERS)),
            ("M E2 S1/1",
               (FREE,FREE,FREE,FREE,MANOUVER,MANOUVER,MANOUVER,MANOUVER),
               (RED,RED,RED,RED,RED,RED,RED,GREEN,RED_WHITE,YELLOW),
               (UNUSED,STRAIGHT)),
            ("M E2 S2/1",
               (FREE,FREE,FREE,MANOUVER,FREE,MANOUVER,MANOUVER,MANOUVER),
               (RED,RED,RED,RED,RED,RED,RED,GREEN_YELLOW,RED_WHITE,GREEN_YELLOW),
               (UNUSED,REVERS)),
            ("R E2 S1/1",
               (FREE,FREE,FREE,EXCEED,FREE,EXCEED,EXCEED,EXCEED),
               (RED,RED,RED,RED,RED,RED,RED,GREEN,GREEN_WHITE,YELLOW),
               (UNUSED,STRAIGHT)),
            ("R E2 S2/1",
               (FREE,FREE,FREE,FREE,EXCEED,EXCEED,EXCEED,EXCEED),
               (RED,RED,RED,RED,RED,RED,RED,GREEN_YELLOW,GREEN_WHITE,GREEN_YELLOW),
               (UNUSED,REVERS)),
            ("I S1/2 B", 
               (FREE,FREE,FREE,ITINERARY,FREE,ITINERARY,ITINERARY,ITINERARY),
               (RED,RED,RED,RED,RED,GREEN,RED,RED,RED,RED),
               (UNUSED,STRAIGHT)),
            ("I S2/2 B",
               (FREE,FREE,FREE,FREE,ITINERARY,ITINERARY,ITINERARY,ITINERARY),
               (RED,RED,RED,RED,RED,RED,GREEN,RED,RED,RED),
               (UNUSED,REVERS)),
            ("M S1/2 B",
               (FREE,FREE,FREE,MANOUVER,FREE,MANOUVER,MANOUVER,MANOUVER),
               (RED,RED,RED,RED,RED,RED_WHITE,RED,RED,RED,RED),
               (UNUSED,STRAIGHT)),
            ("M S2/2 B",
               (FREE,FREE,FREE,FREE,MANOUVER,MANOUVER,MANOUVER,MANOUVER),
               (RED,RED,RED,RED,RED,RED,RED_WHITE,RED,RED,RED),
               (UNUSED,REVERS)),
            ("I S1/1 A", 
               (ITINERARY,ITINERARY,ITINERARY,ITINERARY,FREE,FREE,FREE,FREE),
               (RED,RED,RED,GREEN,RED,RED,RED,RED,RED,RED),
               (STRAIGHT,UNUSED)),
            ("I S2/1 A",
               (ITINERARY,ITINERARY,ITINERARY,FREE,ITINERARY,FREE,FREE,FREE),
               (RED,RED,RED,RED,GREEN,RED,RED,RED,RED,RED),
               (REVERS,UNUSED)),
            ("M S1/1 A",
               (FREE,MANOUVER,MANOUVER,MANOUVER,FREE,FREE,FREE,FREE),
               (RED,RED,RED,RED_WHITE,RED,RED,RED,RED,RED,RED),
               (STRAIGHT,UNUSED)),
            ("M S2/1 A",
               (FREE,MANOUVER,MANOUVER,FREE,MANOUVER,FREE,FREE,FREE),
               (RED,RED,RED,RED,RED_WHITE,RED,RED,RED,RED,RED),
               (REVERS,UNUSED)),
         );
    end Station;
    
   protected Protections is
   pragma Priority(System.Priority'First + 5);
      procedure check_scape_material(desire_cvs: Array_Rails; real_cvs: Array_Rails; blockade: Integer);
      procedure check_switch_position(desire_pos: in Switch; real_pos: in Switch; switch_index: Integer);
      function get_scape_material return Array_Scape_Material;
      function get_switch_error return Array_switch_error;
      private
         scape_material: Array_Scape_Material := (False,False);
         switch_error: Array_switch_error := (False,False);
   end Protections;
      
   procedure idle;
   
   function create_message() return String;

   task Route is
      -- pragma Priority(System.Priority'First + 1);
   end Route;

   task Risks is
      -- pragma Priority(System.Priority'First + 1);
   end Risks;

   task Dispatcher is 
      -- pragma Priority(System.Priority'First + 1);
   end Dispatcher;
end EFD;
