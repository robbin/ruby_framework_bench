## siege -c30 -r100 http://localhost:9000/v1/posts/1

#### Grape on Goliath
CPU: 12-14%(MacBookPro)  9%(iMac)
Memory: 70MB
Throughput: 64.84 60.54 58.53

#### Grape on Rainbows
CPU: 12-14%(MacBookPro)  11%(iMac)
Memory: 75MB
Throughput: 64.84 60.54 58.53

## siege -c50 -r100 http://localhost:9000/v1/posts/1

#### Grape on Goliath
CPU: 20-21%(MacBookPro) 15%(iMac)
Memory: 70MB
Throughput: 63.78 60.83 60.70

#### Grape on Rainbows
CPU: 20-21%(MacBookPro)  18%(iMac)
Memory: 75MB
Throughput: 64.84 60.54 58.53

## siege -c64 -r100 http://localhost:9000/v1/posts/1

#### Grape on Goliath
CPU: 24-26%(MacBookPro) 18-20%(iMac)
Memory: 70MB
Throughput: 63.78 60.83 60.70

#### Grape on Rainbows
CPU: 24-26%(MacBookPro)  22-24%(iMac)
Memory: 75MB
Throughput: 64.84 60.54 58.53

## siege -c100 -r100 http://localhost:9000/v1/posts/1

#### Grape on Goliath
CPU: 33-37%(MacBookPro) 30%(iMac)
Memory: 70MB
Throughput: 62.09 63.87 62.08

#### Grape on Rainbows
CPU: 33-37%(MacBookPro) 38%(iMac)
Memory: 75MB
Throughput: 62.09 63.87 62.08

## siege -c200 -r100 http://localhost:9000/v1/posts/1

#### Grape on Goliath
CPU: 60-70%(MacBookPro) 55-60%(iMac)
Memory: 70MB
Throughput: 65.62 67.12 68.67

#### Grape on Rainbows
CPU: 60-70%(MacBookPro) 75-79%(iMac)
Memory: 77MB
Throughput: 65.62 67.12 68.67
