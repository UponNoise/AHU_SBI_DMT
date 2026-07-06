#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
int main()
{
    char *fn = "/tmp/XYZ";
    char buffer[60];
    FILE *fp;
    uid_t real_uid = getuid();
    uid_t eff_uid = geteuid();
    scanf("%50s", buffer);
    if (!access(fn, W_OK)) {
        seteuid(real_uid);
        fp = fopen(fn, "a+");
        if (!fp) {
            perror("Open failed");
            seteuid(eff_uid);
            exit(1);
        }
        fwrite("\n", sizeof(char), 1, fp);
        fwrite(buffer, sizeof(char), strlen(buffer), fp);
        fclose(fp);
        seteuid(eff_uid);
    } else {
        printf("No permission \n");
    }
    return 0;
}
