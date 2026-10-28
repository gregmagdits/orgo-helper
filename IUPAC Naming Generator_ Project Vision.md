# IUPAC Naming Generator: Project Vision

> Living document. Started October 2026 from earlier Orgo Helper planning sessions. Sections marked **TODO** are gaps to fill in; everything else reflects decisions made so far and can be revised.

## Summary

The IUPAC naming generator is the first practice problem generator for Orgo Helper (orgohelper.com). It shows students a molecule and asks them to type its IUPAC name, producing an unlimited supply of problems matched to the molecules their course covers, and grading every answer automatically and fairly.

This project covers the generator itself: generating molecules, displaying problems, the generator's settings, and checking answers. The surrounding website (navigation, sign-in, accounts, the page frame and the design system) belongs to the separate Orgo Helper website project.

## Goals

- Give students unlimited, targeted naming practice instead of the fixed problem sets in textbooks.
- Let students control exactly which molecules they practice, so first- and second-semester students can each match their course.
- Accept every correct form of a name, so students trust the grading.
- Start as a simple quiz and grow into a tutor that explains mistakes.

## Audience

Undergraduates in first- or second-semester organic chemistry, practicing on a laptop. First-semester courses usually cover alkanes, alkenes, alkynes, alcohols and alkyl halides; second-semester courses add the remaining functional groups, depending on the instructor.

Many students will arrive from an Orgo Helper YouTube video that teaches IUPAC naming and demonstrates this generator, following the link in the video description straight to the generator after signing in.

## MVP

### Settings

Before practicing, students choose the kinds of molecules they want. Every value is validated, and impossible combinations are flagged before practice starts.

- **Parent type:** alkane, alkene, alkyne, aromatic (including heteroaromatic rings), plus an option to include cyclic molecules
- **Parent chain length:** minimum and maximum (for aromatics, this currently means ring size; to be revisited)
- **Most senior functional group**
- **Number of principal functional groups**
- **Allowed secondary functional groups,** and how many may appear (minimum and maximum)

The core settings (parent type and allowed groups) are shown first, with the rest available as advanced settings. On a student's first visit, the settings open immediately so they choose what to practice before the first problem.

### Practice session

- A new problem is generated each time the student clicks Next, with no limit and no end screen.
- The student types a name and submits it, or skips the problem.
- There are no hints and no second attempts. After Submit, the generator shows Correct, or Incorrect with the correct name and the student's own answer.
- A running score shows the percentage correct.
- Keyboard-friendly: Enter submits, Enter again moves to the next problem, and a shortcut skips.

### Grading

The student's typed name is converted to a structure with **OPSIN**, then compared with the target molecule using a standard identifier such as InChI. Equivalent valid names (for example "2-butene" and "but-2-ene," or differences in spacing and capitalization) are therefore all accepted. Aromatic and heteroaromatic compounds may have retained names (pyridine, furan, thiophene), which OPSIN understands.

### Security

- Problems are generated on the server.
- **The answer is never sent to the browser before the student submits,** since anything sent in advance can be read with the browser's developer tools.
- The website project handles sign-in and per-account rate limiting.

### Display conventions

Molecules are always drawn with black bonds and red oxygen on a white canvas, regardless of the site theme. The answer box is always white with near-black text.

## Later improvements

- Feedback that explains the specific mistake (for example, numbering the chain from the wrong end)
- Semester presets ("Semester 1," "Semester 2") as one-click settings
- Saved progress and all-time scores
- A tablet layout

## Technical notes

- **RDKit** for molecule generation, handling and drawing
- **OPSIN** for name-to-structure conversion in grading
- **Ketcher** for drawing reference structures during development
- An existing development tool, the IUPAC Problem Browser, lists problems with filters for parent chain, chain length, functional groups and group counts. It is a useful starting point for the settings design.

**TODO:** document the stack, how the generator integrates with the website, and repository layout.

## Principles

- **Chemistry must be correct.** Generated molecules, names and stereochemistry should be realistic and checked.
- **Grading must be fair.** Accept every valid name for a molecule; a correct student marked wrong loses trust in the site.
- **Respect copyright.** Development datasets derived from textbook problems stay internal; the live generator uses generated molecules. Individual molecules and their names are facts and are fine to use.
- **Ship small, then improve.** Start with a simple quiz and add feedback, presets and other features iteratively.

## Interface with the website

**TODO:** agree with the website project on how this generator plugs in: how it appears in the Practice Problems menu, what the site provides (signed-in user, page frame, styles) and what the generator provides back (for example, scores for the Account page).

## Open questions

- **Stereochemistry:** either the MVP never generates molecules with stereocenters or stereogenic double bonds, or a setting enables them and grading requires correct R/S and E/Z descriptors.
- **Scoring:** whether skipped problems count against the score, and whether the score is per session or all-time.
- **No matches:** what to show when no molecule fits the chosen settings (the current design keeps the settings open with suggestions for widening them).
- **Aromatic rings:** how chain length should apply to aromatic and heteroaromatic parents.
- **Retained names:** which retained and common names the answer key accepts.