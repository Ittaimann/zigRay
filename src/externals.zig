pub const raylib = @cImport({
    @cInclude("raylib.h");
    //these need to be decalred in the same space, hopefully the defines get hit in raylib.h and follow through to raymath
    @cInclude("raymath.h");
});
