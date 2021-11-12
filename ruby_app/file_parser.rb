class FileParser
  def initialize(file_path)
    @file = File.open(file_path)
    @list = Hash.new { |h, k| h[k] = [] } #create hash with default values
  end

  def parse
    for file in @file
      path , ip = file.split(' ') #divide string into path and ip
      @list[path] << ip #append ip ex: /about => ["451.106.204.921","451.106.204.921"]
    end
    return @list
  end

  def counter
    @counts = {}
    for k, v in @list
      @counts[k] = @list[k].length
    end
    return @counts
  end

  def most_views
    counter
    return @counts.sort_by { |k, v| v }.reverse.to_h #hash sorting by value
  end

  def unique_views
    for k, v in @list
      @list[k].uniq!
    end
    counter
    return @counts.sort_by { |k , v| v }.reverse.to_h
  end
=begin
  Uniq! #Removes duplicate elements from self, the first occurrence always being retained; returns self if any elements removed, nil otherwise.
=end
end
