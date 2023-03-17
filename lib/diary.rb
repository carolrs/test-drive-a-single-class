class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @next_chunk = 0
  end

  def title
    return @title
    # Returns the title as a string
  end

  def contents
    return @contents
    # Returns the contents as a string
  end

  def count_words
    @contents.split.size
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm) 
    # given that a user can read 200 words per minute 
    # when the text contains 300 words 
    # then the result should be 2 min
    # because the program only acc minutes and not seconds I need to round up
    # if I convert to float I'll have decimals and then I can round up
    (count_words / wpm.to_f).ceil
    # wpm is an integer representing the number of words the
    # user can read per minute
  end

  # def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
  #                                 # of words the user can read per minute
  #                                 # `minutes` is an integer representing the
  #                                 # number of minutes the user has to read
  #   # Returns a string with a chunk of the contents that the user could read
  #   # in the given number of minutes.
  #   # If called again, `reading_chunk` should return the next chunk, skipping
  #   # what has already been read, until the contents is fully read.
  #   # The next call after that it should restart from the beginning.

  # end

  def reading_chunk(wpm, minutes)
     
    chunk_size = wpm * minutes

    start = @next_chunk
    stop = start + chunk_size

    @next_chunk = stop

    if start >= count_words
        @next_chunk = 0
        return "You finished the reading"
    end

    @contents.split[start...stop].join(" ")
  end
end