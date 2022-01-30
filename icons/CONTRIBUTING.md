## Creating & Modifying Icons

All Yaru assets are created using the free and open source vector graphics editor [Inkscape](http://inkscape.org), which is recommended for creating new icons or modifying existing ones.

While other tools exist that are suitable for SVG editing, they often add custom elements to extend the limitatations of standard SVG format, so they are not recommended.

## Icon Names

Use of file names in line with the [FreeDesktop.Org Icon Naming Specification](http://standards.freedesktop.org/icon-naming-spec/icon-naming-spec-latest.html) is encouraged for new icons. Failing that, when possible use generic file names and create symbolic links to the generic icon.

## Focus

The Ubuntu desktop is the target for this icon set. As such, Yaru development is currently focused the GNOME desktop, and providing the minimum required set of icons for that experience.

Changes regarding other desktop environments (such as MATE or KDE) are not currently a priority but pull requests or issues regarding those desktops will be reviewed as they come.

## "Third-Party" Icons

The Yaru icon set is not a "universal" set and **will not attempt to supply icons for "third-party" applications**. A "third-party" application is any application that is non-generic and has it's own branding, e.g. Mozilla Firefox or Inkscape.

It is key that this project to not infringe on the brands of other projects as it is intended to be eventually used at the vendor-level.  So pull requests to add icons or symbolic links that would overwrite the branding of third-party apps **will be rejected.**

That said, if you are a third-party developer would like to be cohesive with this icon set by providing a Yaru-styled icon in their app, don't hesistate to reach out for assistance, if need be.

## Adding Icons

New [fullcolor icons](src/fullcolor) (those for applications, etc.) must be created from a template found in the source files or simply be based off of a pre-existing source file. See the [fullcolor README](src/fullcolor/README.md) for more details and new [symbolic icons](src/scalable) icons must be added to the source plate SVG found in the source files. See the [symbolic README](src/scalable/README.md) for more details.
