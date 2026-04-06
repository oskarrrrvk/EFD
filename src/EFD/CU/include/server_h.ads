pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with netinet_in_h;
with Interfaces.C.Strings;

package server_h is

   MAXLINE : constant := 1024;  --  ./server.h:15


   server_addr : aliased netinet_in_h.sockaddr_in  -- ./server.h:20
   with Import => True, 
        Convention => C, 
        External_Name => "server_addr";

   client_addr : aliased netinet_in_h.sockaddr_in  -- ./server.h:21
   with Import => True, 
        Convention => C, 
        External_Name => "client_addr";

   function config_server return int  -- ./server.h:23
   with Import => True, 
        Convention => C, 
        External_Name => "config_server";

   function accept_connection (server_socket : int) return int  -- ./server.h:24
   with Import => True, 
        Convention => C, 
        External_Name => "accept_connection";

   procedure receive_message (message : Interfaces.C.Strings.chars_ptr; listener_socket : int)  -- ./server.h:25
   with Import => True, 
        Convention => C, 
        External_Name => "receive_message";

   procedure send_message (message : Interfaces.C.Strings.chars_ptr; listener_socket : int)  -- ./server.h:26
   with Import => True, 
        Convention => C, 
        External_Name => "send_message";

   procedure close_connection (listener_socket : int)  -- ./server.h:27
   with Import => True, 
        Convention => C, 
        External_Name => "close_connection";

end server_h;
