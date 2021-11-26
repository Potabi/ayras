include("$${PWD}/../../OS-detect.pri")

TEMPLATE = app
#Don't need any Qt - just a simple C program
QT = 
CONFIG += console

TARGET = lumina-checkpass
target.path = $$DESTDIR$${PREFIX}/sbin

LIBS     += -lpam

SOURCES += main.c

perms.path = $$DESTDIR$${PREFIX}/sbin
perms.run = "cp /work/stage/$$DESTDIR$${PREFIX}/sbin/lumina-checkpass $$DESTDIR$${PREFIX}/sbin/lumina-checkpass"
perms.extra = "chmod 4555 $$DESTDIR$${PREFIX}/sbin/lumina-checkpass"

INSTALLS += target perms
