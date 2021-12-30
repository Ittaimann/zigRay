const std = @import("std");
const raylib = @import("externals.zig").raylib;
const float3 = @import("math.zig");

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

pub fn initCamera(position: float3.float3, target: float3.float3, fovy: f32, projection: raylib_Camera_projection) raylib.Camera3D {
    var new_camera = raylib.Camera3D{ .position = raylib.Vector3{ .x = position.x, .y = position.y, .z = position.z }, .target = raylib.Vector3{ .x = target.x, .y = target.y, .z = target.z }, .up = raylib_up, .fovy = fovy, .projection = @enumToInt(projection) };
    return new_camera;
}
