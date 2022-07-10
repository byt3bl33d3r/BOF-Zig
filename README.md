# BOF-Zig


Build `bof.zig` with the following command in the directory with `beacon.h`

    zig build-obj --library c -isystem . -O ReleaseSmall --strip -target x86_64-windows bof.zig

This will product a `bof.obj` file.

## Zig BOF vs "Normal" C BOF

Zig BOF:

```
#~ objdump -t bof.obj
bof.obj:        file format coff-x86-64

SYMBOL TABLE:
[ 0](sec  1)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .text
AUX scnlen 0x16 nreloc 1 nlnno 0 checksum 0x3f909a6b assoc 1 comdat 0
[ 2](sec  2)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .data
AUX scnlen 0x0 nreloc 0 nlnno 0 checksum 0x0 assoc 2 comdat 0
[ 4](sec  3)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .bss
AUX scnlen 0x0 nreloc 0 nlnno 0 checksum 0x0 assoc 3 comdat 0
[ 6](sec  4)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .xdata
AUX scnlen 0x8 nreloc 0 nlnno 0 checksum 0xfc539d1 assoc 4 comdat 0
[ 8](sec  5)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .debug$S
AUX scnlen 0x50 nreloc 0 nlnno 0 checksum 0x6ce59f4c assoc 5 comdat 0
[10](sec  6)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .debug$T
AUX scnlen 0x38 nreloc 0 nlnno 0 checksum 0xf34da440 assoc 6 comdat 0
[12](sec  7)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .pdata
AUX scnlen 0xc nreloc 3 nlnno 0 checksum 0xbad438ac assoc 7 comdat 0
[14](sec -1)(fl 0x00)(ty   0)(scl   3) (nx 0) 0x00000000 @feat.00
[15](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x00000000 go
[16](sec  0)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x00000000 BeaconPrintf
[17](sec -2)(fl 0x00)(ty   0)(scl  67) (nx 1) 0x00000000 .file
```

C BOF:

```
#~ objdump -t hello.o
hello_c.o:      file format coff-x86-64

SYMBOL TABLE:
[ 0](sec -2)(fl 0x00)(ty   0)(scl  67) (nx 1) 0x00000000 .file
AUX hello.c
[ 2](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 1) 0x00000000 go
AUX Unknown
[ 4](sec  1)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .text
AUX scnlen 0x2f nreloc 2 nlnno 0 checksum 0x0 assoc 0 comdat 0
[ 6](sec  2)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .data
AUX scnlen 0x0 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[ 8](sec  3)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .bss
AUX scnlen 0x0 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[10](sec  4)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .rdata
AUX scnlen 0x10 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[12](sec  5)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .xdata
AUX scnlen 0xc nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[14](sec  6)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .pdata
AUX scnlen 0xc nreloc 3 nlnno 0 checksum 0x0 assoc 0 comdat 0
[16](sec  7)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .rdata$zzz
AUX scnlen 0x1d nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[18](sec  0)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x00000000 __imp_BeaconPrintf
```

## Problems

1. ZIG doesn't seem to export the imported `Beacon*` functions with the `__imp_` prefix. Unless there's a work around on Zig's side, existing BOF loaders will have to be modified.

2. When jumping into the `go` function, [Invoke-BOF](https://github.com/airbus-cert/Invoke-Bof) crashes, haven't tried with Cobalt Strike.
