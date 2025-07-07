### First attempt: `roadies_v1.1.tre` or `roadies_v1.1.nwk`
* Files:
	* `roadies_v1.1.nwk` is the inferred tree in Newick with no edits
	* `roadies_v1.1.rerooted.nwk` is the inferred tree in Newick, rerooted at Jawless fishes
	```
	nw_reroot roadies_v1.1.nwk GCA_048934315.1 GCA_964187855.1 GCA_964198595.1 > roadies_v1.1.rerooted.nwk
	```
	* `roadies_v1.1.tre` is Nexus file with rooting and all sorts of other annotations, suitable for FigTree and perhaps other tree viewing software. 
* Tree inferred using ROADIES from 85,375 gene trees. These include:
	* 3949 from a shark-focused ROADIES run where sampling was 1/3 for sharks, fishes, and other vertebrates
	* ???? from 3 iterations of ROADIES with random sampling no restriction, but only selecting gene trees that have at least one shark
	* ???? from a bird-focused run where ????
* Invertebrates were included in the run but were misplaced. We removed them from the gene trees and reran ASTRAL-Pro to get the final tree. 
	* We manually rooted the tree on the branch separating jawless fishes from the rest 
* Support values on the species tree are between 0 and 1. Above 0.95 is traditionally considered high. Below 0.8 is considered low. 
* Branch lengths are in units of the expected number of substitutions per site. 
	* If the branch lengths matter to you, note that the branch of the root branch and perhaps one or two adjacent ones cannot be taken at face value. The root branch is arbitrarily rooted at the middle point. And CASTLES-Pro needs to be rerun to get the current length on that branch anyway. We will fix this and release a new version. 
* See [annotations.tsv](annotations.tsv) for an annotation file. 
