### Final attempt: <./roadies_v1.1.16b.nwk>

This is the final tree. It's a results of a contrained search, with a constrained tree, given in <./start.tre>. The start tree forced some resolutions that the unconstrained tree was getting wrong. 

MORE DETAILS TO FOLLOW. 

### Previous attempt: `roadies_v1.1.nwk` and `roadies_v1.1.4.nwk`
* Files:
	* `roadies_v1.1.4.nwk` is the inferred tree in Newick with improved branch lengths due to correct rooting before branch length estimation
	* `roadies_v1.1.nwk` is the inferred tree in Newick with no edits
	* `roadies_v1.1.rerooted.nwk` is the inferred tree in Newick, rerooted at Jawless fishes
	* `roadies_v1.1.tre` is Nexus file with rooting and all sorts of other annotations, suitable for FigTree and perhaps other tree viewing software. 
* Tree inferred using ROADIES from 85,375 gene trees. These include:
	- 29,239 gene trees are from the ROADIES run with random sampling (no restriction) from the entire 581-species dataset. Each of the gene trees has a minimum of 58 unique species. 
	- 54,288 gene trees are from the ROADIES run with random sampling from 139 species (137 birds + 2 crocodiles as outgroups) out of the large 581-species dataset. Each of the gene trees has a minimum of 4 unique species.
	- 1,848 gene trees are from shark-focused ROADIES run with the entire 581-species dataset, where gene sampling was 1/3 for sharks, fishes, and the rest of the other species. Each of the gene trees has a minimum of 58 unique species.
* Invertebrates were included in the run but were misplaced. We removed them from the final ASTRAL-Pro species tree. 
* We manually rooted the tree on the branch separating jawless fishes from the rest 
	```
	nw_reroot roadies_v1.1.nwk GCA_048934315.1 GCA_964187855.1 GCA_964198595.1 > roadies_v1.1.rerooted.nwk
	```
* Support values on the species tree are between 0 and 1. Above 0.95 is traditionally considered high. Below 0.8 is considered low. 
* Branch lengths are in units of the expected number of substitutions per site. 
	* If the branch lengths matter to you, note that the branch of the root branch and perhaps one or two adjacent ones cannot be taken at face value in `roadies_v1.1.nwk`. The root branch is arbitrarily rooted at the middle point. And CASTLES-Pro needs to be rerun to get the current length on that branch anyway. We will fix this and release a new version. 
	* In `roadies_v1.1.4.nwk`, branch lengths and support values are reestiamted after forcing invertebrates to be in the right place, and then removing invertebrates
* See [annotations.tsv](annotations.tsv) for an annotation file. 
