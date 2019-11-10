
require "shrine" # core
require "shrine/storage/file_system" # plugin to save files using file system
Shrine.plugin :determine_mime_type 
Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), 
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"),
}

Shrine.plugin :activerecord # enable ActiveRecord support
