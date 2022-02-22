const std = @import("std");
const transform_manager = @import("transform.zig");
const camera_manager = @import("cameraManager.zig");
pub const gameManager = struct {
    pub fn init(allocator: std.mem.Allocator) void {
        transform_manager.init(allocator);
        camera_manager.init(allocator);
    }
    pub fn update() void {}
    //pub fn registerManager(comptime t) void {}
    // arrays?
};
