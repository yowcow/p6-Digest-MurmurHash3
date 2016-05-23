#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include "libmurmurhash.h"

void test_hoge() {
    printf("Working on %s ... ", __func__);

    assert(hoge() == 123456);

    printf("Done\n");
}

int main() {

    test_hoge();

    return 0;
}
