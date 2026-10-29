# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository status

This repo is still in the planning and design stage. There's no application code, build system, package manager, linter or test suite yet, so there are no commands to run. Everything here is planning docs and static HTML/CSS mockups. To view a mockup, open its HTML file in a browser.

The stack (framework, database, AWS hosting setup), deployment process and repository layout have not been decided yet. They are TODOs in `orgo-helper-vision.md`. Don't assume a stack. Ask before you introduce one.

## What the project is

Orgo Helper (orgohelper.com) is a website where undergraduate organic chemistry students practice problems from generated problem sets. **This repo covers the website only:** the site shell, home page, sign-in with Google or Apple, accounts, Lectures, phone layouts, the design system, the common frame that hosts generators, hosting/deployment and rate limiting. Each practice problem generator (IUPAC naming first, then Synthesis and Acid/Base) is a **separate project** that plugs into the site. Problem generation, grading and chemistry tooling (RDKit, OPSIN) are out of scope here. The website–generator interface hasn't been defined yet.

Domains: orgohelper.com is production and orgohelper.dev is development.

## Key documents

- `orgo-helper-vision.md`: the website's project vision. It covers scope, site structure, the core user journey, platform decisions and open TODOs. Read it first.
- `Orgo Helper_ Design.md`: brand and design (wordmark, fonts, palette). The vision doc calls this file `design.md`, but this is the actual filename.
- `IUPAC Naming Generator_ Project Vision.md`: the vision for the first generator. It's kept here for reference on the website–generator boundary but belongs to a separate project.
- `docs/lo-fi_wireframes/`: low-fidelity wireframes for every site page (home, Practice Problems menu, sign-in, generator page, coming soon, lectures, account, unavailable on a phone, about/privacy/terms, delete account, contact, not found) at phone 375, tablet 820 and laptop 1440 widths.
- `docs/style-samples/`: early hi-fi mockups (`index.html`, `practice.html`, a shared `styles.css`, and `menu.js` for the Practice Problems dropdown). `styles.css` defines the palette as CSS custom properties on `:root`.
- `docs/style-samples/prompts/claude-design-system-instructions.md`: the user's brief for turning the mockups into a design system. Prefer simplifications, capture colors and typography first, keep the other elements minimal, and keep molecule-editor and molecule styling to a minimum because it will be reworked.

The vision and design docs are living documents. Update them when a decision changes instead of letting them drift.

## Decisions to respect

- **Laptop and tablet first, phones where possible.** Each generator is marked phone-friendly or desktop-only. Phone visitors who open a desktop-only generator see an "unavailable on a phone" page.
- **Sign-in is required** (Google or Apple only), with per-account rate limiting to deter scraping. After signing in, students go back to the generator they were trying to reach, not to a dashboard.
- **Main menu:** Practice Problems (a dropdown of generators; ones that don't exist yet are shown as "Coming soon") · Lectures · Account.
- **Typography:** Kalam is used only for the "Orgo Helper" wordmark, with "Orgo" and "Helper" in two colors. Source Sans 3 is used for all other text.
- **Molecule display** is always black bonds and red oxygen on a white canvas, whatever the site theme.
- A single developer builds the project, so favor a small, shippable MVP over completeness.
