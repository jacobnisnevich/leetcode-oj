###########################################################
#### 3. Longest Substring Without Repeating Characters ####
###########################################################

# Given a string, find the length of the longest substring without repeating characters. 
# For example, the longest substring without repeating letters for "abcabcbb" is "abc", 
# which the length is 3. For "bbbbb" the longest substring is "b", with the length of 1.


# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  current_longest_substr = ""
  current_longest_substr_length = 0
  current_starting_index = 0
  max_substr_length = 0

  last_seen_letters = {}

  for i in 0..(s.length - 1)
    if i == 0
      current_longest_substr = s[i]
      current_longest_substr_length = 1
      max_substr_length = 1
    else
      index_of_lastchar = last_seen_letters[s[i]]

      if !index_of_lastchar.nil?
        if index_of_lastchar >= current_starting_index
          current_longest_substr = s[(index_of_lastchar + 1)..i]
          current_starting_index = index_of_lastchar + 1
          current_longest_substr_length = i - index_of_lastchar
        else
          current_longest_substr = current_longest_substr + s[i]
          current_longest_substr_length += 1         
        end
      else
        current_longest_substr = current_longest_substr + s[i]
        current_longest_substr_length += 1
      end

      max_substr_length = [max_substr_length, current_longest_substr_length].max
    end

    last_seen_letters[s[i]] = i
  end

  return max_substr_length
end


# Test Cases

p length_of_longest_substring("abcabcbb")       # 3 - "abc"
p length_of_longest_substring("bbbbb")          # 1 - "b"
p length_of_longest_substring("acersabertfbl")  # 7 - "sabertf"
p length_of_longest_substring("ababababab")     # 2 - "ab"
p length_of_longest_substring("tmmzuxt")        # 5 - "mzuxt"
