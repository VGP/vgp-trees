### Locus selection
* The loci are based on the seed file [seed_nodes_all_columns.tsv](seed_nodes_all_columns.tsv) as drawn in [seed_nodes.pdf](seed_nodes.pdf), and config file [config.yaml](config.yaml). Node names are with respect to <./vgp-577way-v1.nwk.rformat> and hal file is at <https://genomeark.s3.amazonaws.com/index.html?prefix=downstream_analyses/genome_alignments/cactus/577way/>.
* Annotations of CDS were masked based on these [annotation files](newannotationshared.txt).
* See <lociperseed.tsv> for how many loci were sampled from each seed node. 

~~~bash
 python ~/workspace/vgp-phyloscripts/alignmentproc/hal_multicopy_phyloloci.py combinedpass --resume --resume-require-compatible --resume-from-outdir ./fourthcompleterun --config ./config.yaml 
~~~

* The script *will be* made available (soon) at <https://github.com/VGP/vgp-phyloscripts>. We used version `0.1.59-dev-2026-05-18`.

### ASTRAL-Pro tere stats

ASTRAL-Pro analyses with six set of loci, with progresssively more loci sampled from the HAL file: 


|                         | **L1**  | **L2**  | **L3**  | **L4**   | **L5**  | **L6**  |
| ----------------------- | ------- | ------- | ------- | -------- | ------- | ------- |
| **\# genes**            | 1610   | 18,838  | 37,257  | 59,689   | 101,345 | 162,243 |
| **Difference to previous tree (edges)** | \-      | 11 (2.0%) | 5 (0.9%) |  6 (1.2%) | 2 (0.4%) | 0 (0%)   |
| **Difference to ROAIDES (edges)**       | 25 (4.5%) | 21 (3.7%) | 18 (3.2%) | 13 (2.3%)  | 13 (2.3%) | 13 (2.3%) |

* **L1**: P1-P4: `VertebratesAnc0`,`JawlessFishesAnc0`,`PetromyzontidaeAnc0`,`VertebratesAnc1` 
* **L2**: P1-P8: L1 $+$ `CartilaginousFishesAnc0`, `VertebratesAnc2`, `RayFinnedFishesAnc00` (2 rows)
* **L3**: P1-P15: L2 $+$ `VertebratesAnc3`, `VertebratesAnc4`, `AmphibiansAnc0`,  `RayFinnedFishesAnc02`, `AnuraAnc0`, `RayFinnedFishesAnc03`, `RayFinnedFishesAnc04`
* **L4**: P1-P20: L3 $+$ `RayFinnedFishesAnc64`, `AnuraAnc1`,  `GymnophionaAnc0`,  `VertebratesAnc5`,  `RayFinnedFishesAnc05` 
* **L5**: P1-P23: L4 $+$ subsample of ~10-15k of the largest loci sampled from each of `BirdsAnc0` `SquamataAnc0`,  `RayFinnedFishesAnc66`
* **L6**: P1-P23: L5 $+$ remaining loci sampled `BirdsAnc0` `SquamataAnc0`,  `RayFinnedFishesAnc66`

* Compare Trees: 
    * Use [compareTrees](https://github.com/smirarab/global/blob/master/src/shell/compareTrees) to compare trees to ROADIES, ignoring invertebrates (`ignore.txt`) and any oddities of names. 
    ~~~bash
    for x in `find . -name "*astralpro*tre"|grep -v log`; do compareTrees <(nw_prune ./vgp-577way-v1.nwk.rformat $(sed -e "s:\..*::" ignore.txt|tr '\n' ' ' ))  <(nw_rename -l $x mapnames) -simplify 2>/dev/null |cut -f3,2|awk '{if ($2=="") print($1)}'|sed -e "s:^:$x\t:" ; done  |tee compare.txt
   join <(find . -name "*astralpro*"|grep log|xargs grep Genetrees|sed -e "s/.log.*es:/.tre/" |tr " " "\t")  <(find . -name "*astralpro*"|grep log|xargs grep Species|sed -e "s/.log.*es:/.tre/" |tr " " "\t") |tee comparegt.txt
   for x in `find . -name "*astralpro*tre*"|grep -v log`; do compareTrees.missingBranch <(nw_prune ./vgp-577way-v1.nwk.rformat $(sed -e "s:\..*::" ignore.txt|tr '\n' ' ' ))  <(nw_rename -l $x mapnames) -simplify |sed -e "s:^:$x\t:" ; done  |tee compareRF.txt
   ~~~
  
