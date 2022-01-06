const raylib = @import("externals.zig");
pub const raymath = raylib.raymath;
pub const Vector3 = raylib.raylib.Vector3;

pub fn vector3Init(x: f32, y: f32, z: f32) Vector3 {
    return Vector3{ .x = x, .y = y, .z = z };
}

pub fn lerp(float1: f32, float2: f32, percentage: f32) f32 {
    return float1 * (1.0 - percentage) + float2 * (percentage);
}

pub fn lerpVector3(vector1: Vector3, vector2: Vector3, percentage: f32) Vector3 {
    return Vector3{ .x = lerp(vector1.x, vector2.x, percentage), .y = lerp(vector1.y, vector2.y, percentage), .z = lerp(vector1.z, vector2.z, percentage) };
}
