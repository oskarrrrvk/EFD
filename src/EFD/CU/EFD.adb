with System; use System;
with Ada.Real_Time; use Ada.Real_Time;

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
      procedure move_switch_position(index: Integer; position: Switch) is
      begin
         switchs(index) := position;
      end move_switch_position;

      procedure set_signal_states(states: Array_Signals) is
      begin
         signals := states;
      end set_signal_states;

      procedure set_rail_states(states: Array_Rails) is
      begin
         rails := states;
      end set_rail_states;

      function get_switch_states return Array_Switchs is
      begin
         return switchs;
      end get_switch_states;

      function get_rail_states return Array_Rails is
      begin
         return rails;
      end get_rail_states;

      function get_signal_states return Array_Signals is
      begin
         return signals;
      end get_signal_states;

      function get_switchs_movement (route:String) return Array_Switchs is
         movement_switchs: Array_Switchs;
      begin
         for i in 1..movements'Length loop 
            if movements(i).route_name = route then
               movement_switchs := movements(i).switchs;
            end if;
         end loop;
         return movement_switchs;
      end get_switchs_movement;

      function get_rails_movement (route: String) return Array_Rails is
         movement_rails: Array_Rails;
      begin
         for i in 1..movements'Length loop 
            if movements(i).route_name = route then
               movement_rails := movements(i).rails;
            end if;
         end loop;
         return movement_rails;
      end get_rails_movement;

      function get_signals_movement (route: String) return Array_Signals is
         movement_signals: Array_Signals;
      begin
         for i in 1..movements'Length loop 
            if movements(i).route_name = route then
               movement_signals := movements(i).signals;
            end if;
         end loop;
         return movement_signals;
      end get_signals_movement;

      procedure set_marked_route(rt: String) is
         i: Integer := 1;
         saved : Boolean := False;
      begin
         while i <= marked_routes'Length and then not saved loop
            if marked_routes(i) = "" then
               marked_routes(i) := rt;
               saved := True;
            end if;
            i := i + 1;
         end loop;
      end set_marked_route;

      procedure set_supervised_route(rt: String) is
         i: Integer := 1;
         saved : Boolean := False;
      begin
         while i <= marked_routes'Length and then not saved loop
            if supervised_routes(i) = "" then
               supervised_routes(i) := rt;
               saved := True;
            end if;
            i := i + 1;
         end loop;
      end set_supervised_route;

      function check_available_route (route: String) return Boolean is
         i: Integer;
         available: Boolean := True;
         movement_route: Array_Rails;
      begin
         movement_route := get_rails_movement(route);
         for i in 1..rails'Length loop
            if rails(i) = OCCUPIED and movement_route(i) /= FREE then
               available := False;
            end if;
         end loop;
         return available;
      end check_available_route;
        
      procedure make_route(route: String) is
      rails_used: Array_Rails := rails;
      signals_used: Array_Signals := signals;
      begin
         for i in 1..movements'Length loop
            if movements(i).route_name = route then
               for j in 1..rails_used'Length loop
                  if movements(i).cvs_states(j) /= FREE then
                     rails_used(j) := movements(i).cvs_states(j);
                     end if;
               end loop;
               for j in 1..signals_used'Length loop
                  if movements(i).Signals_states(j) /= RED then
                     signals_used(j) := movements(i).Signals_states(j);
                  end if;
               end loop;
               for j in 1..switchs_used'Length loop
                  if movements(i).switchs_pos(j) /= UNUSED then
                     move_switch_position (j,  movements(i).switchs_pos(j));
                  end if;
               end loop;
            end if;
         end loop;
         set_rail_states (rails_used);
         set_signal_states (signals_used);
         set_supervised_route (route);
      end make_route;

      procedure remove_route(main_signal_name: String) is
      cvs_movement: Array_Rails;
      signals_movement: Array_Signals;
      switchs_movement: Array_Switchs;
      begin
         for i in 1..supervised_routes'Length loop
            if main_signal_name in supervised_routes(i) then
               cvs := get_rails_movement(supervised_routes(i));
               signals := get_signals_movement(supervised_routes(i));
               switchs := get_switchs_movement(supervised_routes(i));
               supervised_routes(i) := "";
            end if;
         end loop;
         for i in 1..rails'Length loop
            if cvs_movement(i) /= FREE then
               rails(i) := FREE;
            end if;
         end loop;
         for i in 2..signals'Length - 1 loop
            if signals_movement(i) /= RED then
               signals(i) := RED;
            end if;
         end loop;
         for i in 1..switchs'Length loop
            if switchs_movement(i) = switchs(i) then
               switchs(i) := STRAIGHT;
            end if;
            switchs(i) := STRAIGHT;
         end loop;
      end remove_route;

      procedure monitorise_movements is
         movement_tracks: Array_Rails;
         movement_signals: Array_Signals;
      begin
         null;
      end monitorise_movements; 
   end Station;

   protected body Protections is
   begin

      procedure check_scape_material(desire_cvs: Array_Rails; real_cvs: Array_Rails) is
         i: Integer;
      begin
         if desire_cvs'Length /= real_cvs'Length then
            return;
         end if;
         for i in 1..scape_material'Length loop
            for j in 1..desire_cvs'Length loop
               if desire_cvs(j) = FREE and then real_cvs(j) = OCCUPIED then
                  scape_material(i) := True;
               else
                  scape_material(i) := False;
               end if;
            end loop;
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

      function get_scape_material return array(1..2) of Boolean is
      begin
         return scape_material;
      end get_scape_material;

      function get_switch_error return array(1..Array_Switchs'Length) of Boolean is
      begin
         return switch_error;
      end get_switch_error;
   
   end Protections; 


   --  task body Route is 
   --  end Route;

   task body Risks is
      next_delay: Time;
      real_rail_position: Array_Rails;
      desired_rail_position: Array_Rails;
      real_switch_position: Array_Switchs; 
      desired_switch_position: Array_Switchs; 
   begin
      loop
         next_delay := Clock + milliseconds(300)
         check_scape_material();
         check_switch_position();
         delay until next_delay;
      end loop;
   end Risks;

   task body Dispatcher is
      next_delay: Time 
      message : String := "";
      command: String :="";
      switch_need: Array_Switchs;
      switch_errors: Array_Switchs;
      error: Boolean;
   begin
      config_server;
      loop
         next_delay := Clock + milliseconds(1000);
         receive_messeage(command);
         switch_need := Station.get_switchs_movement(command)
         switch_errors := Protections.get_switch_error;
         for i in 1.. switch_need loop:
            if switch_need(i) /= UNUSED and switch_errors(i) = True then
               error = True;
            end if;
         end loop;
         if Station.check_available_route(command) and error = False then
            Station.set_set_marked_route(command);
         end if;
         error = False;
         send_message(message);
         delay until next_delay;
      end loop;
      close_connection
   end Dispatcher;
end EFD;

--  char* E1S12 ="CVE'1:yellow;CVE1:green;1:[Normal,green];CV1:green;CV2:yellow;2:[Reverse,yellow];CVE2:yellow;CVE'2:yellow;E'1:[yellow,yellow];E1:[green,green];R1:[white,white];S1/1:[red,red];S2/1:[red,red];S1/2:[red,red];S2/2:[red,red];E2:[red,red];E'2:[red,red]";

