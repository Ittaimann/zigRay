const std = @import("std");
const camera = @import("camera.zig");
const raylib = @import("externals.zig").raylib;
const math = @import("math.zig");
const Vector3 = math.Vector3;

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    // TODO: FIX YA FUCKING LSP LMAO
    raylib.InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window");
    defer raylib.CloseWindow();

    raylib.SetTargetFPS(60);

    const position = math.vector3Init(10.0, 10.0, 10.0);
    const target = math.vector3Init(0.0, 0.0, 0.0);
    const fovy = 45.0;
    const projection = camera.raylib_Camera_projection.CAMERA_PERSPECTIVE;
    var scene_Camera: raylib.Camera3D = camera.initCamera(position, target, fovy, projection);
    var cube_Position: raylib.Vector3 = raylib.Vector3{ .x = 0.0, .y = 0.0, .z = 0.0 };
    while (!raylib.WindowShouldClose()) {
        //        float offsetThisFrame = 10.0f*GetFrameTime();
        var offset_this_frame = 10.0 * raylib.GetFrameTime();

        const offset: f32 = raylib.GetFrameTime() * 10.0;
        std.debug.print("{}", .{offset});
        scene_Camera.position = math.lerpVector3(raylib.Vector3Add(cube_Position, position), cube_Position, offset);
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
