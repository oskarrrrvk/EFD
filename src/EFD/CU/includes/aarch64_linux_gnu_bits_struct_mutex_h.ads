pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with aarch64_linux_gnu_bits_thread_shared_types_h;

package aarch64_linux_gnu_bits_struct_mutex_h is

  -- Default mutex implementation struct definitions.
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

  -- Generic struct for both POSIX and C11 mutexes.  New ports are expected
  --   to use the default layout, however architecture can redefine it to
  --   add arch-specific extension (such as lock-elision).  The struct have
  --   a size of 32 bytes on LP32 and 40 bytes on LP64 architectures.   

   type uu_pthread_mutex_s is record
      uu_lock : aliased int;  -- /usr/include/aarch64-linux-gnu/bits/struct_mutex.h:29
      uu_count : aliased unsigned;  -- /usr/include/aarch64-linux-gnu/bits/struct_mutex.h:30
      uu_owner : aliased int;  -- /usr/include/aarch64-linux-gnu/bits/struct_mutex.h:31
      uu_nusers : aliased unsigned;  -- /usr/include/aarch64-linux-gnu/bits/struct_mutex.h:33
      uu_kind : aliased int;  -- /usr/include/aarch64-linux-gnu/bits/struct_mutex.h:58
      uu_spins : aliased int;  -- /usr/include/aarch64-linux-gnu/bits/struct_mutex.h:63
      uu_list : aliased aarch64_linux_gnu_bits_thread_shared_types_h.uu_pthread_list_t;  -- /usr/include/aarch64-linux-gnu/bits/struct_mutex.h:64
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/aarch64-linux-gnu/bits/struct_mutex.h:27

  -- KIND must stay at this position in the structure to maintain
  --     binary compatibility with static initializers.
  --     Concurrency notes:
  --     The __kind of a mutex is initialized either by the static
  --     PTHREAD_MUTEX_INITIALIZER or by a call to pthread_mutex_init.
  --     After a mutex has been initialized, the __kind of a mutex is usually not
  --     changed.  BUT it can be set to -1 in pthread_mutex_destroy or elision can
  --     be enabled.  This is done concurrently in the pthread_mutex_*lock
  --     functions by using the macro FORCE_ELISION. This macro is only defined
  --     for architectures which supports lock elision.
  --     For elision, there are the flags PTHREAD_MUTEX_ELISION_NP and
  --     PTHREAD_MUTEX_NO_ELISION_NP which can be set in addition to the already
  --     set type of a mutex.  Before a mutex is initialized, only
  --     PTHREAD_MUTEX_NO_ELISION_NP can be set with pthread_mutexattr_settype.
  --     After a mutex has been initialized, the functions pthread_mutex_*lock can
  --     enable elision - if the mutex-type and the machine supports it - by
  --     setting the flag PTHREAD_MUTEX_ELISION_NP. This is done concurrently.
  --     Afterwards the lock / unlock functions are using specific elision
  --     code-paths.   

end aarch64_linux_gnu_bits_struct_mutex_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
