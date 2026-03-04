pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with aarch64_linux_gnu_bits_types_h;

package aarch64_linux_gnu_bits_types_timer_t_h is

  -- Timer ID returned by `timer_create'.   
   subtype timer_t is aarch64_linux_gnu_bits_types_h.uu_timer_t;  -- /usr/include/aarch64-linux-gnu/bits/types/timer_t.h:7

end aarch64_linux_gnu_bits_types_timer_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
