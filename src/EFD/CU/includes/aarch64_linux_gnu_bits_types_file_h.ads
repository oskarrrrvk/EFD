pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with aarch64_linux_gnu_bits_types_struct_FILE_h;

package aarch64_linux_gnu_bits_types_FILE_h is

  -- The opaque type of streams.  This is the definition used elsewhere.   
   subtype FILE is aarch64_linux_gnu_bits_types_struct_FILE_h.u_IO_FILE;  -- /usr/include/aarch64-linux-gnu/bits/types/FILE.h:7

end aarch64_linux_gnu_bits_types_FILE_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
