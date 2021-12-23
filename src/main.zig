const std = @import("std");
const ray = @cImport({
    @cInclude("C:/Users/ittai/source/gitRepos/raylib/src/raylib.h");
});
pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    ray.InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window");
    defer ray.CloseWindow();

    ray.SetTargetFPS(60);

    while (!ray.WindowShouldClose()) {
        ray.BeginDrawing();
        defer ray.EndDrawing();

        ray.ClearBackground(ray.RAYWHITE);
        ray.DrawText("Hello, World!", 190, 200, 20, ray.LIGHTGRAY);
    }
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
