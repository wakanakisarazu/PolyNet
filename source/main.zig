// SPDX-License-Identifier: GPL-3.0-or-later
// SPDX-FileCopyrightText: 2026 Wakana Kisarazu <wakanakisarazu.work@gmail.com>
const std = @import("std");
const debug = std.debug;
const HashMap = std.HashMap;
const crypto = std.crypto;
const Random = std.Random;
const process = std.process;



fn initRandom(seed: u64) Random
{
    var rng = Random.DefaultPrng.init(seed);
    return rng.random();
}


const Connection = struct 
{
    const Kind = enum {
        partner,
        family,
        friend,

        fn toString(this: @This()) []const u8 {
            return switch (this) {
                .partner => "partner",
                .family => "family",
                .friend => "friend",
            };
        }
    };

    uuid: u64,

    kind: Kind,
    people: [2]Person,

    fn init(uuid: u64, kind: Kind, people: [2]Person) @This() {
        return .{
            .uuid = uuid,

            .kind = kind,
            .people = people,
        };
    }

    fn show(this: @This()) void {
        debug.print(
            \\ UUID: {X}
            \\
            \\ Connection kind: {s}
            \\ Connection between: {any}
            \\
        , .{this.uuid, this.kind.toString(), this.peoplemv});
    }
};

const Person = struct
{
    uuid: u64,
    name: []const u8,

    fn init(uuid: u64, name: []const u8) @This() {
        return .{
            .uuid = uuid,
            .name = name,
        };
    }
};


pub fn main() void
{
    var random = initRandom(2938474732819);
    
    const taylor = Person.init(random.int(u64), "Taylor");
    const rose = Person.init(random.int(u64), "Rose");

    const taylor_rose = Connection.init(random.int(u64), .partner, .{taylor, rose});

    taylor_rose.show();
}