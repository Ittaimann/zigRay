const std = @import("std");
const camera = @import("camera.zig");
//const raylib = @cImport({
//    @cInclude("raylib.h");
//});
const raylib = @import("externals.zig").raylib;
const math = @import("math.zig");

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    // TODO: FIX YA FUCKING LSP LMAO
    raylib.InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window");
    defer raylib.CloseWindow();

    raylib.SetTargetFPS(60);

    const position = math.float3init(10.0, 10.0, 10.0);
    const target = math.float3init(0.0, 0.0, 0.0);
    const fovy = 45.0;
    const projection = camera.raylib_Camera_projection.CAMERA_PERSPECTIVE;
    var sceneCamera: raylib.Camera3D = camera.initCamera(position, target, fovy, projection);
    const cubePosition: raylib.Vector3 = raylib.Vector3{ .x = 0.0, .y = 0.0, .z = 0.0 };
    while (!raylib.WindowShouldClose()) {
        raylib.BeginDrawing();
        defer raylib.EndDrawing();
        raylib.BeginMode3D(sceneCamera);
        defer raylib.EndMode3D();
        raylib.DrawCube(cubePosition, 2.0, 2.0, 2.0, raylib.RED);
        raylib.DrawCubeWires(cubePosition, 2.0, 2.0, 2.0, raylib.MAROON);
        raylib.DrawGrid(10.0, 1.0);
        raylib.ClearBackground(raylib.RAYWHITE);
    }
}
