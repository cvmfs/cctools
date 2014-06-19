include(manual.h)dnl
HEADER(chroot_package_run)dnl

SECTION(NAME)
BOLD(chroot_package_run) - repeat a program with the package with the help of CODE(chroot)

SECTION(SYNOPSIS)
CODE(BOLD(chroot_package_run [options]))

SECTION(DESCRIPTION)
If CODE(chroot) is used to help repeat one experiment, common directories like BODE(/proc), BOLD(/dev), BOLD(/net), BOLD(/sys), BOLD(/var), BOLD(/misc) and BOLD(/selinux) will be remounted into the package if they exists on your local filesystem. After you finish all your test within CODE(chroot_package_run), these remounted directories will be unmounted.

SECTION(OPTIONS)
OPTIONS_BEGIN
OPTION_ITEM(`-s, --shell-type')The type of shell used to do the experiment. (e.g., bash, tcsh, csh, zsh)
OPTION_ITEM(`-p, --package-path')The path of the package.
OPTION_ITEM(`-h, --help')Show this help message.
OPTIONS_END

SECTION(EXIT STATUS)
On success, returns zero. On failure, returns non-zero.

SECTION(EXAMPLES)
To repeat one program within one package BOLD(/tmp/package) in a BOLD(bash) shell:
LONGCODE_BEGIN
% chroot_package_run --package-path /tmp/package --shell-type bash
LONGCODE_END
After the execution of this command, one shell will be returned, where you can repeat your original program. After everything is done, exit CODE(chroot_package_run):
LONGCODE_BEGIN
% exit
LONGCODE_END

Here is a short instruction about how to make use of CODE(parrot_run), CODE(parrot_package_create) and CODE(chroot_package_run)
to generate one package for your experiment and repeat your experiment within your package.
PARA
Step 1: Run your program under CODE(parrot_run) and using BOLD(--name-list) and BOLD(--env-list) parameters to
record the filename list and environment variables.
LONGCODE_BEGIN
% parrot_run --name-list namelist --env-list envlist /bin/bash
LONGCODE_END
After the execution of this command, you can run your program inside CODE(parrot_run). At the end of step 1, one file named BOLD(namelist) containing all the accessed file names and one file named BOLD(envlist) containing environment variables will be generated.
After everything is done, exit CODE(parrot_run):
LONGCODE_BEGIN
% exit
LONGCODE_END
PARA
Step 2: Using CODE(parrot_package_create) to generate a package.
LONGCODE_BEGIN
% parrot_package_create --name-list namelist --env-path envlist --package-path /tmp/package
LONGCODE_END
At the end of step 2, one package with the path of BOLD(/tmp/package) will be generated.
Step 3: Repeat your program within your package.
LONGCODE_BEGIN
% chroot_package_run --package-path /tmp/package --shell-type bash ...
LONGCODE_END
After the execution of this command, one shell will be returned, where you can repeat your original program (Please replace BOLD(--shell-type) parameter with the shell type you actually used). After everything is done, exit CODE(chroot_package_run):
LONGCODE_BEGIN
% exit
LONGCODE_END

SECTION(COPYRIGHT)

COPYRIGHT_BOILERPLATE

SECTION(SEE ALSO)

SEE_ALSO_PARROT

FOOTER

