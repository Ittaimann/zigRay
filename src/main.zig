const std = @import("std");
const camera = @import("camera.zig");
const raylib = @import("externals.zig").raylib;
const math = @import("math.zig");
const managers = @import("gameManagers.zig");
const Vector3 = math.Vector3;

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    raylib.InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window");
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator: std.mem.Allocator = gpa.allocator();
    defer {
        const leaked = gpa.deinit();
        if (leaked) std.testing.expect(false) catch @panic("MEMORY LEAK DETECTED");
    }
    defer raylib.CloseWindow();

    raylib.SetTargetFPS(60);

    const position = math.vector3Init(10.0, 10.0, 10.0);
    const target = math.vector3Init(0.0, 0.0, 0.0);
    var scene_Camera: raylib.Camera3D = camera.initCamera(position, target, 45.0, camera.raylib_Camera_projection.CAMERA_PERSPECTIVE);
    var cube_Position: raylib.Vector3 = raylib.Vector3{ .x = 0.0, .y = 0.0, .z = 0.0 };

    managers.gameManager.init(allocator);
    // update game objects
    // update camera
    // drawScene

    while (!raylib.WindowShouldClose()) {
        managers.gameManager.update();
        var offset_this_frame = 10.0 * raylib.GetFrameTime();

        if (raylib.IsKeyDown(raylib.KEY_W)) {
            cube_Position.z += 1.0 * offset_this_frame;
        }
        if (raylib.IsKeyDown(raylib.KEY_S)) {
            cube_Position.z -= 1.0 * offset_this_frame;
        }

        if (raylib.IsKeyDown(raylib.KEY_A)) {
            cube_Position.x += 1.0 * offset_this_frame;
        }
        if (raylib.IsKeyDown(raylib.KEY_D)) {
            cube_Position.x -= 1.0 * offset_this_frame;
        }
        scene_Camera.target = cube_Position;

        //draw
        {
            raylib.BeginDrawing();
            defer raylib.EndDrawing();
            raylib.BeginMode3D(scene_Camera);
            defer raylib.EndMode3D();
            raylib.DrawCube(cube_Position, 2.0, 2.0, 2.0, raylib.RED);
            raylib.DrawCubeWires(cube_Position, 2.0, 2.0, 2.0, raylib.MAROON);
            raylib.DrawGrid(10.0, 1.0);

            raylib.ClearBackground(raylib.RAYWHITE);
        }
    }
}

pub fn drawScene() void {}
