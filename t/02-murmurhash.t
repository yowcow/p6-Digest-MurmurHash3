use v6;
use experimental :pack;
use Digest::MurmurHash3;
use Test;

my Str $key  = "hogefugafoobar";
my Int $seed = 12345678;

subtest {
    my Buf $result = murmurhash3_32($key, $seed);

    is $result.unpack('H4'), '633ea11b';

}, 'Test murmurhash3_32';

subtest {
    my Buf $result = murmurhash3_128($key, $seed);

    is $result.unpack('H16'), '80852a5a10aca8ad6de465a7434fb91c';

}, 'Test murmurhash3_128';

done-testing;
