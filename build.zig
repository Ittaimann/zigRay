const std = @import("std");
const raylibBuilder = @import("external/raylib/src/build.zig");

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("ZigRay", "src/main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);

    const run_step = exe.run();
    const step = b.step("run", "compiles and runs main.zig");
    step.dependOn(&run_step.step);

    exe.addIncludeDir("External/raylib/src");
    const raylibBuild = raylibBuilder.build(b);
    exe.linkLibrary(raylibBuild);
    exe.addIncludeDir("src/");
    exe.install();
}
