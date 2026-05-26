Obtaining occupancy:
~~~bash
for l in l1 l2 l3 l4 l5 l6; do 
x=astralinput.$l.trees 
cat $x |xargs -I{} sh -c "echo '{}'|nw_labels -I -|sort|uniq -c"|awk '{print ($1,$2)}'|awk '{ lines[$1][$2] = lines[$1][$2]+1} END {  for (i=1; i<=500; i++) for (key in lines[i]) printf "%d %s %d\n", lines[i][key], key, i }'|sort -k2 -k3n|tee occupancy.$x.txt
done
~~~

Drawing is done using `occupancy.r`
