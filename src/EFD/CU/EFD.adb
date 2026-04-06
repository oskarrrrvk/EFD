with System; use System;
with Ada.Real_Time; use Ada.Real_Time;
with EFD.include.server_h;use EFD.include.server_h;

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
      procedure move_switch_position(index: in Integer; position: in Switch) is
      begin
         switchs(index) := position;
         set_position(index, position);
      end move_switch_position;

      procedure set_signal_states(states: in Array_Signals) is
         message: String := "";
      begin
         signals := states;
         for i in 1..signals'Length -1 loop
            message := message & Signal'Image(signals(i)) & ";";
         end loop;
         message := message & Signal'Image(signals(signals'Length));
         send_message(message);
      end set_signal_states;

      procedure set_rail_states(states: in Array_Rails) is
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

      procedure set_route(rt: in String; routes: in out Array_Routes ) is  
         i: Integer := 1;
         saved : Boolean := False;
      begin
         while i <= routes'Length and then not saved loop
            if routes(i) = "" then
               routes(i) := rt;
               saved := True;
            end if;
            i := i + 1;
         end loop;
      end set_route;

      procedure set_marked_route(rt: String) is
      begin
         set_route(rt,marked_routes);
      end set_marked_route;

      procedure set_supervised_route(rt: String) is
      begin
         set_route(rt,supervised_routes);
      end set_supervised_route;

      function get_marked_routes return Array_Routes is
      begin 
         return marked_routes;
      end get_marked_routes;

      function get_supervised_routes return Array_Routes is
      begin
         return supervised_routes;
      end get_supervised_routes;

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
               for j in 1..movements(i).cvs_states'Length loop
                  if movements(i).cvs_states(j) /= FREE then
                     rails_used(j) := movements(i).cvs_states(j);
                     end if;
               end loop;
               for j in 1..movements(i).Signals_states'Length loop
                  if movements(i).Signals_states(j) /= RED then
                     signals_used(j) := movements(i).Signals_states(j);
                  end if;
               end loop;
               for j in 1..movements(i).switchs_pos'Length loop
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

      procedure remove_supervised_route(main_signal_name: in String) is
         cvs_movement: Array_Rails;
         signals_movement: Array_Signals;
         switchs_movement: Array_Switchs;
      begin
         for i in 1..supervised_routes'Length loop
            if main_signal_name in supervised_routes(i) then
               cvs_movement := get_rails_movement(supervised_routes(i));
               signals_movement := get_signals_movement(supervised_routes(i));
               switchs_movement := get_switchs_movement(supervised_routes(i));
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
      end remove_supervised_route;

      procedure remove_marked_route(main_signal_name: in String) is
      begin
         for i in 1..marked_routes'Length loop
            if main_signal_name in marked_routes(i) then
               marked_routes(i) := "";
            end if;
         end loop;
      end remove_marked_route;

      procedure monitorise_movements is
         real_rails: Array_Rails;
      begin
         -- read rails
         for i in 1..real_rails'Length loop
            if real_rails(i) = OCCUPIED then
               rails(i) := OCCUPIED;
            elsif real_rails(i) = FREE and rails(i) = OCCUPIED then
               rails(i) := PROTECT;
            end if;
         end loop;
      end monitorise_movements; 
   end Station;

   protected body Protections is
      procedure check_scape_material(desire_cvs: in Array_Rails; real_cvs: in Array_Rails; scape_material_index: in Integer) is
         count: Integer := 0;
      begin
         for i in 1..2 loop
            if desire_cvs(i) = FREE and real_cvs(i) = OCCUPIED then
               scape_material(scape_material_index) := True;
            else
               count := count + 1;
            end if;
         end loop;
         if count = 2 then
            scape_material(scape_material_index) := False;
         end if;
      end check_scape_material;

      procedure check_switch_position(desire_pos:in Switch, real_pos:in Switch, switch_index:in Integer) is
	   begin
	      if desire_pos /= real_pos then
		      switch_error(switch_index) := True;
	      else 
		      switch_error(switch_index) := False;
	      end if;
	   end check_switch_position;	

      function get_scape_material return Array_Scape_Material is
      begin
         return scape_material;
      end get_scape_material;

      function get_switch_error return Array_switch_error is
      begin
         return switch_error;
      end get_switch_error;
   end Protections; 

   -----------------------------------
   -- EXTRA FUNCTIONS AND PROCEDURES--
   -----------------------------------

   function create_message return String is
      station_rails: Array_Rails := Station.get_rail_states;
      station_signals: Array_Signals := Station.get_signal_states;
      station_switchs: Array_Switchs := Station.get_switch_states;
      rails_name: array(1..Array_Rails'Length) of String := ("CVE'1","CVE1","CVA1","CV1","CV2","CVA2","CVE2","CVE'2",others => "");
      signals_name: array(1..Array_Signals'Length) of String := ("E'1","E1","R1","S1/1","S2/1","S1/2","S2/2","R2","E2","E'2",others => "");
      switchs_name: array(1..Array_Switchs'Length) of String := ("1","2",others => "");
      message: String := "";

   begin 
      for i in 1..station_rails'Length loop
         if rails_name(i) = "CVA1" or rails_name(i) = "CVA2" then
            message := message & rails_name(i) & ":" &"[" & Switch'Image(station_switchs(i)) & "," & Rail'Image(station_rails(i)) & "];";
         else 
            message := message & rails_name(i) & ":" & Rail'Image(station_rails(i)) & ";";

         end if;
      end loop;
      for i in 1..station_signals'Length - 1 loop
         if (signals_name(i) = "R1" or signals_name(i) = "R2") and station_signals(i) = GREEN then
            message := message & signals_name(i) & ":" & "WHITE;";
         else
            message := message & signals_name(i) & ":" & Signal'Image(station_signals(i)) & ";";
         end if;
      end loop;
      message := message & signals_name(station_signals'Length) & ":" & Signal'Image(station_signals(station_signals'Length));
      return message;   
   end create_message;

   -------------------------
   ----------TASKS----------
   -------------------------

   task body Route is
      next_delay: Time;
      m_routes: Array_Routes;
   begin  
      config_switch_gpios;
      loop
         next_delay := Clock + Milliseconds(500);
         m_routes := get_marked_routes;
         for i in 1..m_routes'Length loop
            if m_routes(i) /="" then
               make_route(m_routes(i));
               remove_marked_route(m_routes(i));
            end if; 
         end loop;
         monitorise_movements;
         delay until next_delay;
      end loop;
      terminate_gpio_connection;

   end Route;

   task body Risks is
      next_delay: Time;
   begin
      loop
         next_delay := Clock + Milliseconds(300);
         Protections.check_scape_material(desire_cvs, real_cvs, 1);
         Protections.check_switch_position(desire_pos, real_pos, 1);
         delay until next_delay;
      end loop;
   end Risks;

   task body Dispatcher is
      next_delay: Time;
      message : String := "";
      command: String :="";
      switch_need: Array_Switchs;
      switch_errors: Array_switch_error;
      error: Boolean;
      sd: Integer;
   begin
      sd := server_h.config_server("", 50345);
      server_h.accept_connection(sd);
      loop
         next_delay := Clock + Milliseconds(1000);
         server_h.receive_message(command, sd);
         switch_need := Station.get_switchs_movement(command);
         switch_errors := Protections.get_switch_error;
         for i in switch_need'Range loop
            if switch_need(i) /= UNUSED and switch_errors(i) = True then
               error := True;
            end if;
         end loop;
         if Station.check_available_route(command) and error = False then
            Station.set_marked_route(command);
         end if;
         message := create_message;
         server_h.send_message(message, sd);
         error := False;
         delay until next_delay;
      end loop;
      server_h.close_connection(sd);
   end Dispatcher;

end EFD;

--  char* E1S12 ="CVE'1:yellow;CVE1:green;1:[Normal,green];CV1:green;CV2:yellow;2:[Reverse,yellow];CVE2:yellow;CVE'2:yellow;E'1:[yellow,yellow];E1:[green,green];R1:[white,white];S1/1:[red,red];S2/1:[red,red];S1/2:[red,red];S2/2:[red,red];E2:[red,red];E'2:[red,red]";

