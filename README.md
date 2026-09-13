## NeurodegenerationMitochondriaLysosomes

Matlab and R code for the motion and morphology analysis of mitochondria.

## Quick start

This repository contains Matlab and R scripts for motion and
morphology analysis of mitochondria and lysosomes, together with a
number of bundled third-party utility functions -- see LICENSE for
their origins. See [DEPENDENCIES.md](DEPENDENCIES.md) for the required
R packages.

## Repository contents

- `CMT_track5.m`, `CMT_axonalTransport_Plate5.R`, `DmitriSets*.m`,
  `MatovAxonMitochondria.r`, `MatovIperian.r`,
  `avgV_VHL_analysis_V13.R`, `adaptivethresh.m`, `spotDetector.m`,
  `tracksStats.m`, and the remaining `.m` files at the repository root
  not listed in LICENSE as third-party -- axon/mitochondria/lysosome
  motion tracking and morphology analysis.
- `data/` -- `.mat` data files.
- [`media/`](media/) -- TIFF images, a PNG figure, and a video.
- `reports/` -- result-figure PDFs, and a reference paper (see its own
  description there).
- **License:** see [LICENSE](LICENSE) -- research/educational use,
  with a number of bundled third-party utility functions listed
  separately.

## About

My analysis of mitochondria in axons of induced pluripotent stem cells (iPSCs) obtained from the skin of Alzheimer's patients, and of lysosomes in Parkinson's astrocytes, with Dmitri Volfson (iPierian/Pfizer).

See also the AVI file with a movie of motion tracking of lysosomes in a mouse astrocyte model of Parkinson's disease, carrying the LRRK2-G2019S mutation.

For detailed information, see: https://www.researchgate.net/publication/382593670_Quantitative_Video_Microscopy_in_Medicine
