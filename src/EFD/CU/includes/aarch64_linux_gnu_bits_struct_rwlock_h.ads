pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package aarch64_linux_gnu_bits_struct_rwlock_h is

  -- AArch64 internal rwlock struct definitions.
  --   Copyright (C) 2019-2022 Free Software Foundation, Inc.
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
  --   <http://www.gnu.org/licenses/>.   

   type uu_pthread_rwlock_arch_t is record
      uu_readers : aliased unsigned;  -- /usr/include/aarch64-linux-gnu/bits/struct_rwlock.h:25
      uu_writers : aliased unsigned;  -- /usr/include/aarch64-linux-gnu/bits/struct_rwlock.h:26
      uu_wrphase_futex : aliased unsigned;  -- /usr/include/aarch64-linux-gnu/bits/struct_rwlock.h:27
      uu_writers_futex : aliased unsigned;  -- /usr/include/aarch64-linux-gnu/bits/struct_rwlock.h:28
      uu_pad3 : aliased unsigned;  -- /usr/include/aarch64-linux-gnu/bits/struct_rwlock.h:29
      uu_pad4 : aliased unsigned;  -- /usr/include/aarch64-linux-gnu/bits/struct_rwlock.h:30
      uu_cur_writer : aliased int;  -- /usr/include/aarch64-linux-gnu/bits/struct_rwlock.h:31
      uu_shared : aliased int;  -- /usr/include/aarch64-linux-gnu/bits/struct_rwlock.h:32
      uu_pad1 : aliased unsigned_long;  -- /usr/include/aarch64-linux-gnu/bits/struct_rwlock.h:33
      uu_pad2 : aliased unsigned_long;  -- /usr/include/aarch64-linux-gnu/bits/struct_rwlock.h:34
      uu_flags : aliased unsigned;  -- /usr/include/aarch64-linux-gnu/bits/struct_rwlock.h:35
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/aarch64-linux-gnu/bits/struct_rwlock.h:23

end aarch64_linux_gnu_bits_struct_rwlock_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
