# Crime Scene Tamperer Small Box Game Jacket

A 4"x6" photo box jacket for [Crime Scene Tamperer](https://greaterthan.games/products/crime-scene-tamperer) (Greater Than Games, 2026), "The Party Game for Guilty Parties!"

**[SBG_Jacket_-_Crime_Scene_Tamperer.pdf](SBG_Jacket_-_Crime_Scene_Tamperer.pdf)** (US Letter, 4 pages: instructions, blank, jacket outside, jacket inside)

- **Front:** cover of the rulebook
- **Back:** scan of the back of the retail box
- **Spine:** title plus 2–4 players, 40 minutes, weight 1.5 (an estimate; the game has no BoardGameGeek weight rating yet)

## License

This jacket by Ben Hamilton is licensed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-nc-sa/4.0/) (see [LICENSE.txt](LICENSE.txt)).

The front and back cover artwork is used with permission by Greater Than Games, who granted permission on 2026-09-30 to distribute this jacket under CC BY-NC-SA 4.0.

## Credits

- *Crime Scene Tamperer* is published by Greater Than Games, LLC
  - Designed by Christopher Badell, Christopher Burton, Matt Chapman, Mike Chapman, and Matthew Kroll
- Spine icons from [game-icons.net](https://game-icons.net/): "Clockwork" by Lorc, "Person" and "Weight" by Delapouite ([CC BY 3.0](https://creativecommons.org/licenses/by/3.0/))
- [Carlito](https://fonts.google.com/specimen/Carlito) font by Łukasz Dziedzic ([SIL Open Font License 1.1](https://openfontlicense.org/))

## Building

The source artwork is not included in this repository. To rebuild the jacket, put these files in `source/`:

- `source/Rulebook_CST_PR02.pdf`: the rulebook (page 1 is the front cover)
- `source/CST_Box_Back.pdf`: a scan of the back of the box, with its crop box set to the box edges

Then run:

```sh
Rscript crime_scene_tamperer.R
```

The front cover is rendered with Ghostscript because the cover art uses a HardLight blend in a CMYK transparency group, which Poppler and macOS Preview render much darker than intended.
