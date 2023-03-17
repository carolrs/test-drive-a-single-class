require 'diary'

describe DiaryEntry do 

  describe "#new" do
    it "returns a new title object" do 
      diary_entry =  DiaryEntry.new('Title', 'Content')
      expect(diary_entry).to be_an_instance_of DiaryEntry
    end

    describe "#title" do
      it "returns a title as a string" do 
        diary_entry =  DiaryEntry.new('Title_test', 'Content')
        expect(diary_entry.title).to eq("Title_test")
      end
    end

    describe "#contents" do
      it "returns a contents as a string" do 
        diary_entry =  DiaryEntry.new('Title_test', 'Content_test')
        expect(diary_entry.contents).to eq("Content_test")
      end
    end

    it "takes 2 paramethers and returns a DiaryEntry obj" do 
      expect {DiaryEntry.new("Title") }.to raise_error ArgumentError
    end
  end

  describe "#count_words" do
    it "should return the number of words in the contents as an integer" do 
      diary_entry =  DiaryEntry.new('Title_test', 'Test_1 Test_2 Test_3 _Tes_4')
      count = diary_entry.count_words
      expect(count).to eq(4)
    end
  end

  describe "#reading_chunk" do
    it "should return the first chunk" do 
      diary_entry =  DiaryEntry.new('Test Chunks', 'A B C D E F G H I J')
      first_chunk = diary_entry.reading_chunk(2, 2)
      expect(first_chunk).to eq("A B C D")
    end

    it "should return the first and second chunks" do 
      diary_entry =  DiaryEntry.new('Test Chunks', 'A B C D E F G H I J')
      first_chunk = diary_entry.reading_chunk(2, 2)
      expect(first_chunk).to eq("A B C D")

      second_chunk = diary_entry.reading_chunk(2, 2)
      expect(second_chunk).to eq("E F G H")
    end

    it "should return the first, second and third chunk with remainder" do 
      diary_entry =  DiaryEntry.new('Test Chunks', 'A B C D E F G H I J')
      first_chunk = diary_entry.reading_chunk(2, 2)
      expect(first_chunk).to eq("A B C D")

      second_chunk = diary_entry.reading_chunk(2, 2)
      expect(second_chunk).to eq("E F G H")

      third_chunk = diary_entry.reading_chunk(2, 2)
      expect(third_chunk).to eq("I J")
    end

    it "should return the first, second and third chunk with remainder" do 
      diary_entry =  DiaryEntry.new('Test Chunks', 'A B C D')
      first_chunk = diary_entry.reading_chunk(1, 2)
      expect(first_chunk).to eq("A B")

      second_chunk = diary_entry.reading_chunk(1, 2)
      expect(second_chunk).to eq("C D")

      third_chunk = diary_entry.reading_chunk(1, 2)
      expect(third_chunk).to eq("You finished the reading")
    end

    it "should restart reading after it is finished" do 
      diary_entry =  DiaryEntry.new('Test Chunks', 'A B')
      first_chunk = diary_entry.reading_chunk(1, 2)
      expect(first_chunk).to eq("A B")

      third_chunk = diary_entry.reading_chunk(1, 2)
      expect(third_chunk).to eq("You finished the reading")

      second_chunk = diary_entry.reading_chunk(1, 2)
      expect(second_chunk).to eq("A B")
    end

  end
end