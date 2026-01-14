savedcmd_samsung-galaxybook.mod := printf '%s\n'   samsung-galaxybook.o | awk '!x[$$0]++ { print("./"$$0) }' > samsung-galaxybook.mod
