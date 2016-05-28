[![Build Status](https://travis-ci.org/yowcow/p6-Digest-MurmurHash3.svg?branch=master)](https://travis-ci.org/yowcow/p6-Digest-MurmurHash3)

NAME
====

Digest::MurmurHash3 - MurmurHash3 impelementation

SYNOPSIS
========

    use Digest::MurmurHash3;

    my Buf $buf32 = murmurhash3_32($key, $seed);

    my Buf $buf128 = murmurhash3_128($key, $seed);

DESCRIPTION
===========

Digest::MurmurHash3 is a [MurmurHash3](https://github.com/aappleby/smhasher) hashing algorithm implementation.

METHODS
=======

murmurhash3_32(Str $key, uint32 $seed) returns Buf
--------------------------------------------------

Calculates 32-bit hash, and returns as Buf.

murmurhash3_128(Str $key, uint32 $seed) returns Buf
---------------------------------------------------

Calculates 128-bit hash, and returns as Buf.

AUTHOR
======

yowcow <yowcow@cpan.org>

COPYRIGHT AND LICENSE
=====================

Copyright 2016 yowcow

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
