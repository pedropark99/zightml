const std = @import("std");
const html_text =
    \\<!DOCTYPE html>
    \\<html class="client-nojs" lang="en" dir="ltr">
    \\<head>
    \\<meta charset="UTF-8" />
    \\<title>Sinnoh Route 205 - Bulbapedia, the community-driven Pokémon encyclopedia</title>
    \\</head>
    \\<body>Testing an body that I dont know of.
    \\</body></html>
;

pub fn print_char(chr: u8) void {
    std.debug.print("{c}\n", .{chr});
}

const Tree = struct {
    root: Node,
};

const Node = struct {
    data: i32,
    parent: ?*Node,
    left: ?*Node,
    right: ?*Node,
};

const ParserCache = struct {
    ast: Tree,
    current_index: usize,
};

pub fn main() !void {
    var tree = Tree{ .root = Node{
        .data = 1,
        .parent = null,
        .left = null,
        .right = null,
    } };
    _ = tree;
}
