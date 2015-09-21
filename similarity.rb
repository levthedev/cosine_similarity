class String
  def compare(string)
    original_words = self.split(" ")                         # => ["He", "is", "the", "hero", "Gotham", "deserves"]
    compared_words = string.split(" ")                       # => ["but", "not", "the", "one", "it", "needs", "right", "now"]
    @all_words     = (original_words + compared_words).uniq  # => ["He", "is", "the", "hero", "Gotham", "deserves", "but", "not", "one", "it", "needs", "right", "now"]

    create_dict(original_words, compared_words)  # => ["He", "is", "the", "hero", "Gotham", "deserves", "but", "not", "one", "it", "needs", "right", "now"]
  end

  def create_dict(original_words, compared_words)
    original_dict, compared_dict = Hash.new(0), Hash.new(0)  # => [{}, {}]
    @all_words.each do |word|                                # => ["He", "is", "the", "hero", "Gotham", "deserves", "but", "not", "one", "it", "needs", "right", "now"]
      original_dict[word] += original_words.count(word)      # => 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0
      compared_dict[word] += compared_words.count(word)      # => 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1
    end                                                      # => ["He", "is", "the", "hero", "Gotham", "deserves", "but", "not", "one", "it", "needs", "right", "now"]
  end
end

print "He is the hero Gotham deserves".compare("but not the one it needs right now")  # => nil

# >> ["He", "is", "the", "hero", "Gotham", "deserves", "but", "not", "one", "it", "needs", "right", "now"]
