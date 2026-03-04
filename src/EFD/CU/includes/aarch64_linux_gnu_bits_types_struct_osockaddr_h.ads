pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package aarch64_linux_gnu_bits_types_struct_osockaddr_h is

  -- This is the 4.3 BSD `struct sockaddr' format, which is used as wire
  --   format in the grotty old 4.3 `talk' protocol.   

   type anon_array2263 is array (0 .. 13) of aliased unsigned_char;
   type osockaddr is record
      sa_family : aliased unsigned_short;  -- /usr/include/aarch64-linux-gnu/bits/types/struct_osockaddr.h:8
      sa_data : aliased anon_array2263;  -- /usr/include/aarch64-linux-gnu/bits/types/struct_osockaddr.h:9
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/aarch64-linux-gnu/bits/types/struct_osockaddr.h:6

end aarch64_linux_gnu_bits_types_struct_osockaddr_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
