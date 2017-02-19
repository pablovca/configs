#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <linux/limits.h>

typedef enum {INCREASE, DECREASE} change_t;

char acpi_name[PATH_MAX];
char brightness_path[PATH_MAX];
char maximum_brightness_path[PATH_MAX];
char* base_path = "/sys/class/backlight/";

char brightness[4];
char maximum_brightness[4];
char* minimum_brightness = "5";

void get_acpi_name() {
    FILE* in = popen("ls /sys/class/backlight", "r");

    fgets(acpi_name, sizeof(acpi_name), in);
    acpi_name[strlen(acpi_name) - 1] = 0;
    //printf("acpi_name: %s \n", acpi_name);
    pclose(in);

}

void get_brightness_path() {
    strcat(brightness_path, base_path);
    strcat(brightness_path, acpi_name);
    strcat(brightness_path, "/brightness");
}

void get_maximum_brightness_path() {
    strcat(maximum_brightness_path, base_path);
    strcat(maximum_brightness_path, acpi_name);
    strcat(maximum_brightness_path, "/max_brightness");
}

void get_brightness() {
    char cat[PATH_MAX];
    memset(cat, 0, sizeof(cat));
    
    strcat(cat, "cat ");
    strcat(cat, brightness_path);

    //printf("cat en getbrithness: %s \n", cat);
    
    FILE* in = popen(cat, "r"); 
    fgets(brightness, sizeof(brightness), in);
    //printf("brigth: %s \n", brightness);
    pclose(in);
    
}

int get_maximum_brightness() {
    char cat[PATH_MAX];
    memset(cat, 0, sizeof(cat));
    
	strcat(cat, "cat ");
    strcat(cat, maximum_brightness_path);

    //printf("cat en getmaximumb_: %s \n", cat);
    
    FILE* in = popen(cat, "r"); 
    fgets(maximum_brightness, sizeof(maximum_brightness), in);
    //printf("maxbrigth: %s \n", maximum_brightness);
    pclose(in);
}


void change_brightness(change_t type, char* change) {
    FILE* out = fopen(brightness_path, "w+");
    if(out == NULL) {
		puts("mierda");
		perror("fopen() ");
		exit(-1);
    }
 
    char new_brightness[3];
    int i_brightness = atoi(brightness);
	int i_change = atoi(change);

    if(type == INCREASE) {
        i_brightness += i_change;
        if(i_brightness < atoi(maximum_brightness)) {
		 	sprintf(new_brightness, "%d", i_brightness);
			fputs(new_brightness, out);
		} else {
			fputs(maximum_brightness, out);
		}
    } else if(type == DECREASE) {
        i_brightness -= i_change;
		if(i_brightness > 0) {
		 	sprintf(new_brightness, "%d", i_brightness);
			fputs(new_brightness, out);
		} else {
			fputs(minimum_brightness, out);
		}
	}
	fclose(out);
}

void init() {
    get_acpi_name();
    get_brightness_path();
    get_maximum_brightness_path();
	get_brightness();
	get_maximum_brightness();
}

int main(int argc, char** argv) {
    
	if(argc < 3) {
		printf("missing argument, %d given\n", argc);
		puts("usage: --inc 10 or --dec 10");
		exit(-1);
	}	
 	
	init();

    if(strcmp(argv[1], "--inc") == 0)
        change_brightness(INCREASE, argv[2]);
    else if(strcmp(argv[1], "--dec") == 0)
        change_brightness(DECREASE, argv[2]);
    else 
        printf("invalid argument %s\n", argv[1]);

    return 0;
}
