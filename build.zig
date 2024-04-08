const builtin = @import("builtin");
const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("tehuti", .{
        .source_file = .{ .path = "src/_.zig" },
    });
    const lib = b.addStaticLibrary(.{
        .name = "tehuti",
        .root_source_file = .{ .path = "src/_.zig" },
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(lib);
}
