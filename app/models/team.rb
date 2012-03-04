class Team < ActiveRecord::Base
  include Redis::Objects

  lock :trade_players, :expiration => 15  # sec
  counter :hits
  counter :runs
  counter :outs
  counter :inning, :start => 1
  list :on_base
  set :outfielders
  value :at_bat
  sorted_set :rank, :global => true
  hash_key :pitchers_faced  # "hash" is taken by Ruby
end
