const std = @import("std");
const raylib = @import("externals.zig").raylib;

// uh... can I comptime a lot of this? Like Init and update are different in nature
// game manager comptime destory and init?
// create component? update components?

pub const transform_comp = struct {
    var pos: raylib.Vector3 = raylib.Vector3{ .x = 0.0, .y = 0.0, .z = 0.0 };
    var scale: f32 = 1.0;
    var rot: raylib.Vector3 = raylib.Vector3{ .x = 0.0, .y = 0.0, .z = 0.0 }; //TODO: change this to quaternion
};

const transforms_array = std.ArrayList(transform_comp);

pub fn init(allocator: std.mem.Allocator) void {
    _ = allocator;
    // pass in an allocator
}

pub fn destroy() void {
    transforms_array.deinit();
}

pub fn initTransform(pos: raylib.Vector3, scale: f32, rot: raylib.Vector3) transform_comp {
    var new_transform = transform_comp{ .pos = pos, .scale = scale, .rot = rot };
    return new_transform;
}
