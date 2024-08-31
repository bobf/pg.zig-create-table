const std = @import("std");

const pg = @import("pg");

pub fn main() !void {}

test {
    var pool = try pg.Pool.init(std.testing.allocator, .{
        .size = 1,
        .connect = .{
            .port = 5432,
            .host = "127.0.0.1",
        },
        .auth = .{
            .username = "postgres",
            .database = "postgres",
            .password = "password",
        },
    });
    defer pool.deinit();

    try createTable(pool);
    try createTable(pool);
}

fn createTable(pool: *pg.Pool) !void {
    var connection = try pool.acquire();
    defer pool.release(connection);

    var result = try connection.queryOpts("create table foo (bar varchar(255))", .{}, .{});
    defer result.deinit();

    std.debug.print("connection.err: {any}\n", .{connection.err});
}
