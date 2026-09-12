# Dependencies

## R packages

- **doBy**, **lattice**, **RColorBrewer** -- used by the R analysis
  scripts (`MatovAxonMitochondria.r`, `avgV_VHL_analysis_V13.R`,
  `CMT_axonalTransport_Plate5.R`).

## MATLAB

No specific MATLAB version is recorded. Several scripts use functions
from the Image Processing Toolbox (`imread`, `imshow`, `bwlabel`,
`regionprops`, `watershed`, `imfilter`). See LICENSE for the bundled
third-party utility functions (SDC Morphology Toolbox, Peter Kovesi's
Computer Vision functions, Bio-Formats, the Crocker/Grier/Weeks
particle-tracking toolkit, and others).

`hessianeigs.asv` is a MATLAB autosave file, not source code.

## Data files

`set1edge_spline.mat`, `set1normal_matrix.mat`, `set1pixel_edge.mat`,
`set2edge_spline.mat`, `set2normal_matrix.mat`, and
`set2pixel_edge.mat` are not referenced by any script in this
repository.
