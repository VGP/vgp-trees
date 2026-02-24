 grep Anura ../annotations.tsv |cut -f1,3 > 18way.txt
 grep Caudata ../annotations.tsv |cut -f1,3 >> 18way.txt
 grep Gymnophiona ../annotations.tsv |cut -f1,3 >> 18way.txt
 grep -E "Columbea|Core landbirds|Caprimulgimorphae|Core waterbirds|Otidimorphae" ../annotations.tsv |cut -f1|sed -e "s/$/\tNeoaves/" >> 18way.txt
 grep GalloAnserformes ../annotations.tsv |cut -f1,3 >> 18way.txt
 grep Palaeognathae ../annotations.tsv |cut -f1,3 >> 18way.txt
 grep -E "Laurasiatheria|Afrotheria|Xenarthra|Supraprimates..Euarchontoglires" ../annotations.tsv |cut -f1|sed -e "s/$/\tPlacental/" >>18way.txt
 grep Marsupials ../annotations.tsv |cut -f1,3 >> 18way.txt
 grep Monotremes ../annotations.tsv |cut -f1,3 >> 18way.txt
 grep Crocodylia ../annotations.tsv |cut -f1,3 >> 18way.txt
 grep Squamata ../annotations.tsv |cut -f1,3 >> 18way.txt
 grep Testudines ../annotations.tsv|cut -f1,3|sed -e "s/ .*//g" >> 18way.txt
 grep "Agnatha (Jawless Fishes)" ../annotations.tsv|sed -e "s/ .*//g" |cut -f1,3 >> 18way.txt
 grep "Chondrichthyes" ../annotations.tsv|sed -e "s/ .*//g" |cut -f1,3 |sed -e "s/ .*//g" >> 18way.txt
 grep "Sarcopterygii" ../annotations.tsv|sed -e "s/ .*//g" |cut -f1,3 |sed -e "s/ .*//g" >> 18way.txt
 nw_clade ../roadies_v1.1.16b.nwk `grep Argentiniformes ../annotations.tsv|cut -f1|head -n1` `grep Galaxiiformes ../annotations.tsv|cut -f1|head -n1`|nw_labels -I -|sed -e "s/$/\tEuteleosts/" >>18way.txt
 nw_clade ../roadies_v1.1.16b.nwk `grep Cypriniformes ../annotations.tsv|cut -f1|head -n1` `grep Clupeiformes ../annotations.tsv|cut -f1|head -n1`|nw_labels -I -|sed -e "s/$/\tOtomorpha/"  >> 18way.txt
 diff <( grep Actinopterygii ../annotations.tsv|cut -f1 |sort)  <(nw_clade ../roadies_v1.1.16b.nwk `grep Argentiniformes ../annotations.tsv|cut -f1|head -n1` `grep Clupeiformes ../annotations.tsv|cut -f1|head -n1`|nw_labels -I -|sort)|grep GC|cut -f2 -d' '|sed -e "s/$/\tNon-telost-Actinopterygii/" >> 18way.txt
paste  <(sort -k1 18way.txt) <( grep -v nvert ../annotations.tsv|sort -k1 ) |cut -f1,2,4-16|sort -k2|sort -k3 > middlegroupannotation.tsv
# Manually fix posiiton of header


cut -f2 18way.txt|sort |uniq -c
'''
   3 Agnatha
  24 Anura
   5 Caudata
  16 Chondrichthyes
   2 Crocodylia
 120 Euteleosts
  19 GalloAnserformes
   3 Gymnophiona
  10 Marsupials
   2 Monotremes
 113 Neoaves
   8 Non-telost-Actinopterygii
  29 Otomorpha
   5 Palaeognathae
 154 Placental
   2 Sarcopterygii
  36 Squamata
  17 Testudines
'''
