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



const ParserCache = struct {
    current_index: usize,
    current_char: u8,
};

pub fn main() !void {
    var tokens:[500][]const u8 = undefined;
    var current_index:usize = 0;
    var current_char:u8 = html_text[0];

    var token_index:usize = 0;
    var lexeme_begin:usize = 0;
    while (current_index < html_text.len) {

        if (current_char == '<') {
            tokens[token_index] = html_text[lexeme_begin..current_index];
            token_index = token_index + 1;
            lexeme_begin = current_index + 1;
        }

        current_index = current_index + 1;
        current_char = html_text[current_index];
    }


    for (tokens) |token| {
        std.debug.print("{s}", .{token});
    }
}
