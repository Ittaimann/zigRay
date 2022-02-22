const std = @import("std");
const raylib = @import("externals.zig").raylib;

pub const raylib_Camera_projection = enum(c_int) { CAMERA_PERSPECTIVE = 0, CAMEAR_ORTHOGRAPHIC = 1 };
const raylib_up = raylib.Vector3{ .x = 0.0, .y = 1.0, .z = 0.0 };

const camera_comp = struct {
    var fov: f32 = undefined;
    var projection: raylib_Camera_projection = undefined;
    var up: f32 = raylib_up;
};

const camera_array = std.ArrayList(camera_comp);

pub fn init(allocator: std.mem.Allocator) void {
    _ = allocator;
    // pass in an allocator
}

pub fn destroy() void {
    camera_array.deinit();
}

pub fn initCamera(fov: f32, proj: raylib_Camera_projection) camera_comp {
    const new_camera = camera_comp{ .fov = fov, .projection = proj };
    return new_camera;
}
