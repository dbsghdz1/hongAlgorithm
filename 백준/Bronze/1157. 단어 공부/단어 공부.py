word = input().upper()

count = {}

for c in word:
    count[c] = count.get(c, 0) + 1
max_count = max(count.values())

result = [k for k, v in count.items() if v == max_count]

if len(result) > 1:
    print("?")
else:
    print(result[0])


