pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with aarch64_linux_gnu_bits_types_h;

package aarch64_linux_gnu_bits_types_clock_t_h is

  -- Returned by `clock'.   
   subtype clock_t is aarch64_linux_gnu_bits_types_h.uu_clock_t;  -- /usr/include/aarch64-linux-gnu/bits/types/clock_t.h:7

end aarch64_linux_gnu_bits_types_clock_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
