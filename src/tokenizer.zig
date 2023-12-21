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

const TokenPosition = struct {
    start_index: u64,
    end_index: u64,
};

pub fn tokenizer(input_string: []const u8) void {
    var tokens = std.ArrayList(TokenPosition).init(std.heap.page_allocator);

    var last_end_index: u64 = 0;
    for (input_string, 0..) |char, index| {
        if (char == '<' or char == '>') {
            if (last_end_index != index) {
                try tokens.append(TokenPosition{ .start_index = last_end_index, .end_index = index });
            }

            // include the '<' or '>' character as a token:
            try tokens.append(TokenPosition{ .start_index = index, .end_index = index });
            last_end_index = index + 1;
        }
    }

    return tokens;
}

pub fn main() !void {
    tokenizer(html_text);
}
