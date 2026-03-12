import sys

input = sys.stdin.readline

n = int(input())
arr = [int(input()) for _ in range(n)]

arr.sort()

print("\n".join(map(str, arr)))