use v6;
use LibraryMake;
use NativeCall;

unit class Digest::MurmurHash;

sub library {
    state $so;
    $so = get-vars('')<SO> if not $so;
    ~(%?RESOURCES{"libmurmurhash$so"});
}

our sub hoge(--> uint32)
    is native(&library)
    { * }

=begin pod

=head1 NAME

Digest::MurmurHash - blah blah blah

=head1 SYNOPSIS

  use Digest::MurmurHash;

=head1 DESCRIPTION

Digest::MurmurHash is ...

=head1 AUTHOR

yowcow <yowcow@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2016 yowcow

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
