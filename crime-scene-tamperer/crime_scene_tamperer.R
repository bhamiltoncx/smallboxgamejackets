# Builds SBG_Jacket_-_Crime_Scene_Tamperer.pdf
#
# Usage (from this directory): Rscript crime_scene_tamperer.R
#
# Requires the source artwork in source/ (not included in this repository):
#   * source/Rulebook_CST_PR02.pdf (rulebook; page 1 is the front cover)
#   * source/CST_Box_Back.pdf (scan of the back of the box)
options(papersize = "letter")
library("grid")
library("pnpmisc")
library("sbgjackets")
library("xmpdf")
check_sbgjackets_dependencies()

output <- "SBG_Jacket_-_Crime_Scene_Tamperer.pdf"
dpi <- 300

spine_col <- "#4D6F76" # light slate gray sampled from front cover background
text_col <- "white"

# Front: rulebook page 1 cropped to its trim box; scaled to cover full panel width.
# Rendered with Ghostscript rather than Poppler: the cover uses a HardLight blend in a
# CMYK transparency group which Poppler (and macOS Quartz) render much darker.
front_png <- tempfile(fileext = ".png")
system2("gs", c("-q", "-dNOPAUSE", "-dBATCH", "-dSAFER", "-sDEVICE=png16m", paste0("-r", dpi),
                "-dUseTrimBox", "-dFirstPage=1", "-dLastPage=1",
                paste0("-sOutputFile=", front_png), "source/Rulebook_CST_PR02.pdf"))
bm_front <- magick::image_read(front_png)
unlink(front_png)
front <- fullGrob(bm_front, width = unit(1, "npc"))

# Back: scanned box back (pdftools renders its crop box); scaled to full panel height
# (scan is slightly wider than a jacket panel so a sliver of the sides is cropped)
bm_back <- pdftools::pdf_render_page("source/CST_Box_Back.pdf", page = 1L, dpi = dpi) |>
	magick::image_read()
back <- fullGrob(bm_back, height = unit(1, "npc"))

# weight 1.5 is an estimate (not yet rated on BGG)
spine_icons <- spineIconGrob(2:4, 40, 1.5, text_col)
# Carlito lacks a glyph for the prime (U+2032) used after the minutes so swap in a ’ (U+2019)
spine_icons[[1]] <- setChildren(spine_icons[[1]], do.call(gList, lapply(spine_icons[[1]]$children, function(g) {
	if (inherits(g, "text")) g$label <- gsub("′", "’", g$label)
	g
})))

spine <- gList(
	fullGrob(spine_col),
	spineTextGrob("Crime Scene Tamperer", col = text_col),
	spine_icons
)

# No `date_created` so that {xmpdf} doesn't generate a copyright line
xmp <- xmp(creator = "Ben Hamilton", spdx_id = "CC-BY-NC-SA-4.0",
           attribution_url = "https://github.com/bhamiltoncx/smallboxgamejackets",
           title = "Crime Scene Tamperer Small Box Game Jacket")
credits <- r"(
	* Jacket source: <https://github.com/bhamiltoncx/smallboxgamejackets>

	* *Crime Scene Tamperer* is published by Greater Than Games, LLC

	  + Designed by Christopher Badell, Christopher Burton, Matt Chapman, Mike Chapman, and Matthew Kroll
	  + <https://greaterthan.games/products/crime-scene-tamperer>

	* Front cover from the rulebook; back cover scanned from the retail box

	  + Used with permission by Greater Than Games
)"
inner <- creditsGrob(xmp, credits, icons = TRUE, cex = 0.9) # compact so credits clear the CC badge

pdf_create_jacket(output, front = front, back = back, spine = spine, inner = inner) |>
	pdf_polish_jacket(xmp = xmp, instructions = TRUE)
cat("Wrote", output, "\n")
