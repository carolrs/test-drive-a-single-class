class GrammarStats
  def initialize
    @text_passed = 0
    @num_texts_checked = 0
  end

  def check(text) 
    first_letter, last_letter = text[0], text[-1]
    ponctuation = ['!', '?', '.']
    
    result = first_letter == first_letter[0].upcase && 
           ponctuation.include?(last_letter)

    if result
      @text_passed+=1
    end
    @num_texts_checked+=1
    return result

  end

  def percentage_good
    if @num_texts_checked == 0
      return 0
    end
    ((@text_passed * 100) / @num_texts_checked.to_f).round
    
    # Returns as an integer the percentage of texts checked so far that passed
    # the check  defined in the `check` method. The number 55 represents 55%.
  end
end