use v6;
use LibraryMake;
use NativeCall;

unit class Digest::MurmurHash3;

sub library {
    state $so;
    $so = get-vars('')<SO> if not $so;
    ~(%?RESOURCES{"libmurmurhash3$so"});
}

sub MurmurHash3_x86_32_i(Str, int32, uint32 --> uint32)
    is native(&library) { * }

sub MurmurHash3_x86_128(Str, int32, uint32, CArray[uint32])
    is native(&library) { * }

sub sign-bit(Int:D $v, Int:D :$bit = 31 --> Int) {
    # Negative value comes out even though type is uint32.
    # To correctly manage bits, flag left most bit if sign is negative.
    $v.sign == -1
        ?? (-1 * $v) +| (1 +< $bit)
        !! $v;
}

sub to-buf(*@hash --> Buf) {
    my Int @blocks;
    @hash.map({
        my $h = $_;
        for ^4 {
            @blocks.push: $h +& 255;
            $h = $h +> 8;
        }
    });
    Buf.new(|@blocks);
}

our sub murmurhash3_32(Str:D $key, Int:D $seed --> Buf) is export {
    my Int $result = MurmurHash3_x86_32_i($key, $key.chars, $seed);

    to-buf(sign-bit($result, :bit(31)));
}

our sub murmurhash3_128(Str:D $key, Int:D $seed --> Buf) is export {
    my @hash := CArray[uint32].new;
    @hash[$_] = 0 for ^4;

    MurmurHash3_x86_128($key, $key.chars, $seed, @hash);

    to-buf((sign-bit(@hash[$_], :bit(31)) for ^4));
}

=begin pod

=head1 NAME

Digest::MurmurHash3 - MurmurHash3 impelementation

=head1 SYNOPSIS

  use Digest::MurmurHash3;

=head1 DESCRIPTION

Digest::MurmurHash3 is a L<MurmurHash3|https://github.com/aappleby/smhasher> hashing algorithm implementation.

=head1 AUTHOR

yowcow <yowcow@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2016 yowcow

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
