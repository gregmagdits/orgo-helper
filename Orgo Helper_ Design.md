# Orgo Helper: Design

> Living document. Brand and interface design for Orgo Helper, split out from the project vision document. Update it as the design system takes shape.

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

## Fixed conventions

- **Molecules are always drawn the same way,** regardless of the site theme: black bonds and red oxygen (`#FF0000`) on a white canvas, for maximum legibility.
- **The answer box is always white,** with near-black text.
- **The practice page uses a "summary bar" layout:** the current settings appear as chips in a bar under the header, and an Edit settings button opens a drawer with the full form.
- **Keyboard-friendly:** Enter submits, Enter again moves to the next problem, and a shortcut skips.
- **Errors are shown next to the field that caused them,** and correct and incorrect feedback differ by symbol and wording as well as color.

**Next step:** turn the mockups into a design system (design tokens for colors, type sizes and spacing, plus component styles).