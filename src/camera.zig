const std = @import("std");
const raylib = @import("externals.zig").raylib;

pub const camera = struct {
    var x = undefined;
    var y = undefined;
};

pub fn initCameraEmpty() raylib.Camera3D {
    var result = raylib.Camera3D{ .position = undefined, .target = undefined, .up = undefined, .fovy = undefined, .projection = undefined };
    return result;
}
