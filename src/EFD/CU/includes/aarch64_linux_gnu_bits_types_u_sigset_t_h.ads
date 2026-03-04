pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package aarch64_linux_gnu_bits_types_u_sigset_t_h is

   type anon_array1851 is array (0 .. 15) of aliased unsigned_long;
   type uu_sigset_t is record
      uu_val : aliased anon_array1851;  -- /usr/include/aarch64-linux-gnu/bits/types/__sigset_t.h:7
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/aarch64-linux-gnu/bits/types/__sigset_t.h:8

end aarch64_linux_gnu_bits_types_u_sigset_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
