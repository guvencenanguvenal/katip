require "file"

class File
  def self.append(filename : String, text : String)
    _file_io = File.read(filename)
    File.write(filename, _file_io + text)
  end

  def self.json_append(filename : String, json : String)
    _file_io = File.read(filename)
    File.write(filename, _file_io.rchop + text)
  end
end

