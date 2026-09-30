# Small Box Game Jackets

Print-and-play jackets that turn a 4"x6" photo storage box (the kind sold at craft stores in 16-box "photo keeper" cases) into a small box for a board or card game.

The jackets are built in R with [`{sbgjackets}`](https://github.com/trevorld/sbgjackets) and [`{pnpmisc}`](https://github.com/trevorld/pnpmisc), in the style of [Boardgame Barrio's Small Box Game Jackets](https://sites.google.com/view/boardgamebarrio).

## Jackets

| Game | Jacket | License |
| --- | --- | --- |
| [Crime Scene Tamperer](https://boardgamegeek.com/boardgame/473060/crime-scene-tamperer) | [PDF](crime-scene-tamperer/SBG_Jacket_-_Crime_Scene_Tamperer.pdf) | [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/), artwork used with permission by Greater Than Games |

Each jacket's directory has its own README with credits, license, and build instructions.

## Printing

1. Print the PDF on US Letter cardstock at "Actual Size" (100%), double-sided, flipping on the short edge.
2. Use the crop marks and origami symbols to cut and fold the jacket (full instructions are on the first page of each PDF).
3. Slide the jacket into the photo box.

## Building

Install R, the Carlito font, `exiftool`, and Ghostscript, then install `{sbgjackets}`:

```r
install.packages(
	"sbgjackets",
	repos = c(
		"https://trevorld.r-universe.dev",
		"https://piecepackr.r-universe.dev",
		"https://cloud.r-project.org"
	)
)
```

On macOS with Homebrew:

```sh
brew install r exiftool ghostscript poppler pkgconf
brew install --cask font-carlito
```

Then run each jacket's script from its directory, e.g.

```sh
cd crime-scene-tamperer
Rscript crime_scene_tamperer.R
```

Source artwork (rulebooks, box scans) is not included in this repository; see each jacket's README for what goes in its `source/` directory.
