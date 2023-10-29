class String
  def levenshtein(str)
    return nil if (str.strip.empty? or self.strip.empty?)

    costs = Array(0..str.length)

    (1..self.length).each do |i|
      costs[0], nw = i, i - 1
      (1..str.length).each do |j|
        costs[j], nw = [costs[j] + 1, costs[j-1] + 1, self[i-1] == str[j-1] ? nw : nw + 1].min, costs[j]
        p costs
      end
    end

    costs[str.length]
  end
end

p 'CUGAUGUGA'.levenshtein('AUGGAA')