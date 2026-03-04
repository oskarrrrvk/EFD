pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with aarch64_linux_gnu_bits_types_u_sigset_t_h;

package aarch64_linux_gnu_bits_types_sigset_t_h is

  -- A set of signals to be blocked, unblocked, or waited for.   
   subtype sigset_t is aarch64_linux_gnu_bits_types_u_sigset_t_h.uu_sigset_t;  -- /usr/include/aarch64-linux-gnu/bits/types/sigset_t.h:7

end aarch64_linux_gnu_bits_types_sigset_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
