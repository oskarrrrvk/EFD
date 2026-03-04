pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package aarch64_linux_gnu_bits_socket_type_h is

   --  unsupported macro: SOCK_STREAM SOCK_STREAM
   --  unsupported macro: SOCK_DGRAM SOCK_DGRAM
   --  unsupported macro: SOCK_RAW SOCK_RAW
   --  unsupported macro: SOCK_RDM SOCK_RDM
   --  unsupported macro: SOCK_SEQPACKET SOCK_SEQPACKET
   --  unsupported macro: SOCK_DCCP SOCK_DCCP
   --  unsupported macro: SOCK_PACKET SOCK_PACKET
   --  unsupported macro: SOCK_CLOEXEC SOCK_CLOEXEC
   --  unsupported macro: SOCK_NONBLOCK SOCK_NONBLOCK
  -- Define enum __socket_type for generic Linux.
  --   Copyright (C) 1991-2022 Free Software Foundation, Inc.
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

  -- Types of sockets.   
   subtype uu_socket_type is unsigned;
   uu_socket_type_SOCK_STREAM : constant uu_socket_type := 1;
   uu_socket_type_SOCK_DGRAM : constant uu_socket_type := 2;
   uu_socket_type_SOCK_RAW : constant uu_socket_type := 3;
   uu_socket_type_SOCK_RDM : constant uu_socket_type := 4;
   uu_socket_type_SOCK_SEQPACKET : constant uu_socket_type := 5;
   uu_socket_type_SOCK_DCCP : constant uu_socket_type := 6;
   uu_socket_type_SOCK_PACKET : constant uu_socket_type := 10;
   uu_socket_type_SOCK_CLOEXEC : constant uu_socket_type := 524288;
   uu_socket_type_SOCK_NONBLOCK : constant uu_socket_type := 2048;  -- /usr/include/aarch64-linux-gnu/bits/socket_type.h:24

  -- Sequenced, reliable, connection-based
  --				   byte streams.   

  -- Connectionless, unreliable datagrams
  --				   of fixed maximum length.   

  -- Raw protocol interface.   
  -- Reliably-delivered messages.   
  -- Sequenced, reliable, connection-based,
  --				   datagrams of fixed maximum length.   

  -- Datagram Congestion Control Protocol.   
  -- Linux specific way of getting packets
  --				   at the dev level.  For writing rarp and
  --				   other similar things on the user level.  

  -- Flags to be ORed into the type parameter of socket and socketpair and
  --     used for the flags parameter of paccept.   

  -- Atomically set close-on-exec flag for the
  --				   new descriptor(s).   

  -- Atomically mark descriptor(s) as
  --				   non-blocking.   

end aarch64_linux_gnu_bits_socket_type_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
