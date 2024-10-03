# Green Scraper - Tool for automatic event list generation for the TAG ENV website - In Progress

- **Project Leads**:
  - [@guidemetothemoon](https://github.com/guidemetothemoon)
  - [@Al-HusseinHameedJasim](https://github.com/Al-HusseinHameedJasim)

- **TAG ENV Lead representative**: [@guidemetothemoon](https://github.com/guidemetothemoon)
- **Project started**: *2024-04-02*
- **Project completed at**: *N/A*
- **Project drive folder**: [CNCF Technical Advisory Group – Project Green Scraper](https://drive.google.com/drive/folders/1wem48mKn88oh7yGVIt430lpY2an5UdUZ?usp=drive_link).Since it's a tool we will also reference it's source code repository [tag-env-tooling/greenscraper](https://github.com/cncf-tags/tag-env-tooling/tree/main/greenscraper) and [tag-env-tooling/green-talks-scraper](https://github.com/cncf-tags/tag-env-tooling/tree/main/green-talks-scraper)
- **Project tracking issue**: [#345](https://github.com/cncf/tag-env-sustainability/issues/345)
- **Project meeting notes**: [Meeting Notes - CNCF TAG - Env Sustainability - Project Green Scraper](https://docs.google.com/document/d/1auQNB62ozY3KSwipoBp68GT1sRujZpBeCyRnjKKNnT0/edit?usp=sharing)

## Description

There is a need to track conferences that focus on environmental sustainability, have green tracks, or may be relevant in terms of speaking opportunities/outreach for the TAG Environmental Sustainability. The ideal scenario here would be to have an automated process where a tool/script scrapes sustainability-related sessions and conferences, adds those to the list that is published to the [Events page](https://tag-env-sustainability.cncf.io/events) on the TAG ENV website.

In order to automate this process this project focuses on creating and automated GitHub Actions workflow that will continuously scrape different event websites for data in order to aggregate a list of sustainability-related conferences, meetups, events, sessions, etc. List entries should include (but are not limited to): event name, session title, speaker name(s), session description, session date, session location, session link. Data scraping will utilize one of the donated tools or a combination of those:

- [tag-env-tooling/greenscraper](https://github.com/cncf-tags/tag-env-tooling/tree/main/greenscraper)
- [tag-env-tooling/green-talks-scraper](https://github.com/cncf-tags/tag-env-tooling/tree/main/green-talks-scraper)

Finally the workflow will continuously update the [Events page](https://tag-env-sustainability.cncf.io/events) on the TAG ENV website based on the aggregated list by submitting a pull request with the respective changes.

## Deliverables

This project delivers an automated GitHub Actions workflow that continuously aggregates a list of sustainability-related conferences, meetups, events, sessions and through a pull request adds new entries to the list that is published on the the [Events page](https://tag-env-sustainability.cncf.io/events) on the TAG ENV website.
