pub const float3 = struct { x: f32 = 0.0, y: f32 = 0.0, z: f32 = 0.0 };

pub fn float3init(x: f32, y: f32, z: f32) float3 {
    const value = float3{ .x = x, .y = y, .z = z };
    return value;
}
