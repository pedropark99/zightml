const std = @import("std");
const print = std.debug.print;
const input_text =
    \\<!DOCTYPE html>
    \\<html class="client-nojs" lang="en" dir="ltr">
    \\<head>
    \\<meta charset="UTF-8" />
    \\<title>Sinnoh Route 205 - Bulbapedia, the community-driven Pokémon encyclopedia</title>
    \\</head>
    \\<body>Testing an body that I dont know of.
    \\</body></html>
;

const n_bytes = input_text.len;
const ParserCache = struct {
    html_text: *const [n_bytes]u8,
    input_length: usize,
    current_index: u32,

    pub fn next(self: ParserCache) void {
        if ((self.current_index + 1) < self.input_length) {
            self.current_index += 1;
        }
    }
};

const KeyValuePair = struct {
    key: *const [30]u8,
    value: *const [100]u8,
};

const HTMLElement = struct {
    id: *const [30]u8,
    content: *const [500]u8,
    attributes: std.ArrayList(KeyValuePair),
};

pub fn count_html_elements(html_text: *const [n_bytes]u8) u64 {
    var count: u64 = 0;
    for (html_text) |byte| {
        if (byte == '<') {
            count += 1;
        }
    }
    return count;
}

pub fn parse(parser_cache: ParserCache) void {
    _ = parser_cache;
    const n_html_elements = count_html_elements(input_text);
    print("{}\n", .{n_html_elements});
    var html_elements = [n_html_elements]HTMLElement;
    _ = html_elements;
}

pub fn main() !void {
    var parser_cache = ParserCache{
        .html_text = input_text,
        .input_length = n_bytes,
        .current_index = 0,
    };

    parse(parser_cache);
}
