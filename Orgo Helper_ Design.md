# Orgo Helper: Design

> Living document. Brand and interface design for Orgo Helper, split out from the project vision document. Last updated October 29, 2026.

## Name and logo

The wordmark is "Orgo Helper" in **Kalam** (a handwritten-style Google font), with "Orgo" and "Helper" in two colors. The full logo composition places the name among skeletal structures drawn from Ketcher files.

## Typography

- **Kalam:** wordmark only.
- **Source Sans 3:** headings and all interface text, chosen for readability at every size.

## Color palette

The current palette is "Custom - based on White Page, navy header," chosen from interactive comparisons of many options:

| Role | Color |
| --- | --- |
| Header and footer background | `#12203A` |
| Header text and "Orgo" | `#F2F5FA` |
| "Helper" in the header | `#3386E0` |
| Header links | `#B4C2D6` |
| Page and settings bar | `#F5F7FA` |
| Cards | `#FFFFFF` |
| Borders | `#AEBDD0` |
| Body text | `#111A2B` |
| Secondary text | `#45526A` |
| Headings | `#1D3557` |
| Accent | `#2F6FB5` |
| Main button | `#1D4E89`, with `#FFFFFF` text |
| Wrong answer | `#C01C28` |
| Footer "Helper" | `#8DBDEB` |

The design system (below) simplifies this into a smaller set of color tokens: body text uses the header navy `#12203A`, and it adds `#7D8DA6` as the border color for controls people need to find (inputs, secondary buttons, chips, badges), because `#AEBDD0` is too faint for those.

## Design system

The working design system is **"Orgo Helper - attempt 3"** (a Design System artifact; its index is titled "Orgo Helper"). It holds the tokens (colors, type styles, spacing, radii, layout widths), a brand book, and plain-HTML components with `oh-` classes in one stylesheet. No JavaScript framework is chosen yet.

Components: Wordmark, Header (with a phone version), Footer, Button (primary, secondary, small and compact), Chip, Badge, Card, TopicList, ComingSoonPanel, Breadcrumb, TextField, Feedback, Progress, Wallpaper, and a placeholder MoleculePanel.

## Wallpaper

Page backgrounds between the header and footer carry a faint wallpaper of skeletal structures: benzene, toluene, cyclohexene, isopropylcyclohexane, cyclopentane, a hexene and a branched alkane.

- Lines are the heading color `#1D3557` at 7.5% strength, 2px, on a 960 × 960 px tile that repeats without seams.
- The same tile is used on every page; it is never regenerated per page or on refresh.
- Cards and panels sit on white above it, so body text never sits directly on the wallpaper.
- Files: `docs/style-samples/images/molecule-wallpaper.svg` and `molecule-wallpaper-layout.json` (each molecule's type, position and angle, for rebuilding or tweaking).

## Home page

The home page uses layout "option D" from the lo-fi wireframes:

- A centered headline, "Practice naming organic molecules," with "Free. Sign in with Google or Apple." under it.
- Two cards, side by side on laptops and tablets and stacked on phones:
  - **Practice:** a topic list with every generator. IUPAC naming has a small blue Start button, the page's one filled action; Synthesis and Acid/Base chemistry are muted rows with a "Coming soon" badge.
  - **Learn:** a "Coming soon" panel in place of the videos, plus a "Watch the videos" button.

## Devices

The site is designed for laptops and tablets first and works on phones where possible. On phones, the header keeps the wordmark, a Sign in or Account link and a 44px menu button that opens a full-screen menu; buttons in stacked layouts go full width.

## Mockups

- **Lo-fi wireframes:** every page at phone (375), tablet (820) and laptop (1440) widths; a copy is in `docs/lo-fi_wireframes/`.
- **Hi-fi mockups:** every page at phone and laptop widths, built with the design system. Tablet versions come later.

**Next step:** a clickable prototype built from the hi-fi mockups.
