def log_to(stream=$stdout)
  ActiveRecord::Base.logger = Logger.new(stream)
  ActiveRecord::Base.connection_pool.clear_reloadable_connections!
end

def trace(msg = "trace", log = false)
  start = Time.now
  result = yield
ensure
  diff = Time.now - start
  str = "%s: %f" % [msg, diff]
  ActiveRecord::Base.logger.info( str ) if log
  puts str
  return [result, diff]
end