// SPDX-License-Identifier: GPL-3.0-or-later
// SPDX-FileCopyrightText: 2026 Wakana Kisarazu <wakanakisarazu.work@gmail.com>
const std = @import("std");
const debug = std.debug;
const crypto = std.crypto;
const Io = std.Io;
const process = std.process;



const Node = struct 
{
    unique_id: [32]u8,
    public_key: [32]u8,
    name_tag: []const u8,
};

const Identity = struct 
{
    key_pair: crypto.sign.Ed25519.KeyPair,
    node: Node,
};


pub fn main(init: process.Init) void
{   
    // Fuck sake.
    // This is complex, fun to learn crypto tho.
    // :3
}