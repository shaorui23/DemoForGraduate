class RedisList < ActiveRecord::Base
  after_save :update_redis_value

  attr_accessible :name, :value

  def redis_key
    "redis_list:#{self.id}:#{self.name}"
  end

  def redis_value
    Redis.current.lrange(self.redis_key, 0, -1).join(",")
  end

  private
  def update_redis_value
    Redis.current.rpush(self.redis_key, self.value)
  end
end
