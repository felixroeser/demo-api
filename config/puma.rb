threads_count = Integer(ENV['MAX_THREADS'] || 3)
threads threads_count, threads_count
workers (ENV['WEB_CONCURRENCY'] || 2).to_i

port (ENV['PORT'] || 3000).to_i
environment ENV['RACK_ENV'] || 'development'

preload_app!
