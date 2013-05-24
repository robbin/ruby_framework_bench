## siege -c30 -r100 http://localhost:9000/v1/posts/1

#### Grape on Goliath
CPU: 12-14%(MacBookPro)  9%(iMac)  
Memory: 70MB  
Throughput: 64.84 60.54 58.53  

#### Grape on Rainbows
CPU: 12-14%(MacBookPro)  11%(iMac)  
Memory: 75MB  
Throughput: 64.84 60.54 58.53  

#### Sinatra on Rainbows
CPU: 12-14%(MacBookPro)  11-12%(iMac)  
Memory: 67MB  
Throughput: 58.46 60.51 57.40

#### Sinatra on Thin
CPU: 12-14%(MacBookPro)  9-11%(iMac)  
Memory: 64MB  
Throughput: 62.44 57.52 63.50

## siege -c50 -r100 http://localhost:9000/v1/posts/1

#### Grape on Goliath
CPU: 20-21%(MacBookPro) 15%(iMac)  
Memory: 70MB  
Throughput: 63.78 60.83 60.70  

#### Grape on Rainbows
CPU: 20-21%(MacBookPro)  18%(iMac)  
Memory: 75MB  
Throughput: 64.84 60.54 58.53
  
#### Sinatra on Rainbows
CPU: 12-14%(MacBookPro)  18-20%(iMac)  
Memory: 70MB  
Throughput: 61.56 60.43 60.41

#### Sinatra on Thin
CPU: 12-14%(MacBookPro)  13-15%(iMac)  
Memory: 66MB  
Throughput: 62.78 62.69 60.47 

## siege -c100 -r100 http://localhost:9000/v1/posts/1

#### Grape on Goliath
CPU: 33-37%(MacBookPro) 30%(iMac)  
Memory: 70MB  
Throughput: 62.09 63.87 62.08  

#### Grape on Rainbows
CPU: 33-37%(MacBookPro) 38%(iMac)  
Memory: 75MB  
Throughput: 62.09 63.87 62.08  

#### Sinatra on Rainbows
CPU: 12-14%(MacBookPro)  38%(iMac)  
Memory: 72MB  
Throughput: 62.85 65.91 59.92

#### Sinatra on Thin
CPU: 12-14%(MacBookPro)  27-30%(iMac)  
Memory: 67MB  
Throughput:  60.84 61.85 62.84

## siege -c200 -r100 http://localhost:9000/v1/posts/1

#### Grape on Goliath
CPU: 60-70%(MacBookPro) 55-60%(iMac)  
Memory: 70MB  
Throughput: 65.62 67.12 68.67  

#### Grape on Rainbows
CPU: 60-70%(MacBookPro) 75-79%(iMac)  
Memory: 77MB  
Throughput: 65.62 67.12 68.67  

#### Sinatra on Rainbows
CPU: 12-14%(MacBookPro)  75-81%(iMac)  
Memory: 73MB  
Throughput:  61.80 66.50 65.74

#### Sinatra on Thin
CPU: 12-14%(MacBookPro)  53-57%(iMac)  
Memory: 70MB  
Throughput: 68.92 62.83 65.08

---

wait 0.5s in database.

#### Sinatra on Thin
c30 61MB 5-6% 55s  
c50 63MB 8-10% 58s  
c100 65MB 16-18% 58s  
c200 69MB 32-34% 61s  

#### Goliath Fiber Spawn
c30 63MB 5-6% 57s  
c50 64MB 9-10% 57s  
c100 67MB 18-20% 58s  
c200 77MB 35-40% 58s  

#### Rainbows Thread Spawn
c30 61MB 5-7% 55s  
c50 62MB 9-11% 56s  
c100 63MB 20-22% 58s  
c200 67MB 44-47% 62s  

#### Rainbows Thread Pool Grape
c30 67MB 5-8% 56s  
c50 69MB 9-12% 58s  
c100 71MB 20-22% 59s  
c200 72MB 44-45% 59.83s  

#### Rainbows Thread Pool Sinatra
c30 72MB 5-7% 56s  
c50 73MB 9-11% 58s  
c100 74MB 19-21% 58s  
c200 74MB 40-45% 58s  

结论：

1. spawn比pool节省一些内存
2. 并发不太高的情况下，spawn和pool没有明显性能差异，spawn可能稍快
3. 当并发很高的情况下，pool的性能会超过spawn，CPU消耗降低
4. fiber在低并发情况下，没有明显性能优势，在高并发下，CPU消耗明显比较低，更适合很高的并发场景