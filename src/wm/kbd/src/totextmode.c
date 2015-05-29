/*
 * totextmode.c - aeb - 2000-01-20
 */
#include <stdlib.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <linux/vt.h>
#include <linux/kd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include "getfd.h"
#include "nls.h"
#include "version.h"
#include "kbd_error.h"

int
main(int argc, char *argv[]) {
	int fd, num;

	set_progname(argv[0]);

	setlocale(LC_ALL, "");
	bindtextdomain(PACKAGE_NAME, LOCALEDIR);
	textdomain(PACKAGE_NAME);

	if (argc == 2 && !strcmp(argv[1], "-V"))
		print_version_and_exit();

	if (argc != 2) {
		kbd_error(EXIT_FAILURE, 0, _("usage: totextmode\n"));
	}
	fd = getfd(NULL);
	num = atoi(argv[1]);
	if (ioctl(fd,KDSETMODE,KD_TEXT)) {
		kbd_error(EXIT_FAILURE, errno, "totextmode: KDSETMODE");
	}
	return EXIT_SUCCESS;
}
