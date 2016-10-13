# Moonux Project

Moonux is a new Operating System for ComputerCraft, developed by thecrimulo.
Fully open-source and hosted on GitLab.

## Why this is different to the other OSes
Moonux relies and runs on its own libraries, binaries and shell, making it the
most independent from CraftOS as possible. Instead of using the embedded OS API
inside of the BIOS, or using /rom/apis/fs, you use /lib/os.l and /lib/io.l .

## Moonux expectations compared to...
Cubix: Moonux is primarily based on Cubix and was the creator's inspiration. 
Moonux's KISS (Keep it Simple, Stupid) philosophy does not match too much with 
Cubix's. Cubix has its simulated filesystems, drives, and other features that 
make it look a great OS, which it is, but it's not natively implemented on 
ComputerCraft. Moonux does not have filesystems, or drives: Moonux has file 
permissions, but not the typical ones, because every file is readable, there is 
no read permission, and it makes it fully open source. Files only have Write or 
Execute permission, and the advanced library system only enables Moonux native 
libraries to use the old functions. Although the package manager, manuals, and 
other features are not planned yet, it's a lot to come.

zOS: zOS is a great way to show the KISS philosophy, but we can say Moonux will 
be more complex. The fact that there are new functions, libraries, and renamed 
or deleted functions makes programming in Moonux a new experience and a new 
variant of Lua/CC itself, more like CC/Moonux, this list of libraries will be 
growing, and you can contribute by filling the form.

OneOS: OneOS by oeed is a great operating system, we could remark the different 
programs that Moonux and OneOS include, OneOS includes propietary programs 
Sketch and Ink, which are great, and they include a lot of useful functions, 
but, OneOS is more front-end designed, I mean, it has an interface, games... 
Moonux is mainly text based, and programs with GUI can be installed. About 
Silica, we expect to be in the trail of the new resolution and libraries.

## Developing for MNX11
### Developing Binaries for MNX11
All binaries can use the libraries provided in the source code. A binary must 
have no extension and they can use its own libraries.

### Developing Libraries for MNX11
Libraries must have a .l extension. Libraries can import old functions, more 
information if contacted. Libraries must be loadable using api.load() and must 
be careful using local variables.

### Documentating MNX11
Documentating must be on the GitLab repository wiki, and must provide all 
details possible.

Want to enroll?: https://bit.ly/mnxxdevel
If I contacted you via PM, you will be added to the Private Moonux-Dev gitter 
and Discord channel. Not all people will be chosen, depends on the amount of 
people filling the form. If you are contacted, you shall not tell anyone who is 
not in the program. If you are choosen, you're free and you don't need to be 
always there, It's okay if you decide to take a break.