const std = @import("std");
const html_text = \\<!DOCTYPE html>
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

pub fn tokenize(input_string: []const u8) !void {
    for (input_string) |chr| {
        print_char(chr);
    }
}


pub fn main() !void {
    try tokenize(html_text);
}
