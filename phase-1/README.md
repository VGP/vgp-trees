## Final attempt 

### Main tree: constrained tree (`roadies_v1.1.16b.nwk`)

* [roadies_v1.1.16b.nwk](./roadies_v1.1.16b.nwk): This is the final tree. It's a result of a constrained search, with a constrained tree, given in [./start.tre](start.tre). The start tree forced some resolutions that the unconstrained tree was getting wrong. 

* We sampled gene trees by running ROADIES in its deep mode in four stages:

	1. Full dataset (581 species): We sampled 128,000 loci across all species, which produced 29,239 gene trees after filtration steps.
	2. Bird-focused subset (139 species: 137 birds + 2 crocodiles as outgroups): Since avian phylogeny is particularly complex and requires a large number of gene trees to be correctly resolved, we increased the sampling depth, generating 54,288 gene trees after filtration steps, from 64,000 sampled loci. 
	3. Shark-focused run (partitioned dataset): To confidently resolve the relative placement of sharks compared to fishes and other vertebrates, we partitioned the dataset into three clades (sharks, fishes, and all remaining species) and enabled ROADIES to sample 8,000 loci evenly across the three groups, resulting in 1,848 gene trees post-filtration.
	4. Fish-focused subset (181 species: 178 fishes + 3 Gymnophiona as outgroups): Given the challenges in resolving the deep divergence within fishes, we sampled 160,000 loci from this subset, which yielded 37,766 gene trees.

  **Total:** $29,239+54,288+1,848+37,766=123,141$ gene trees in total. 

*  ROADIES filtering parameters:
	*  We set the MIN_ALIGN to 10% of the number of input genomes for all partitions except for the bird-focused subset, where we set this parameter to 4. All other parameters were set to their default settings. 
*  The gene trees were inferred with no constraints. To obtain the final species tree, we used [./start.tre](start.tre) (depicted in [./start.pdf](start.pdf)) as a fixed starting tree constraint `--constraint ` as input to ASTRAL-Pro3:

	~~~bash
	astral-pro3 -t 64 --constraint starting.tre -i gene_trees_v1.1.9.nwk -o roadies_v1.1.14.nwk 
	~~~
	
* This unrooted tree was manually rooted at the common ancestor of Echinodermata and Hemichordata (`GCF_902459465.1` and `GCA_040954625.2`)

	~~~bash
	cat roadies_v1.1.14.nwk |nw_reroot - GCF_902459465.1 GCA_040954625.2 > roadies_v1.1.15.nwk
	~~~
* Branch lengths and support values were recomputed on this rerooted tree using
 
	~~~bash
	astral-pro3 -t 64 -C -c roadies_v1.1.15.nwk  -i gene_trees_v1.1.9.nwk -o roadies_v1.1.16a.nwk
	~~~
* astral-pro3 cannot infer the position and length of the root branch. We manually copied the branch lengths of the `GCF_902459465.1` and `GCA_040954625.2` and the common ancestor from `roadies_v1.1.14.nwk` onto `roadies_v1.1.16a.nwk` to obtain the final tree `roadies_v1.1.16b.nwk`. 

* Support values on the species tree are between 0 and 1. Above 0.95 is traditionally considered high. Below 0.8 is considered low. 
* Branch lengths are in units of the expected number of substitutions per site. 
	* Note that the root branch length included the manual adjustment noted above and is arbitrarily rooted at its middle point.  In general, branch lengths among invertebrates and the branches connecting vertebrates and non-vertebrates should be taken with a grain of salt, given the low gene sampling among invertebrates.  


* See [annotations.tsv](annotations.tsv) for an annotation file. 

### Unconstrained tree (`roadies_v1.1.10c.nwk`) 

* [roadies_v1.1.10c.nwk](./roadies_v1.1.16c.nwk): This run uses the same gene trees as our final tree, but does not constrain the search. You can see several issues, including: 
	* Position of coelacanth and lungfish
	* Position of Polypteridae versus Acipenseridae 
	* Lack of a `(Tetraodontidae, Antennariidae, Scatophagidae)` clade 
* In this tree, invertebrates were completely misplaced by ROADIES, so they were removed and branch lengths were recalculated. 
* For most analyses, the constrained tree will be preferred. This trees is provided for completeness. 
* The unconstrained tree differs from the constrained tree in 8 branches:
	* Position of coelacanth versus Lungfish (constrained)
	* Position of Sturgeons/Paddlefishes (constrained)
	* 2 edges: Position of Plectognaths (constrained)
	* Position of Iguanas (constrained)
	* Position of Mousebirds within birds
	* Position of Cuckoos within birds
	* Common ancestor of Cow sharks/Seven-gill sharks and Sawsharks  

## Previous attempt 

We describe earlier runs, `roadies_v1.1.nwk` and `roadies_v1.1.4.nwk`

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
