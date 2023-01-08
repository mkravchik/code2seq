f = open("../cppminer/out_fixed_func_name/data/dataset/dataset.train.c2s")
l_idx = 1
for l in f:
    parts = l.split()
    print (f'{l_idx}, {len(parts) - 1} paths')
    bad = False
    for part in parts[1:]:
        ctx = part.split(",")
        if(len(ctx) != 3):
            print("Bad context", part)
            bad = True
    if bad:
        print(l)

    l_idx += 1
