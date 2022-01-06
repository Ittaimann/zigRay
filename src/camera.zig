const std = @import("std");
const raylib = @import("externals.zig").raylib;
pub const math = @import("math.zig");

const raylib_up = raylib.Vector3{ .x = 0.0, .y = 1.0, .z = 0.0 };

pub const raylib_Camera_projection = enum(c_int) { CAMERA_PERSPECTIVE = 0, CAMEAR_ORTHOGRAPHIC = 1 };

const camera = struct {
    var x = undefined;
    var y = undefined;
};

pub fn initCameraEmpty() raylib.Camera3D {
    var result = raylib.Camera3D{ .position = undefined, .target = undefined, .up = undefined, .fovy = undefined, .projection = undefined };
    return result;
}

pub fn initCamera(position: math.Vector3, target: math.Vector3, fovy: f32, projection: raylib_Camera_projection) raylib.Camera3D {
    var new_camera = raylib.Camera3D{ .position = position, .target = target, .up = raylib_up, .fovy = fovy, .projection = @enumToInt(projection) };
    // .position.x = position.x,
    // .position.y = position.y, .position.z = position.z,
    // .target.x = target.x, .target.y = target.y, .z = target.z ,
    // .up.x = raylib_up.x, .up.y = raylib_up.y, .up.z = raylib.z ,
    // .fovy = fovy, .projection = @enumToInt(projection) };

    return new_camera;
}
