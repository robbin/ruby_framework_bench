# rainbows config
worker_processes 1
Rainbows! do
  use :ThreadPool
  # use :ThreadSpawn
  worker_connections 200
end