class Article < ActiveRecord::Base
  def articles
    b = $redis.smembers("article#{self.id}")
    Article.where :id => b
  end

  def addarticle(article)
    $redis.sadd("articles:#{self.id}",article.id)
  end

  def delarticle(article)
    $redis.srem("articles:#{self.id}",article.id)
  end

  def common(user)
    c = $redis.sinter("articles:#{self.id}", "articles:{user.id}")
    Article.where :id => c
  end

end
