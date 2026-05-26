ASTRAL-Pro aanlyses with six set of locus sets, with progresssively more loci sampled. 

|                         | **L1**  | **L2**  | **L3**  | **L4**   | **L5**  | **L6**  |
| ----------------------- | ------- | ------- | ------- | -------- | ------- | ------- |
| **\# genes**            | 1,645   | 18,838  | 37,257  | 59,689   | 101,345 | 162,243 |
| **RF to previous tree** | \-      | 7 (1.25%) | 5 (0.9%) |  6 (1.2%) | 2 (0.4%) | 0 (0%)   |
| **RF to ROAIDES**       | 22 (3.9%) | 21 (3.7%) | 18 (3.2%) | 13 (2.3%)  | 13 (2.3%) | 13 (2.3%) |

The loci are based on the config file [seed_nodes_all_columns.tsv](seed_nodes_all_columns.tsv) and drawn in [seed_nodes.pdf](seed_nodes.pdf).

* **L1**: P1-P4: `VertebratesAnc0`,`JawlessFishesAnc0`,`PetromyzontidaeAnc0`,`VertebratesAnc1` ($+$ handful of other loci that included at least one jawless fish)
* **L2**: P1-P8: L1 $+$ `CartilaginousFishesAnc0`,
`VertebratesAnc2`,
`RayFinnedFishesAnc00` (2 rows)
* **L3**: P1-P15: L2 $+$ `VertebratesAnc3`,
`VertebratesAnc4`,
`AmphibiansAnc0`, 
`RayFinnedFishesAnc02`,
`AnuraAnc0`,
`RayFinnedFishesAnc03`,
`RayFinnedFishesAnc04`
* **L4**: P1-P20: L3 $+$ `RayFinnedFishesAnc64`,
`AnuraAnc1`, 
`GymnophionaAnc0`, 
`VertebratesAnc5`, 
`RayFinnedFishesAnc05` 
* **L5**: P1-P23: L4 $+$ subsample of ~10-15k of the largest loci sampled from each of `BirdsAnc0`
`SquamataAnc0`, 
`RayFinnedFishesAnc66`
* **L6**: P1-P23: L5 $+$ remaining loci sampled `BirdsAnc0`
`SquamataAnc0`, 
`RayFinnedFishesAnc66`
