#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <sys/syscall.h>
#include <errno.h>

int main() {
    const char *new_root = "/newroot";
    const char *put_old = "/newroot/old_root";

    int ret = syscall(SYS_pivot_root, new_root, put_old);
    if (ret == 0) {
        printf("pivot_root successful.\n");
    } else {
        perror("pivot_root failed");
    }

    return 0;
}