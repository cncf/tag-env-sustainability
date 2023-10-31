# Github access permissions and administration

The main GitHub repository for the TAG is `tag-env-sustainability`. TAG Leads have admin access to the repository and elected leads of working groups and projects maintain access which is defined in the [`cncf/people/config.yaml`](https://github.com/cncf/people/blob/main/config.yaml).

The TAG also has technical repositories.
The [`tag-env-tooling`](https://github.com/cncf-tags/tag-env-tooling) contains smaller project, larger projects get sourced in seperate repsitories.
All technical repositories are maintained in the [`cncf-tags`](https://github.com/cncf-tags) GitHub organization.
See [`cncf-tags`](https://github.com/cncf/toc/blob/main/tags/cncf-tags-github-org.md) to find out more about the intention behind the organization.

- [Github access permissions and administration](#github-access-permissions-and-administration)
  - [Adding a commit to a TAG ENV repository](#adding-a-commit-to-a-tag-env-repository)
  - [GitHub project board](#github-project-board)

## Adding a commit to a TAG ENV repository

Each contributor, including TAG leadership and CNCF personnel, does not commit directly to the `main` TAG ENV branch.
To commit to the repository, create a branch off to the `main` branch, if you have maintain or admin priviledges, or a [fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) to the repository.
After changes are made to the branch or fork, the change can be proposed via a [pull request (PR)](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).

After being merged the branch will be deleted.
Next contributions shall be in another fresh branch.
This way we keep the repository clean and allows a faster acceptance as it's clear what exactly is addressed.
This highly limits the amount of branches and stops having branches around for longer then needed.

The [`CONTRIBUTING.md`](../CONTRIBUTING.md) gives more information about how to contribute to the TAG.

## GitHub project board

The TAG uses a [project board](https://github.com/orgs/cncf/projects/10) to visualize and track issues.
The project board has views for working groups or projects.
