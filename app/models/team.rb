class Team < ActiveRecord::Base
 #include Redis::Objects

 #lock :trade_players, :expiration => 15  # sec
 #counter :hits
 #counter :runs
 #counter :outs
 #counter :inning, :start => 1
 #list :on_base
 #set :outfielders
 #value :at_bat
 #sorted_set :rank, :global => true
 #hash_key :pitchers_faced  # "hash" is taken by Ruby

 #after_destroy :delete_redis_keys
  attr_accessible :redis_on_base, :redis_outfielders

 #def before_create
 #  self.on_base ||= "" 
 #  self.outfielders ||= ""
 #end

  def redis_on_base
    on_base
  end

  def redis_on_base=(value)
    on_base.push value
  end

  def redis_outfielders
    outfielders
  end

  def redis_outfielders=(value)
    outfielders.add value
  end

  private

  def delete_redis_keys
    self.class.redis_objects.each do |key,opts|
      k = redis_field_key(key)
      redis.del(k)
    end
  end
end
