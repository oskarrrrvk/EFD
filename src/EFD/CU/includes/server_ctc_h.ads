pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with netinet_in_h;
with Interfaces.C.Strings;

package server_CTC_h is

   MAXLINE : constant := 1024;  --  ./Communication/server_CTC.h:13

   server_ip : aliased Interfaces.C.char_array (0 .. 15)  -- ./Communication/server_CTC.h:15
   with Import => True, 
        Convention => C, 
        External_Name => "server_ip";

   server_port : aliased int  -- ./Communication/server_CTC.h:16
   with Import => True, 
        Convention => C, 
        External_Name => "server_port";

   server_socket : aliased int  -- ./Communication/server_CTC.h:16
   with Import => True, 
        Convention => C, 
        External_Name => "server_socket";

   listener_socket : aliased int  -- ./Communication/server_CTC.h:16
   with Import => True, 
        Convention => C, 
        External_Name => "listener_socket";

   server_addr : aliased netinet_in_h.sockaddr_in  -- ./Communication/server_CTC.h:18
   with Import => True, 
        Convention => C, 
        External_Name => "server_addr";

   procedure execute_CTC (config_filename : Interfaces.C.Strings.chars_ptr)  -- ./Communication/server_CTC.h:20
   with Import => True, 
        Convention => C, 
        External_Name => "execute_CTC";

   procedure read_config_file (filename : Interfaces.C.Strings.chars_ptr; server_info : Interfaces.C.Strings.chars_ptr)  -- ./Communication/server_CTC.h:22
   with Import => True, 
        Convention => C, 
        External_Name => "read_config_file";

   procedure split_server_info (server_info : Interfaces.C.Strings.chars_ptr)  -- ./Communication/server_CTC.h:23
   with Import => True, 
        Convention => C, 
        External_Name => "split_server_info";

   procedure config_server  -- ./Communication/server_CTC.h:25
   with Import => True, 
        Convention => C, 
        External_Name => "config_server";

   procedure receive_message  -- ./Communication/server_CTC.h:27
   with Import => True, 
        Convention => C, 
        External_Name => "receive_message";

end server_CTC_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
