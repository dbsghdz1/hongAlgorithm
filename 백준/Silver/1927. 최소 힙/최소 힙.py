import heapq
import sys
input = sys.stdin.readline

heap = []
c = int(input())

for _ in range(c):
    n = int(input())
    if n == 0:
        if not heap:
            print(0)
        else:
            print(heapq.heappop(heap))
    else:
        heapq.heappush(heap, n)
    
