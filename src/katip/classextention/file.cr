require "file"

class File
  def self.append(filename : String, text : String)
    File.open(filename, "r+") do |file|
      file.seek(0, IO::Seek::End)
      file.print(text)
    end
  end
end

