module DatalogParser
  module QUERY
    GRAMMAR = [
               [:prime, [[:nt, :Goal]]],
               [:Goal, [[:nt, :MFAs], [:t, 5]]],
               [:MFAs, [[:nt, :MFAs], [:t, 4], [:nt, :MFA]]],
               [:MFAs, [[:nt, :MFA]]],
               [:MFA, [[:t, 9], [:t, 3], [:nt, :FA]]],
               [:MFA, [[:nt, :FA]]],
               [:FA, [[:t, 9], [:t, 6], [:nt, :Ts], [:t, 7]]],
               [:Ts, [[:nt, :Ts], [:t, 4], [:nt, :T]]],
               [:Ts, [[:nt, :T]]],
               [:T, [[:t, 2]]],
               [:T, [[:t, 8]]],
               [:T, [[:t, 9]]],
               [:T, [[:t, 10]]]]

    ACTIONS = [
               {9 => [:shift, 4]},
               {:eof => [:reduce, 0]},
               {5 => [:shift, 6], 4 => [:shift, 7]},
               {5 => [:reduce, 3], 4 => [:reduce, 3]},
               {3 => [:shift, 8], 6 => [:shift, 9]},
               {5 => [:reduce, 5], 4 => [:reduce, 5]},
               {:eof => [:reduce, 1]},
               {9 => [:shift, 4]},
               {9 => [:shift, 12]},
               {2 => [:shift, 15], 8 => [:shift, 16], 9 => [:shift, 17], 10 => [:shift, 18]},
               {5 => [:reduce, 2], 4 => [:reduce, 2]},
               {5 => [:reduce, 4], 4 => [:reduce, 4]},
               {6 => [:shift, 9]},
               {7 => [:shift, 19], 4 => [:shift, 20]},
               {7 => [:reduce, 8], 4 => [:reduce, 8]},
               {7 => [:reduce, 9], 4 => [:reduce, 9]},
               {7 => [:reduce, 10], 4 => [:reduce, 10]},
               {7 => [:reduce, 11], 4 => [:reduce, 11]},
               {7 => [:reduce, 12], 4 => [:reduce, 12]},
               {5 => [:reduce, 6], 4 => [:reduce, 6]},
               {2 => [:shift, 15], 8 => [:shift, 16], 9 => [:shift, 17], 10 => [:shift, 18]},
               {7 => [:reduce, 7], 4 => [:reduce, 7]}]

    GOTOS = [
             {:Goal => [:goto, 1], :MFAs => [:goto, 2], :MFA => [:goto, 3], :FA => [:goto, 5]},
             {},
             {},
             {},
             {},
             {},
             {},
             {:MFA => [:goto, 10], :FA => [:goto, 5]},
             {:FA => [:goto, 11]},
             {:Ts => [:goto, 13], :T => [:goto, 14]},
             {},
             {},
             {},
             {},
             {},
             {},
             {},
             {},
             {},
             {},
             {:T => [:goto, 21]},
             {}]
  end

  module CLAUSES
    ACTIONS = [
               {9 => [:shift, 4]},
               {9 => [:shift, 4], :eof => [:reduce, 0]},
               {:eof => [:reduce, 2]},
               {5 => [:shift, 6], 3 => [:shift, 7]},
               {6 => [:shift, 8]},
               {:eof => [:reduce, 1]},
               {:eof => [:reduce, 3]},
               {9 => [:shift, 11]},
               {2 => [:shift, 15], 8 => [:shift, 16], 9 => [:shift, 17], 10 => [:shift, 18]},
               {5 => [:shift, 19], 4 => [:shift, 20]},
               {5 => [:reduce, 6], 4 => [:reduce, 6]},
               {3 => [:shift, 21], 6 => [:shift, 8]},
               {5 => [:reduce, 8], 4 => [:reduce, 8]},
               {7 => [:shift, 22], 4 => [:shift, 23]},
               {7 => [:reduce, 11], 4 => [:reduce, 11]},
               {7 => [:reduce, 12], 4 => [:reduce, 12]},
               {7 => [:reduce, 13], 4 => [:reduce, 13]},
               {7 => [:reduce, 14], 4 => [:reduce, 14]},
               {7 => [:reduce, 15], 4 => [:reduce, 15]},
               {:eof => [:reduce, 4]},
               {9 => [:shift, 11]},
               {9 => [:shift, 4]},
               {5 => [:reduce, 9], 3 => [:reduce, 9], 5 => [:reduce, 9], 4 => [:reduce, 9]},
               {2 => [:shift, 15], 8 => [:shift, 16], 9 => [:shift, 17], 10 => [:shift, 18]},
               {5 => [:reduce, 5], 4 => [:reduce, 5]},
               {5 => [:reduce, 7], 4 => [:reduce, 7]},
               {7 => [:reduce, 10], 4 => [:reduce, 10]}]

    GOTOS = [
             {:Clauses => [:goto, 1], :Clause => [:goto, 2], :FA => [:goto, 3]},
             {:Clause => [:goto, 5], :FA => [:goto, 3]},
             {},
             {},
             {},
             {},
             {},
             {:MFAs => [:goto, 9], :MFA => [:goto, 10], :FA => [:goto, 12]},
             {:Ts => [:goto, 13], :T => [:goto, 14]},
             {},
             {},
             {},
             {},
             {},
             {},
             {},
             {},
             {},
             {},
             {},
             {:MFA => [:goto, 24], :FA => [:goto, 12]},
             {:FA => [:goto, 25]},
             {},
             {:T => [:goto, 26]},
             {},
             {},
             {}]

    GRAMMAR = [
               [:prime, [[:nt, :Clauses]]],
               [:Clauses, [[:nt, :Clauses], [:nt, :Clause]]],
               [:Clauses, [[:nt, :Clause]]],
               [:Clause, [[:nt, :FA], [:t, 5]]],
               [:Clause, [[:nt, :FA], [:t, 3], [:nt, :MFAs], [:t, 5]]],
               [:MFAs, [[:nt, :MFAs], [:t, 4], [:nt, :MFA]]],
               [:MFAs, [[:nt, :MFA]]],
               [:MFA, [[:t, 9], [:t, 3], [:nt, :FA]]],
               [:MFA, [[:nt, :FA]]],
               [:FA, [[:t, 9], [:t, 6], [:nt, :Ts], [:t, 7]]],
               [:Ts, [[:nt, :Ts], [:t, 4], [:nt, :T]]],
               [:Ts, [[:nt, :T]]],
               [:T, [[:t, 2]]],
               [:T, [[:t, 8]]],
               [:T, [[:t, 9]]],
               [:T, [[:t, 10]]]]

  end

  module_function

  def parse(tokens, mode)
    stack = [[0, nil]]
    token = tokens[0]
    tokens = tokens[1..-1]

    while true do
      state = stack[-1][0]
      action = mode::ACTIONS[state][token[0]]

      if action[0] == :shift then
        stack << [action[1], token[1..-1]]
        token, tokens = tokens[0], tokens[1..-1]
      elsif action[0] == :reduce then
        rule_num = action[1]
        name, prod = mode::GRAMMAR[rule_num]
        found = stack.pop(prod.length)

        if rule_num == 0 then
          return found[0][1]
        end

        next_state = mode::GOTOS[stack[-1][0]][name][1]

        stack << [next_state, [rule_num, found.map {|_,s| s} ]]
      end

    end

  end

  def parse_query(tokens)
    parse(tokens, QUERY)
  end

  def parse_clauses(tokens)
    parse(tokens, CLAUSES)
  end

end
