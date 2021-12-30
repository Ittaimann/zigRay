const std = @import("std");
const camera = @import("camera.zig");
//const raylib = @cImport({
//    @cInclude("raylib.h");
//});
const raylib = @import("externals.zig").raylib;

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    // TODO: FIX YA FUCKING LSP LMAO
    raylib.InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window");
    defer raylib.CloseWindow();

    raylib.SetTargetFPS(60);

    var sceneCamera: raylib.Camera3D = camera.initCameraEmpty();
    sceneCamera.position = (raylib.Vector3){ .x = 10.0, .y = 10.0, .z = 10.0 }; // Camera position
    sceneCamera.target = (raylib.Vector3){ .x = 0.0, .y = 0.0, .z = 0.0 }; // Camera looking at point
    sceneCamera.up = (raylib.Vector3){ .x = 0.0, .y = 1.0, .z = 0.0 }; // Camera up vector (rotation towards target)
    sceneCamera.fovy = 45.0; // Camera field-of-view
    sceneCamera.projection = raylib.CAMERA_PERSPECTIVE; // Camera mode typeh
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
