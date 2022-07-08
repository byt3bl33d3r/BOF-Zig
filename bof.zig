const beacon = @cImport({
    @cInclude("windows.h");
    @cInclude("ntdef.h"); // DECLSPEC_IMPORT Macro
    @cInclude("processthreadsapi.h"); // PROCESS_INFORMATION
    @cInclude("beacon.h"); 
});

//const print = @import("std").debug.print;
//const win32 = @import("./zigwin32/win32.zig");

//args: *[]u8, alen: c_int
pub export fn go() void {
    const msg = "Hello, world!\n";
    beacon.BeaconPrintf(beacon.CALLBACK_OUTPUT, msg[0]);
    //win32.c.MessageBoxA(null,"hello,world!","Zig",0);
}