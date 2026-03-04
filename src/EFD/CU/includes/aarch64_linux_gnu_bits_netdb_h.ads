pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with aarch64_linux_gnu_bits_stdint_uintn_h;

package aarch64_linux_gnu_bits_netdb_h is

  -- Copyright (C) 1996-2022 Free Software Foundation, Inc.
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

  -- Description of data base entry for a single network.  NOTE: here a
  --   poor assumption is made.  The network number is expected to fit
  --   into an unsigned long int variable.   

  -- Official name of network.   
   type netent is record
      n_name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/aarch64-linux-gnu/bits/netdb.h:28
      n_aliases : System.Address;  -- /usr/include/aarch64-linux-gnu/bits/netdb.h:29
      n_addrtype : aliased int;  -- /usr/include/aarch64-linux-gnu/bits/netdb.h:30
      n_net : aliased aarch64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /usr/include/aarch64-linux-gnu/bits/netdb.h:31
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/aarch64-linux-gnu/bits/netdb.h:26

  -- Alias list.   
  -- Net address type.   
  -- Network number.   
end aarch64_linux_gnu_bits_netdb_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
