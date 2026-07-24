The final tree to use is <./wastral.merged.nwk>, which takes its topology and support from wASTRAL and branch lengths from CASTLES-Pro (by running astralpro4).

* <./merge_newick_support_lengths.py> is used to mrege support from <./wastral.wastralinput.trees.tre> and branch lenghts from <./wastral.astralinput.trees.bl.tre>
  
  ```python merge_newick_support_lengths.py wastral.wastralinput.trees.tre wastral.astralinput.trees.bl.tre --outgroup GCA_964187855.1,GCA_048934315.1,GCA_964198595.1 -o wastral.merged.nwk --hide-rooted-prefix```
