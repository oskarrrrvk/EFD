pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package aarch64_linux_gnu_bits_atomic_wide_counter_h is

  -- Monotonically increasing wide counters (at least 62 bits).
  --   Copyright (C) 2016-2022 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <https://www.gnu.org/licenses/>.   

  -- Counter that is monotonically increasing (by less than 2**31 per
  --   increment), with a single writer, and an arbitrary number of
  --   readers.   

   type anon_struct1887 is record
      uu_low : aliased unsigned;  -- /usr/include/aarch64-linux-gnu/bits/atomic_wide_counter.h:30
      uu_high : aliased unsigned;  -- /usr/include/aarch64-linux-gnu/bits/atomic_wide_counter.h:31
   end record
   with Convention => C_Pass_By_Copy;
   type uu_atomic_wide_counter (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_value64 : aliased Extensions.unsigned_long_long;  -- /usr/include/aarch64-linux-gnu/bits/atomic_wide_counter.h:27
         when others =>
            uu_value32 : aliased anon_struct1887;  -- /usr/include/aarch64-linux-gnu/bits/atomic_wide_counter.h:32
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /usr/include/aarch64-linux-gnu/bits/atomic_wide_counter.h:33

end aarch64_linux_gnu_bits_atomic_wide_counter_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
