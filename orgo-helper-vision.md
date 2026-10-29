# Orgo Helper: Project Vision

> Living document. Started October 2026 from earlier design and planning sessions. Sections marked **TODO** are gaps to fill in; everything else reflects decisions made so far and can be revised.

## Summary

Orgo Helper is a website, orgohelper.com, where undergraduate organic chemistry students practice the kinds of problems that most often trip them up on exams. Its centerpiece is a set of practice problem generators that produce an unlimited supply of problems matched to what a student's course covers. The site will also host lectures, starting free and adding paid content once it has an audience. A companion YouTube channel teaches the topics and demonstrates the site, and is the main way students will discover it.

The project is built and run by a single developer, so decisions favor a small, shippable MVP that can be improved iteratively.

## Scope of this project

This project covers **everything on orgohelper.com except the practice problem generators.** Each generator is developed as its own separate project and plugs into the website.

**In scope:**

- The site shell: header, navigation menu, footer and shared page layout
- The home page
- Sign-in with Google or Apple, accounts and the Account page
- The Lectures section
- Phone layouts for the site pages, and the "unavailable on a phone" page shown for desktop-only generators
- The design system (colors, typography, components) used by every page, including the pages that host generators
- The common frame that each generator appears in, and the way generators are listed and reached from the site
- Hosting, domains, deployment and site-wide protections such as rate limiting
- The path from YouTube videos into the site

**Out of scope (separate generator projects):**

- Problem generation, answer checking and grading for each topic
- Each generator's own settings, problem display and feedback
- Chemistry tooling used by the generators (such as RDKit and OPSIN)

**TODO:** define the interface between the website and a generator: how a generator is added to the menu, whether it is phone-friendly or desktop-only, what the site provides to it (signed-in user, layout, styles) and what it provides back (for example, scores to show on the Account page).

## Goals

- Give students one place to find practice problems, lectures and their own progress.
- Make reaching a generator fast: a student arriving from a video should be practicing within a click or two of signing in.
- Grow an audience through YouTube videos that teach a topic and then show the site being used to practice it.
- Keep everything free at launch; introduce paid features or content once the site is popular. **TODO:** decide what will be paid and when.

## Audience

Undergraduates enrolled in first- or second-semester organic chemistry. They mostly study on laptops or tablets, sometimes on phones, often shortly before a quiz or exam, and typically arrive from a YouTube video or a search such as "organic chemistry IUPAC rules."

## Site structure

The main menu is **Practice Problems** (a dropdown of the generators) · **Lectures** · **Account**.

| Generator in the Practice Problems menu | Status |
| --- | --- |
| IUPAC naming | First generator, in development as a separate project; works on laptops and phones |
| Synthesis (including retrosynthesis) | Planned |
| Acid/Base chemistry | Planned |

Generators that aren't available yet appear in the menu marked "Coming soon," so students can see what's planned.

**TODO:** describe the Lectures section (format, topics, free vs. paid) and what the Account page contains.

## Core user journey

1. A student searches Google or YouTube for a topic such as IUPAC naming and finds an Orgo Helper video that teaches it and demonstrates the site.
2. They follow the link in the video description, which goes straight to that topic's generator. On a phone, a phone-friendly generator opens normally; a desktop-only generator shows a page saying it is unavailable on a phone and asking them to come back on a laptop or tablet.
3. They sign in with Google or Apple and return directly to the generator they were trying to reach, not a general dashboard.
4. The generator takes over from there, inside the site's common frame.

## Platform and technical decisions

- **Laptop and tablet first, phones where possible:** the site is designed primarily for laptops and tablets, and as much of it as possible is also made available on phones. Each generator is either phone-friendly or desktop-only: if a generator's design is too complicated to fit comfortably on a phone, it gets no phone version, and phone visitors are told to come back on a laptop or tablet.
- **Sign-in required:** via Google or Apple, partly to deter scraping. The site backs this up with per-account rate limiting; each generator is responsible for keeping its own answers on the server.
- **Accounts and hosting:** a GitHub account and an AWS account are set up for the project.
- **Privacy policy and terms** are needed before launch, since the site stores information from people's Google and Apple accounts.

**TODO:** document the stack (framework, database, hosting setup on AWS), deployment process and repository layout.

## Domains

The project owns both **orgohelper.com** and **orgohelper.dev**.

| Domain | Role |
| --- | --- |
| orgohelper.com | **Production:** the live site that students use |
| orgohelper.dev | **Development:** where new work is built and tested before it is released to production |

## Design and brand

Brand and interface design (logo, typography, color palette and fixed conventions) is documented separately in `design.md`.

## YouTube

Every video opens with a 2.9-second branded intro (1920×1080, 30 fps) in which three organic reactions play at once and resolve into the Orgo Helper logo, with the name written on in Kalam. It is generated with Manim (Python) from the same structures as the logo, and does not yet have audio.

**TODO:** channel plan (topics, publishing schedule, how each video links to the site).

## Open questions

- The interface between the website and the generator projects (see Scope).
- What Lectures and the Account page contain.
- The logo files predate several chemistry corrections and should be regenerated, along with the intro and logo in the final palette.
- **TODO:** monetization model and timeline.