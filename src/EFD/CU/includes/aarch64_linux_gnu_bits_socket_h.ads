pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with aarch64_linux_gnu_bits_sockaddr_h;
with System;
with unistd_h;
limited with aarch64_linux_gnu_bits_types_struct_iovec_h;
with stddef_h;

package aarch64_linux_gnu_bits_socket_h is

   PF_UNSPEC : constant := 0;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:41
   PF_LOCAL : constant := 1;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:42
   --  unsupported macro: PF_UNIX PF_LOCAL
   --  unsupported macro: PF_FILE PF_LOCAL

   PF_INET : constant := 2;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:45
   PF_AX25 : constant := 3;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:46
   PF_IPX : constant := 4;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:47
   PF_APPLETALK : constant := 5;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:48
   PF_NETROM : constant := 6;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:49
   PF_BRIDGE : constant := 7;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:50
   PF_ATMPVC : constant := 8;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:51
   PF_X25 : constant := 9;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:52
   PF_INET6 : constant := 10;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:53
   PF_ROSE : constant := 11;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:54
   PF_DECnet : constant := 12;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:55
   PF_NETBEUI : constant := 13;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:56
   PF_SECURITY : constant := 14;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:57
   PF_KEY : constant := 15;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:58
   PF_NETLINK : constant := 16;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:59
   --  unsupported macro: PF_ROUTE PF_NETLINK

   PF_PACKET : constant := 17;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:61
   PF_ASH : constant := 18;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:62
   PF_ECONET : constant := 19;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:63
   PF_ATMSVC : constant := 20;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:64
   PF_RDS : constant := 21;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:65
   PF_SNA : constant := 22;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:66
   PF_IRDA : constant := 23;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:67
   PF_PPPOX : constant := 24;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:68
   PF_WANPIPE : constant := 25;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:69
   PF_LLC : constant := 26;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:70
   PF_IB : constant := 27;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:71
   PF_MPLS : constant := 28;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:72
   PF_CAN : constant := 29;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:73
   PF_TIPC : constant := 30;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:74
   PF_BLUETOOTH : constant := 31;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:75
   PF_IUCV : constant := 32;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:76
   PF_RXRPC : constant := 33;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:77
   PF_ISDN : constant := 34;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:78
   PF_PHONET : constant := 35;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:79
   PF_IEEE802154 : constant := 36;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:80
   PF_CAIF : constant := 37;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:81
   PF_ALG : constant := 38;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:82
   PF_NFC : constant := 39;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:83
   PF_VSOCK : constant := 40;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:84
   PF_KCM : constant := 41;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:85
   PF_QIPCRTR : constant := 42;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:86
   PF_SMC : constant := 43;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:87
   PF_XDP : constant := 44;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:88
   PF_MCTP : constant := 45;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:89
   PF_MAX : constant := 46;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:90
   --  unsupported macro: AF_UNSPEC PF_UNSPEC
   --  unsupported macro: AF_LOCAL PF_LOCAL
   --  unsupported macro: AF_UNIX PF_UNIX
   --  unsupported macro: AF_FILE PF_FILE
   --  unsupported macro: AF_INET PF_INET
   --  unsupported macro: AF_AX25 PF_AX25
   --  unsupported macro: AF_IPX PF_IPX
   --  unsupported macro: AF_APPLETALK PF_APPLETALK
   --  unsupported macro: AF_NETROM PF_NETROM
   --  unsupported macro: AF_BRIDGE PF_BRIDGE
   --  unsupported macro: AF_ATMPVC PF_ATMPVC
   --  unsupported macro: AF_X25 PF_X25
   --  unsupported macro: AF_INET6 PF_INET6
   --  unsupported macro: AF_ROSE PF_ROSE
   --  unsupported macro: AF_DECnet PF_DECnet
   --  unsupported macro: AF_NETBEUI PF_NETBEUI
   --  unsupported macro: AF_SECURITY PF_SECURITY
   --  unsupported macro: AF_KEY PF_KEY
   --  unsupported macro: AF_NETLINK PF_NETLINK
   --  unsupported macro: AF_ROUTE PF_ROUTE
   --  unsupported macro: AF_PACKET PF_PACKET
   --  unsupported macro: AF_ASH PF_ASH
   --  unsupported macro: AF_ECONET PF_ECONET
   --  unsupported macro: AF_ATMSVC PF_ATMSVC
   --  unsupported macro: AF_RDS PF_RDS
   --  unsupported macro: AF_SNA PF_SNA
   --  unsupported macro: AF_IRDA PF_IRDA
   --  unsupported macro: AF_PPPOX PF_PPPOX
   --  unsupported macro: AF_WANPIPE PF_WANPIPE
   --  unsupported macro: AF_LLC PF_LLC
   --  unsupported macro: AF_IB PF_IB
   --  unsupported macro: AF_MPLS PF_MPLS
   --  unsupported macro: AF_CAN PF_CAN
   --  unsupported macro: AF_TIPC PF_TIPC
   --  unsupported macro: AF_BLUETOOTH PF_BLUETOOTH
   --  unsupported macro: AF_IUCV PF_IUCV
   --  unsupported macro: AF_RXRPC PF_RXRPC
   --  unsupported macro: AF_ISDN PF_ISDN
   --  unsupported macro: AF_PHONET PF_PHONET
   --  unsupported macro: AF_IEEE802154 PF_IEEE802154
   --  unsupported macro: AF_CAIF PF_CAIF
   --  unsupported macro: AF_ALG PF_ALG
   --  unsupported macro: AF_NFC PF_NFC
   --  unsupported macro: AF_VSOCK PF_VSOCK
   --  unsupported macro: AF_KCM PF_KCM
   --  unsupported macro: AF_QIPCRTR PF_QIPCRTR
   --  unsupported macro: AF_SMC PF_SMC
   --  unsupported macro: AF_XDP PF_XDP
   --  unsupported macro: AF_MCTP PF_MCTP
   --  unsupported macro: AF_MAX PF_MAX

   SOL_RAW : constant := 255;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:148
   SOL_DECNET : constant := 261;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:149
   SOL_X25 : constant := 262;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:150
   SOL_PACKET : constant := 263;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:151
   SOL_ATM : constant := 264;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:152
   SOL_AAL : constant := 265;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:153
   SOL_IRDA : constant := 266;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:154
   SOL_NETBEUI : constant := 267;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:155
   SOL_LLC : constant := 268;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:156
   SOL_DCCP : constant := 269;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:157
   SOL_NETLINK : constant := 270;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:158
   SOL_TIPC : constant := 271;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:159
   SOL_RXRPC : constant := 272;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:160
   SOL_PPPOL2TP : constant := 273;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:161
   SOL_BLUETOOTH : constant := 274;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:162
   SOL_PNPIPE : constant := 275;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:163
   SOL_RDS : constant := 276;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:164
   SOL_IUCV : constant := 277;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:165
   SOL_CAIF : constant := 278;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:166
   SOL_ALG : constant := 279;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:167
   SOL_NFC : constant := 280;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:168
   SOL_KCM : constant := 281;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:169
   SOL_TLS : constant := 282;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:170
   SOL_XDP : constant := 283;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:171
   SOL_MPTCP : constant := 284;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:172
   SOL_MCTP : constant := 285;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:173
   SOL_SMC : constant := 286;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:174

   SOMAXCONN : constant := 4096;  --  /usr/include/aarch64-linux-gnu/bits/socket.h:177
   --  unsupported macro: MSG_OOB MSG_OOB
   --  unsupported macro: MSG_PEEK MSG_PEEK
   --  unsupported macro: MSG_DONTROUTE MSG_DONTROUTE
   --  unsupported macro: MSG_CTRUNC MSG_CTRUNC
   --  unsupported macro: MSG_PROXY MSG_PROXY
   --  unsupported macro: MSG_TRUNC MSG_TRUNC
   --  unsupported macro: MSG_DONTWAIT MSG_DONTWAIT
   --  unsupported macro: MSG_EOR MSG_EOR
   --  unsupported macro: MSG_WAITALL MSG_WAITALL
   --  unsupported macro: MSG_FIN MSG_FIN
   --  unsupported macro: MSG_SYN MSG_SYN
   --  unsupported macro: MSG_CONFIRM MSG_CONFIRM
   --  unsupported macro: MSG_RST MSG_RST
   --  unsupported macro: MSG_ERRQUEUE MSG_ERRQUEUE
   --  unsupported macro: MSG_NOSIGNAL MSG_NOSIGNAL
   --  unsupported macro: MSG_MORE MSG_MORE
   --  unsupported macro: MSG_WAITFORONE MSG_WAITFORONE
   --  unsupported macro: MSG_BATCH MSG_BATCH
   --  unsupported macro: MSG_ZEROCOPY MSG_ZEROCOPY
   --  unsupported macro: MSG_FASTOPEN MSG_FASTOPEN
   --  unsupported macro: MSG_CMSG_CLOEXEC MSG_CMSG_CLOEXEC
   --  arg-macro: function CMSG_DATA (cmsg)
   --    return (cmsg).__cmsg_data;
   --  arg-macro: procedure CMSG_NXTHDR (mhdr, cmsg)
   --    __cmsg_nxthdr (mhdr, cmsg)
   --  arg-macro: function CMSG_FIRSTHDR (mhdr)
   --    return (size_t) (mhdr).msg_controllen >= sizeof (struct cmsghdr) ? (struct cmsghdr *) (mhdr).msg_control : (struct cmsghdr *) 0;
   --  arg-macro: function CMSG_ALIGN (len)
   --    return ((len) + sizeof (size_t) - 1) and (size_t) ~(sizeof (size_t) - 1);
   --  arg-macro: function CMSG_SPACE (len)
   --    return CMSG_ALIGN (len) + CMSG_ALIGN (sizeof (struct cmsghdr));
   --  arg-macro: function CMSG_LEN (len)
   --    return CMSG_ALIGN (sizeof (struct cmsghdr)) + (len);
   --  unsupported macro: SCM_RIGHTS SCM_RIGHTS

  -- System-specific socket constants and types.  Linux version.
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

  -- Type for length arguments in socket calls.   
  -- Get the architecture-dependent definition of enum __socket_type.   
  -- Protocol families.   
  -- Address families.   
  -- Socket level values.  Others are defined in the appropriate headers.
  --   XXX These definitions also should go into the appropriate headers as
  --   far as they are available.   

  -- Maximum queue length specifiable by listen.   
  -- Get the definition of the macro to define the common sockaddr members.   
  -- Structure describing a generic socket address.   
  -- Common data: address family and length.   
   subtype anon_array2210 is Interfaces.C.char_array (0 .. 13);
   type sockaddr is record
      sa_family : aliased aarch64_linux_gnu_bits_sockaddr_h.sa_family_t;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:185
      sa_data : aliased anon_array2210;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:186
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:183

  -- Address data.   
  -- Structure large enough to hold any socket address (with the historical
  --   exception of AF_UNIX).   

  -- Address family, etc.   
   subtype anon_array2213 is Interfaces.C.char_array (0 .. 117);
   type sockaddr_storage is record
      ss_family : aliased aarch64_linux_gnu_bits_sockaddr_h.sa_family_t;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:198
      uu_ss_padding : aliased anon_array2213;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:199
      uu_ss_align : aliased unsigned_long;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:200
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:196

  -- Force desired alignment.   
  -- Bits in the FLAGS argument to `send', `recv', et al.   
  -- Process out-of-band data.   
  -- Peek at incoming messages.   
  -- Don't use local routing.   
  -- DECnet uses a different name.   
  -- Control data lost before delivery.   
  -- Supply or ask second address.   
  -- Nonblocking IO.   
  -- End of record.   
  -- Wait for a full request.   
  -- Confirm path validity.   
  -- Fetch message from error queue.   
  -- Do not generate SIGPIPE.   
  -- Sender will send more.   
  -- Wait for at least one packet to return. 
  -- sendmmsg: more messages coming.   
  -- Use user data in kernel path.   
  -- Send data in TCP SYN.   
  -- Set close_on_exit for file
  --					   descriptor received through
  --					   SCM_RIGHTS.   

  -- Structure describing messages sent by
  --   `sendmsg' and received by `recvmsg'.   

  -- Address to send to/receive from.   
   type msghdr is record
      msg_name : System.Address;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:264
      msg_namelen : aliased unistd_h.socklen_t;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:265
      msg_iov : access aarch64_linux_gnu_bits_types_struct_iovec_h.iovec;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:267
      msg_iovlen : aliased stddef_h.size_t;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:268
      msg_control : System.Address;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:270
      msg_controllen : aliased stddef_h.size_t;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:271
      msg_flags : aliased int;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:276
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:262

  -- Length of address data.   
  -- Vector of data to send/receive into.   
  -- Number of elements in the vector.   
  -- Ancillary data (eg BSD filedesc passing).  
  -- Ancillary data buffer length.
  --				   !! The type should be socklen_t but the
  --				   definition of the kernel is incompatible
  --				   with this.   

  -- Flags on received message.   
  -- Structure used for storage of ancillary data object information.   
  -- Length of data in cmsg_data plus length
  --				   of cmsghdr structure.
  --				   !! The type should be socklen_t but the
  --				   definition of the kernel is incompatible
  --				   with this.   

   type anon_array2219 is array (0 .. 0) of aliased unsigned_char;
   type cmsghdr is record
      cmsg_len : aliased stddef_h.size_t;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:282
      cmsg_level : aliased int;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:287
      cmsg_type : aliased int;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:288
      uu_cmsg_data : aliased anon_array2219;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:290
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:280

  -- Originating protocol.   
  -- Protocol specific type.   
  -- Ancillary data.   
  -- Ancillary data object manipulation macros.   
  -- Given a length, return the additional padding necessary such that
  --   len + __CMSG_PADDING(len) == CMSG_ALIGN (len).   

   --  skipped func __cmsg_nxthdr

  -- We may safely assume that __cmsg lies between __mhdr->msg_control and
  --     __mhdr->msg_controllen because the user is required to obtain the first
  --     cmsg via CMSG_FIRSTHDR, set its length, then obtain subsequent cmsgs
  --     via CMSG_NXTHDR, setting lengths along the way.  However, we don't yet
  --     trust the value of __cmsg->cmsg_len and therefore do not use it in any
  --     pointer arithmetic until we check its value.   

  -- The current header is malformed, too small to be a full header.   
  -- There isn't enough space between __cmsg and the end of the buffer to
  --  hold the current cmsg *and* the next one.   

  -- Now, we trust cmsg_len and can use it to find the next header.   
  -- Socket level message types.  This must match the definitions in
  --   <linux/socket.h>.   

  -- Transfer file descriptors.   
  -- Credentials passing.   
  -- User visible structure for SCM_CREDENTIALS message  
  -- PID of sending process.   
  -- UID of sending process.   
  -- GID of sending process.   
  -- Structure used to manipulate the SO_LINGER option.   
  -- Nonzero to linger on close.   
   type linger is record
      l_onoff : aliased int;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:394
      l_linger : aliased int;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:395
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/aarch64-linux-gnu/bits/socket.h:392

  -- Time to linger.   
end aarch64_linux_gnu_bits_socket_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
