pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with aarch64_linux_gnu_bits_types_h;
with stddef_h;
limited with aarch64_linux_gnu_bits_netdb_h;
with aarch64_linux_gnu_bits_stdint_uintn_h;
with aarch64_linux_gnu_bits_sockaddr_h;
with unistd_h;
limited with aarch64_linux_gnu_bits_socket_h;

package netdb_h is

   --  unsupported macro: h_errno (*__h_errno_location ())
   HOST_NOT_FOUND : constant := 1;  --  /usr/include/netdb.h:63
   TRY_AGAIN : constant := 2;  --  /usr/include/netdb.h:64

   NO_RECOVERY : constant := 3;  --  /usr/include/netdb.h:66

   NO_DATA : constant := 4;  --  /usr/include/netdb.h:68

   NETDB_INTERNAL : constant := -1;  --  /usr/include/netdb.h:72
   NETDB_SUCCESS : constant := 0;  --  /usr/include/netdb.h:73
   --  unsupported macro: NO_ADDRESS NO_DATA

   IPPORT_RESERVED : constant := 1024;  --  /usr/include/netdb.h:79
   --  unsupported macro: h_addr h_addr_list[0]

   AI_PASSIVE : constant := 16#0001#;  --  /usr/include/netdb.h:596
   AI_CANONNAME : constant := 16#0002#;  --  /usr/include/netdb.h:597
   AI_NUMERICHOST : constant := 16#0004#;  --  /usr/include/netdb.h:598
   AI_V4MAPPED : constant := 16#0008#;  --  /usr/include/netdb.h:599
   AI_ALL : constant := 16#0010#;  --  /usr/include/netdb.h:600
   AI_ADDRCONFIG : constant := 16#0020#;  --  /usr/include/netdb.h:601

   AI_NUMERICSERV : constant := 16#0400#;  --  /usr/include/netdb.h:613

   EAI_BADFLAGS : constant := -1;  --  /usr/include/netdb.h:616
   EAI_NONAME : constant := -2;  --  /usr/include/netdb.h:617
   EAI_AGAIN : constant := -3;  --  /usr/include/netdb.h:618
   EAI_FAIL : constant := -4;  --  /usr/include/netdb.h:619
   EAI_FAMILY : constant := -6;  --  /usr/include/netdb.h:620
   EAI_SOCKTYPE : constant := -7;  --  /usr/include/netdb.h:621
   EAI_SERVICE : constant := -8;  --  /usr/include/netdb.h:622
   EAI_MEMORY : constant := -10;  --  /usr/include/netdb.h:623
   EAI_SYSTEM : constant := -11;  --  /usr/include/netdb.h:624
   EAI_OVERFLOW : constant := -12;  --  /usr/include/netdb.h:625

   NI_MAXHOST : constant := 1025;  --  /usr/include/netdb.h:638
   NI_MAXSERV : constant := 32;  --  /usr/include/netdb.h:639

   NI_NUMERICHOST : constant := 1;  --  /usr/include/netdb.h:642
   NI_NUMERICSERV : constant := 2;  --  /usr/include/netdb.h:643
   NI_NOFQDN : constant := 4;  --  /usr/include/netdb.h:644
   NI_NAMEREQD : constant := 8;  --  /usr/include/netdb.h:645
   NI_DGRAM : constant := 16;  --  /usr/include/netdb.h:646

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

  -- All data returned by the network data base library are supplied in
  --   host order and returned in network order (suitable for use in
  --   system calls).   

  -- This is necessary to make this include file properly replace the
  --   Sun version.   

  -- Absolute file name for network data base files.   
  -- Error status for non-reentrant lookup functions.
  --   We use a macro to access always the thread-specific `h_errno' variable.   

  -- Function to get address of global `h_errno' variable.   
   --  skipped func __h_errno_location

  -- Possible values left in `h_errno'.   
  -- Highest reserved Internet port number.   
  -- Scope delimiter for getaddrinfo(), getnameinfo().   
  -- Print error indicated by `h_errno' variable on standard error.  STR
  --   if non-null is printed before the error string.   

   procedure herror (uu_str : Interfaces.C.Strings.chars_ptr)  -- /usr/include/netdb.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "herror";

  -- Return string associated with error ERR_NUM.   
   function hstrerror (uu_err_num : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/netdb.h:93
   with Import => True, 
        Convention => C, 
        External_Name => "hstrerror";

  -- Description of data base entry for a single host.   
  -- Official name of host.   
   type hostent is record
      h_name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/netdb.h:100
      h_aliases : System.Address;  -- /usr/include/netdb.h:101
      h_addrtype : aliased int;  -- /usr/include/netdb.h:102
      h_length : aliased int;  -- /usr/include/netdb.h:103
      h_addr_list : System.Address;  -- /usr/include/netdb.h:104
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/netdb.h:98

  -- Alias list.   
  -- Host address type.   
  -- Length of address.   
  -- List of addresses from name server.   
  -- Open host data base files and mark them as staying open even after
  --   a later search if STAY_OPEN is non-zero.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure sethostent (uu_stay_open : int)  -- /usr/include/netdb.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "sethostent";

  -- Close host data base files and clear `stay open' flag.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure endhostent  -- /usr/include/netdb.h:121
   with Import => True, 
        Convention => C, 
        External_Name => "endhostent";

  -- Get next entry from host data base file.  Open data base if
  --   necessary.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function gethostent return access hostent  -- /usr/include/netdb.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "gethostent";

  -- Return entry from host data base which address match ADDR with
  --   length LEN and type TYPE.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function gethostbyaddr
     (uu_addr : System.Address;
      uu_len : aarch64_linux_gnu_bits_types_h.uu_socklen_t;
      uu_type : int) return access hostent  -- /usr/include/netdb.h:135
   with Import => True, 
        Convention => C, 
        External_Name => "gethostbyaddr";

  -- Return entry from host data base for host with NAME.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function gethostbyname (uu_name : Interfaces.C.Strings.chars_ptr) return access hostent  -- /usr/include/netdb.h:142
   with Import => True, 
        Convention => C, 
        External_Name => "gethostbyname";

  -- Return entry from host data base for host with NAME.  AF must be
  --   set to the address type which is `AF_INET' for IPv4 or `AF_INET6'
  --   for IPv6.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function gethostbyname2 (uu_name : Interfaces.C.Strings.chars_ptr; uu_af : int) return access hostent  -- /usr/include/netdb.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "gethostbyname2";

  -- Reentrant versions of the functions above.  The additional
  --   arguments specify a buffer of BUFLEN starting at BUF.  The last
  --   argument is a pointer to a variable which gets the value which
  --   would be stored in the global variable `herrno' by the
  --   non-reentrant functions.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

   function gethostent_r
     (uu_result_buf : access hostent;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t;
      uu_result : System.Address;
      uu_h_errnop : access int) return int  -- /usr/include/netdb.h:165
   with Import => True, 
        Convention => C, 
        External_Name => "gethostent_r";

   function gethostbyaddr_r
     (uu_addr : System.Address;
      uu_len : aarch64_linux_gnu_bits_types_h.uu_socklen_t;
      uu_type : int;
      uu_result_buf : access hostent;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t;
      uu_result : System.Address;
      uu_h_errnop : access int) return int  -- /usr/include/netdb.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "gethostbyaddr_r";

   function gethostbyname_r
     (uu_name : Interfaces.C.Strings.chars_ptr;
      uu_result_buf : access hostent;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t;
      uu_result : System.Address;
      uu_h_errnop : access int) return int  -- /usr/include/netdb.h:177
   with Import => True, 
        Convention => C, 
        External_Name => "gethostbyname_r";

   function gethostbyname2_r
     (uu_name : Interfaces.C.Strings.chars_ptr;
      uu_af : int;
      uu_result_buf : access hostent;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t;
      uu_result : System.Address;
      uu_h_errnop : access int) return int  -- /usr/include/netdb.h:183
   with Import => True, 
        Convention => C, 
        External_Name => "gethostbyname2_r";

  -- Open network data base files and mark them as staying open even
  --   after a later search if STAY_OPEN is non-zero.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure setnetent (uu_stay_open : int)  -- /usr/include/netdb.h:196
   with Import => True, 
        Convention => C, 
        External_Name => "setnetent";

  -- Close network data base files and clear `stay open' flag.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure endnetent  -- /usr/include/netdb.h:202
   with Import => True, 
        Convention => C, 
        External_Name => "endnetent";

  -- Get next entry from network data base file.  Open data base if
  --   necessary.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getnetent return access aarch64_linux_gnu_bits_netdb_h.netent  -- /usr/include/netdb.h:209
   with Import => True, 
        Convention => C, 
        External_Name => "getnetent";

  -- Return entry from network data base which address match NET and
  --   type TYPE.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getnetbyaddr (uu_net : aarch64_linux_gnu_bits_stdint_uintn_h.uint32_t; uu_type : int) return access aarch64_linux_gnu_bits_netdb_h.netent  -- /usr/include/netdb.h:216
   with Import => True, 
        Convention => C, 
        External_Name => "getnetbyaddr";

  -- Return entry from network data base for network with NAME.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getnetbyname (uu_name : Interfaces.C.Strings.chars_ptr) return access aarch64_linux_gnu_bits_netdb_h.netent  -- /usr/include/netdb.h:222
   with Import => True, 
        Convention => C, 
        External_Name => "getnetbyname";

  -- Reentrant versions of the functions above.  The additional
  --   arguments specify a buffer of BUFLEN starting at BUF.  The last
  --   argument is a pointer to a variable which gets the value which
  --   would be stored in the global variable `herrno' by the
  --   non-reentrant functions.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

   function getnetent_r
     (uu_result_buf : access aarch64_linux_gnu_bits_netdb_h.netent;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t;
      uu_result : System.Address;
      uu_h_errnop : access int) return int  -- /usr/include/netdb.h:235
   with Import => True, 
        Convention => C, 
        External_Name => "getnetent_r";

   function getnetbyaddr_r
     (uu_net : aarch64_linux_gnu_bits_stdint_uintn_h.uint32_t;
      uu_type : int;
      uu_result_buf : access aarch64_linux_gnu_bits_netdb_h.netent;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t;
      uu_result : System.Address;
      uu_h_errnop : access int) return int  -- /usr/include/netdb.h:240
   with Import => True, 
        Convention => C, 
        External_Name => "getnetbyaddr_r";

   function getnetbyname_r
     (uu_name : Interfaces.C.Strings.chars_ptr;
      uu_result_buf : access aarch64_linux_gnu_bits_netdb_h.netent;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t;
      uu_result : System.Address;
      uu_h_errnop : access int) return int  -- /usr/include/netdb.h:246
   with Import => True, 
        Convention => C, 
        External_Name => "getnetbyname_r";

  -- Description of data base entry for a single service.   
  -- Official service name.   
   type servent is record
      s_name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/netdb.h:257
      s_aliases : System.Address;  -- /usr/include/netdb.h:258
      s_port : aliased int;  -- /usr/include/netdb.h:259
      s_proto : Interfaces.C.Strings.chars_ptr;  -- /usr/include/netdb.h:260
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/netdb.h:255

  -- Alias list.   
  -- Port number.   
  -- Protocol to use.   
  -- Open service data base files and mark them as staying open even
  --   after a later search if STAY_OPEN is non-zero.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure setservent (uu_stay_open : int)  -- /usr/include/netdb.h:268
   with Import => True, 
        Convention => C, 
        External_Name => "setservent";

  -- Close service data base files and clear `stay open' flag.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure endservent  -- /usr/include/netdb.h:274
   with Import => True, 
        Convention => C, 
        External_Name => "endservent";

  -- Get next entry from service data base file.  Open data base if
  --   necessary.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getservent return access servent  -- /usr/include/netdb.h:281
   with Import => True, 
        Convention => C, 
        External_Name => "getservent";

  -- Return entry from network data base for network with NAME and
  --   protocol PROTO.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getservbyname (uu_name : Interfaces.C.Strings.chars_ptr; uu_proto : Interfaces.C.Strings.chars_ptr) return access servent  -- /usr/include/netdb.h:288
   with Import => True, 
        Convention => C, 
        External_Name => "getservbyname";

  -- Return entry from service data base which matches port PORT and
  --   protocol PROTO.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getservbyport (uu_port : int; uu_proto : Interfaces.C.Strings.chars_ptr) return access servent  -- /usr/include/netdb.h:295
   with Import => True, 
        Convention => C, 
        External_Name => "getservbyport";

  -- Reentrant versions of the functions above.  The additional
  --   arguments specify a buffer of BUFLEN starting at BUF.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

   function getservent_r
     (uu_result_buf : access servent;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t;
      uu_result : System.Address) return int  -- /usr/include/netdb.h:306
   with Import => True, 
        Convention => C, 
        External_Name => "getservent_r";

   function getservbyname_r
     (uu_name : Interfaces.C.Strings.chars_ptr;
      uu_proto : Interfaces.C.Strings.chars_ptr;
      uu_result_buf : access servent;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t;
      uu_result : System.Address) return int  -- /usr/include/netdb.h:310
   with Import => True, 
        Convention => C, 
        External_Name => "getservbyname_r";

   function getservbyport_r
     (uu_port : int;
      uu_proto : Interfaces.C.Strings.chars_ptr;
      uu_result_buf : access servent;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t;
      uu_result : System.Address) return int  -- /usr/include/netdb.h:316
   with Import => True, 
        Convention => C, 
        External_Name => "getservbyport_r";

  -- Description of data base entry for a single service.   
  -- Official protocol name.   
   type protoent is record
      p_name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/netdb.h:326
      p_aliases : System.Address;  -- /usr/include/netdb.h:327
      p_proto : aliased int;  -- /usr/include/netdb.h:328
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/netdb.h:324

  -- Alias list.   
  -- Protocol number.   
  -- Open protocol data base files and mark them as staying open even
  --   after a later search if STAY_OPEN is non-zero.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure setprotoent (uu_stay_open : int)  -- /usr/include/netdb.h:336
   with Import => True, 
        Convention => C, 
        External_Name => "setprotoent";

  -- Close protocol data base files and clear `stay open' flag.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure endprotoent  -- /usr/include/netdb.h:342
   with Import => True, 
        Convention => C, 
        External_Name => "endprotoent";

  -- Get next entry from protocol data base file.  Open data base if
  --   necessary.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getprotoent return access protoent  -- /usr/include/netdb.h:349
   with Import => True, 
        Convention => C, 
        External_Name => "getprotoent";

  -- Return entry from protocol data base for network with NAME.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getprotobyname (uu_name : Interfaces.C.Strings.chars_ptr) return access protoent  -- /usr/include/netdb.h:355
   with Import => True, 
        Convention => C, 
        External_Name => "getprotobyname";

  -- Return entry from protocol data base which number is PROTO.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getprotobynumber (uu_proto : int) return access protoent  -- /usr/include/netdb.h:361
   with Import => True, 
        Convention => C, 
        External_Name => "getprotobynumber";

  -- Reentrant versions of the functions above.  The additional
  --   arguments specify a buffer of BUFLEN starting at BUF.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

   function getprotoent_r
     (uu_result_buf : access protoent;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t;
      uu_result : System.Address) return int  -- /usr/include/netdb.h:372
   with Import => True, 
        Convention => C, 
        External_Name => "getprotoent_r";

   function getprotobyname_r
     (uu_name : Interfaces.C.Strings.chars_ptr;
      uu_result_buf : access protoent;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t;
      uu_result : System.Address) return int  -- /usr/include/netdb.h:376
   with Import => True, 
        Convention => C, 
        External_Name => "getprotobyname_r";

   function getprotobynumber_r
     (uu_proto : int;
      uu_result_buf : access protoent;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t;
      uu_result : System.Address) return int  -- /usr/include/netdb.h:381
   with Import => True, 
        Convention => C, 
        External_Name => "getprotobynumber_r";

  -- Establish network group NETGROUP for enumeration.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function setnetgrent (uu_netgroup : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/netdb.h:393
   with Import => True, 
        Convention => C, 
        External_Name => "setnetgrent";

  -- Free all space allocated by previous `setnetgrent' call.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   procedure endnetgrent  -- /usr/include/netdb.h:401
   with Import => True, 
        Convention => C, 
        External_Name => "endnetgrent";

  -- Get next member of netgroup established by last `setnetgrent' call
  --   and return pointers to elements in HOSTP, USERP, and DOMAINP.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function getnetgrent
     (uu_hostp : System.Address;
      uu_userp : System.Address;
      uu_domainp : System.Address) return int  -- /usr/include/netdb.h:410
   with Import => True, 
        Convention => C, 
        External_Name => "getnetgrent";

  -- Test whether NETGROUP contains the triple (HOST,USER,DOMAIN).
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function innetgr
     (uu_netgroup : Interfaces.C.Strings.chars_ptr;
      uu_host : Interfaces.C.Strings.chars_ptr;
      uu_user : Interfaces.C.Strings.chars_ptr;
      uu_domain : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/netdb.h:421
   with Import => True, 
        Convention => C, 
        External_Name => "innetgr";

  -- Reentrant version of `getnetgrent' where result is placed in BUFFER.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function getnetgrent_r
     (uu_hostp : System.Address;
      uu_userp : System.Address;
      uu_domainp : System.Address;
      uu_buffer : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t) return int  -- /usr/include/netdb.h:430
   with Import => True, 
        Convention => C, 
        External_Name => "getnetgrent_r";

  -- Call `rshd' at port RPORT on remote machine *AHOST to execute CMD.
  --   The local user is LOCUSER, on the remote machine the command is
  --   executed as REMUSER.  In *FD2P the descriptor to the socket for the
  --   connection is returned.  The caller must have the right to use a
  --   reserved port.  When the function returns *AHOST contains the
  --   official host name.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function rcmd
     (uu_ahost : System.Address;
      uu_rport : unsigned_short;
      uu_locuser : Interfaces.C.Strings.chars_ptr;
      uu_remuser : Interfaces.C.Strings.chars_ptr;
      uu_cmd : Interfaces.C.Strings.chars_ptr;
      uu_fd2p : access int) return int  -- /usr/include/netdb.h:449
   with Import => True, 
        Convention => C, 
        External_Name => "rcmd";

  -- This is the equivalent function where the protocol can be selected
  --   and which therefore can be used for IPv6.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function rcmd_af
     (uu_ahost : System.Address;
      uu_rport : unsigned_short;
      uu_locuser : Interfaces.C.Strings.chars_ptr;
      uu_remuser : Interfaces.C.Strings.chars_ptr;
      uu_cmd : Interfaces.C.Strings.chars_ptr;
      uu_fd2p : access int;
      uu_af : aarch64_linux_gnu_bits_sockaddr_h.sa_family_t) return int  -- /usr/include/netdb.h:461
   with Import => True, 
        Convention => C, 
        External_Name => "rcmd_af";

  -- Call `rexecd' at port RPORT on remote machine *AHOST to execute
  --   CMD.  The process runs at the remote machine using the ID of user
  --   NAME whose cleartext password is PASSWD.  In *FD2P the descriptor
  --   to the socket for the connection is returned.  When the function
  --   returns *AHOST contains the official host name.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function rexec
     (uu_ahost : System.Address;
      uu_rport : int;
      uu_name : Interfaces.C.Strings.chars_ptr;
      uu_pass : Interfaces.C.Strings.chars_ptr;
      uu_cmd : Interfaces.C.Strings.chars_ptr;
      uu_fd2p : access int) return int  -- /usr/include/netdb.h:477
   with Import => True, 
        Convention => C, 
        External_Name => "rexec";

  -- This is the equivalent function where the protocol can be selected
  --   and which therefore can be used for IPv6.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function rexec_af
     (uu_ahost : System.Address;
      uu_rport : int;
      uu_name : Interfaces.C.Strings.chars_ptr;
      uu_pass : Interfaces.C.Strings.chars_ptr;
      uu_cmd : Interfaces.C.Strings.chars_ptr;
      uu_fd2p : access int;
      uu_af : aarch64_linux_gnu_bits_sockaddr_h.sa_family_t) return int  -- /usr/include/netdb.h:489
   with Import => True, 
        Convention => C, 
        External_Name => "rexec_af";

  -- Check whether user REMUSER on system RHOST is allowed to login as LOCUSER.
  --   If SUSER is not zero the user tries to become superuser.  Return 0 if
  --   it is possible.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function ruserok
     (uu_rhost : Interfaces.C.Strings.chars_ptr;
      uu_suser : int;
      uu_remuser : Interfaces.C.Strings.chars_ptr;
      uu_locuser : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/netdb.h:503
   with Import => True, 
        Convention => C, 
        External_Name => "ruserok";

  -- This is the equivalent function where the protocol can be selected
  --   and which therefore can be used for IPv6.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function ruserok_af
     (uu_rhost : Interfaces.C.Strings.chars_ptr;
      uu_suser : int;
      uu_remuser : Interfaces.C.Strings.chars_ptr;
      uu_locuser : Interfaces.C.Strings.chars_ptr;
      uu_af : aarch64_linux_gnu_bits_sockaddr_h.sa_family_t) return int  -- /usr/include/netdb.h:513
   with Import => True, 
        Convention => C, 
        External_Name => "ruserok_af";

  -- Check whether user REMUSER on system indicated by IPv4 address
  --   RADDR is allowed to login as LOCUSER.  Non-IPv4 (e.g., IPv6) are
  --   not supported.  If SUSER is not zero the user tries to become
  --   superuser.  Return 0 if it is possible.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function iruserok
     (uu_raddr : aarch64_linux_gnu_bits_stdint_uintn_h.uint32_t;
      uu_suser : int;
      uu_remuser : Interfaces.C.Strings.chars_ptr;
      uu_locuser : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/netdb.h:526
   with Import => True, 
        Convention => C, 
        External_Name => "iruserok";

  -- This is the equivalent function where the pfamiliy if the address
  --   pointed to by RADDR is determined by the value of AF.  It therefore
  --   can be used for IPv6
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function iruserok_af
     (uu_raddr : System.Address;
      uu_suser : int;
      uu_remuser : Interfaces.C.Strings.chars_ptr;
      uu_locuser : Interfaces.C.Strings.chars_ptr;
      uu_af : aarch64_linux_gnu_bits_sockaddr_h.sa_family_t) return int  -- /usr/include/netdb.h:537
   with Import => True, 
        Convention => C, 
        External_Name => "iruserok_af";

  -- Try to allocate reserved port, returning a descriptor for a socket opened
  --   at this port or -1 if unsuccessful.  The search for an available port
  --   will start at ALPORT and continues with lower numbers.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function rresvport (uu_alport : access int) return int  -- /usr/include/netdb.h:549
   with Import => True, 
        Convention => C, 
        External_Name => "rresvport";

  -- This is the equivalent function where the protocol can be selected
  --   and which therefore can be used for IPv6.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function rresvport_af (uu_alport : access int; uu_af : aarch64_linux_gnu_bits_sockaddr_h.sa_family_t) return int  -- /usr/include/netdb.h:558
   with Import => True, 
        Convention => C, 
        External_Name => "rresvport_af";

  -- Extension from POSIX.1:2001.   
  -- Structure to contain information about address of a service provider.   
  -- Input flags.   
   type addrinfo;
   type addrinfo is record
      ai_flags : aliased int;  -- /usr/include/netdb.h:567
      ai_family : aliased int;  -- /usr/include/netdb.h:568
      ai_socktype : aliased int;  -- /usr/include/netdb.h:569
      ai_protocol : aliased int;  -- /usr/include/netdb.h:570
      ai_addrlen : aliased unistd_h.socklen_t;  -- /usr/include/netdb.h:571
      ai_addr : access aarch64_linux_gnu_bits_socket_h.sockaddr;  -- /usr/include/netdb.h:572
      ai_canonname : Interfaces.C.Strings.chars_ptr;  -- /usr/include/netdb.h:573
      ai_next : access addrinfo;  -- /usr/include/netdb.h:574
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/netdb.h:565

  -- Protocol family for socket.   
  -- Socket type.   
  -- Protocol for socket.   
  -- Length of socket address.   
  -- Socket address for socket.   
  -- Canonical name for service location.   
  -- Pointer to next in list.   
  -- Structure used as control block for asynchronous lookup.   
  -- Name to look up.   
  -- Service name.   
  -- Additional request specification.   
  -- Pointer to result.   
  -- The following are internal elements.   
  -- Lookup mode.   
  -- Possible values for `ai_flags' field in `addrinfo' structure.   
  -- Error values for `getaddrinfo' function.   
  -- Translate name of a service location and/or a service name to set of
  --   socket addresses.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getaddrinfo
     (uu_name : Interfaces.C.Strings.chars_ptr;
      uu_service : Interfaces.C.Strings.chars_ptr;
      uu_req : access constant addrinfo;
      uu_pai : System.Address) return int  -- /usr/include/netdb.h:660
   with Import => True, 
        Convention => C, 
        External_Name => "getaddrinfo";

  -- Free `addrinfo' structure AI including associated storage.   
   procedure freeaddrinfo (uu_ai : access addrinfo)  -- /usr/include/netdb.h:666
   with Import => True, 
        Convention => C, 
        External_Name => "freeaddrinfo";

  -- Convert error return from getaddrinfo() to a string.   
   function gai_strerror (uu_ecode : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/netdb.h:669
   with Import => True, 
        Convention => C, 
        External_Name => "gai_strerror";

  -- Translate a socket address to a location and service name.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getnameinfo
     (uu_sa : access constant aarch64_linux_gnu_bits_socket_h.sockaddr;
      uu_salen : unistd_h.socklen_t;
      uu_host : Interfaces.C.Strings.chars_ptr;
      uu_hostlen : unistd_h.socklen_t;
      uu_serv : Interfaces.C.Strings.chars_ptr;
      uu_servlen : unistd_h.socklen_t;
      uu_flags : int) return int  -- /usr/include/netdb.h:675
   with Import => True, 
        Convention => C, 
        External_Name => "getnameinfo";

  -- Enqueue ENT requests from the LIST.  If MODE is GAI_WAIT wait until all
  --   requests are handled.  If WAIT is GAI_NOWAIT return immediately after
  --   queueing the requests and signal completion according to SIG.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

  -- Suspend execution of the thread until at least one of the ENT requests
  --   in LIST is handled.  If TIMEOUT is not a null pointer it specifies the
  --   longest time the function keeps waiting before returning with an error.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

  -- Get the error status of the request REQ.   
  -- Cancel the requests associated with GAICBP.   
end netdb_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
