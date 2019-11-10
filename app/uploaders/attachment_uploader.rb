class AttachmentUploader < Shrine
    plugin :data_uri

plugin :add_metadata

add_metadata do |io, context|
    {'file_name' => context[:record].attachment_name}
end

end