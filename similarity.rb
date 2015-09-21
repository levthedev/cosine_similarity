require 'matrix'

class String
  def compare(string)
    if string.split.size == 1 && self.split.size == 1
      compare_chars(string)
    else
      compare_string(string)
    end
  end

  def compare_string(string)
    original_words = self.split(" ")
    compared_words = string.split(" ")
    create_sentence_dict(original_words, compared_words)
  end

  def create_sentence_dict(original_words, compared_words)
    all_words     = (original_words + compared_words).uniq
    original_dict, compared_dict = Hash.new(0), Hash.new(0)
    all_words.each do |word|
      original_dict[word] += original_words.count(word)
      compared_dict[word] += compared_words.count(word)
    end
    create_vectors(original_dict, compared_dict)
  end

  def create_vectors(original_dict, compared_dict)
    a = Vector.elements(original_dict.values)
    b = Vector.elements(compared_dict.values)
    cosine_similarity = a.dot(b)/(a.magnitude * b.magnitude)
  end

  def compare_chars(string)
    original_chars = self.chars
    compared_chars = string.chars
    all_chars      = (original_chars + compared_chars).uniq
    create_char_dict(original_chars, compared_chars)
  end

  def create_char_dict(original_chars, compared_chars)
    original_dict, compared_dict = Hash.new(0), Hash.new(0)
    all_chars      = (original_chars + compared_chars).uniq
    all_chars.each do |word|
      original_dict[word] += original_chars.count(word)
      compared_dict[word] += compared_chars.count(word)
    end
    create_vectors(original_dict, compared_dict)
  end
end

puts "He is the hero Gotham deserves".compare("but not the one it needs right now")
puts "rob".compare("bob")
