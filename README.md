## conclusion

1. Fiber比Multi-thread可以节省很多CPU调度开销，running状态的thread/fiber越多，Fiber的性能优势越明显
2. Multi-thread如果并发线程不是很高的情况下，性能也不错，和Fiber的差距不明显，而且驱动，库和代码兼容性相比Fiber更容易处理
3. 在这个简单测试当中，Sinatra和Grape同样跑多线程，性能差异非常小

## recommendation

1. 对IO并发不是非常高的场景下，推荐用多线程跑sinatra/grape，性能相当好
2. 对IO并发要求很高的场景下，推荐用fier跑sinatra/grape，相比多线程，CPU消耗有明显下降
3. Sinatra和Grape没有太大性能差异，Sinatra内置模版功能，Grape的API功能很强大，如果需要用到模版渲染，建议使用Sinatra；如果是纯json/xml API，推荐Grape
4. 多线程服务器，推荐使用Rainbows
5. 用Grape跑Fiber，推荐Goliath；用Sinatra跑Fiber，推荐Thin
6. Sinatra Fiber运行在Thin上面，似乎比 Grape on Goliath性能略好一点

---

一些测试数据没有更新和补充，建议看上面的结论。或者自行测试。

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
CPU: 11-12%(iMac)  
Memory: 67MB  
Throughput: 58.46 60.51 57.40

#### Sinatra on Thin
CPU: 9-11%(iMac)  
Memory: 64MB  
Throughput: 62.44 57.52 63.50

## siege -c50 -r100 http://localhost:9000/v1/posts/1

#### Grape on Goliath
CPU: 15%(iMac)  
Memory: 70MB  
Throughput: 63.78 60.83 60.70  

#### Grape on Rainbows
CPU: 18%(iMac)  
Memory: 75MB  
Throughput: 64.84 60.54 58.53
  
#### Sinatra on Rainbows
CPU:  18-20%(iMac)  
Memory: 70MB  
Throughput: 61.56 60.43 60.41

#### Sinatra on Thin
CPU:  13-15%(iMac)  
Memory: 66MB  
Throughput: 62.78 62.69 60.47 

## siege -c100 -r100 http://localhost:9000/v1/posts/1

#### Grape on Goliath
CPU: 33-37%(MacBookPro) 30%(iMac)  
Memory: 70MB  
Throughput: 62.09 63.87 62.08  

#### Grape on Rainbows
CPU: 38%(iMac)  
Memory: 75MB  
Throughput: 62.09 63.87 62.08  

#### Sinatra on Rainbows
CPU:   38%(iMac)  
Memory: 72MB  
Throughput: 62.85 65.91 59.92

#### Sinatra on Thin
CPU:  27-30%(iMac)  
Memory: 67MB  
Throughput:  60.84 61.85 62.84

## siege -c200 -r100 http://localhost:9000/v1/posts/1

#### Grape on Goliath
CPU: 60-70%(MacBookPro) 55-60%(iMac)  
Memory: 70MB  
Throughput: 65.62 67.12 68.67  

#### Grape on Rainbows
CPU:  75-79%(iMac)  
Memory: 77MB  
Throughput: 65.62 67.12 68.67  

#### Sinatra on Rainbows
CPU:  75-81%(iMac)  
Memory: 73MB  
Throughput:  61.80 66.50 65.74

#### Sinatra on Thin
CPU:  53-57%(iMac)  
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