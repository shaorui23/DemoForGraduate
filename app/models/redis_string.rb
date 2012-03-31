class RedisString < ActiveRecord::Base
  after_save :update_redis_value

  attr_accessible :name, :value

  def redis_key
    "redis_string:#{self.id}:#{self.name}"
  end

  def redis_value
    Redis.current.get(self.redis_key)
  end

  private
  def update_redis_value
    Redis.current.set(self.redis_key, self.value)
  end
  
end
