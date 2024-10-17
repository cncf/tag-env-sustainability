# Access and secrets management in the TAG ENV

TAG ENV, including working groups and projects, has a collection of secrets that are used for things like social media accounts, infrastructure access, API keys, etc. All of these secrets are stored securely in a dedicated, open source version of 1Password vault. Information regarding access and recovery of the 1Password accound and underlying vaults is stored in a private Google drive folder that's only accessible by the TAG ENV lead team.

## Adding/Requesting access to a secret stored in 1Password

If you need to add a new secret to 1Password or get access to a specific secret stored in a 1Password vault, please request one of the TAG, Working Group or Project leads to add it, or create a GitHub issue to ask for assistance. If you need to add a secret, **PLEASE DON'T ADD THE SECRET VALUE IN PLAINTEXT** to the issue description. Once someone gets back to you to assist, please share the secret with that person privately.

## Labeling secrets stored in 1Password

With time the total amount of secrets stored in the vault will increase, therefore we need to label the secrets for better overview and grouping of the secrets. If you're adding a new secret to 1Password, please add a label depending on what this secret is related to. For example, if the secret is used by the Working Group, please use the respective Working Group label like ```wg-green-reviews``` or ```wg-comms```. Or ```SoMe``` for social media related secrets.

See below sections for how access to the TAG ENV GitHub repository is managed and what is the process to contribute changes to the repository.

## Github access permissions and administration

The main GitHub repository for the TAG is `tag-env-sustainability`. TAG Leads have admin access to the repository and elected leads of working groups and projects maintain access which is defined in the [`cncf/people/config.yaml`](https://github.com/cncf/people/blob/main/config.yaml).

The TAG also has technical repositories.
The [`tag-env-tooling`](https://github.com/cncf-tags/tag-env-tooling) contains smaller projects. Larger projects get sourced in separate repositories.
All technical repositories are maintained in the [`cncf-tags`](https://github.com/cncf-tags) GitHub organization.
See [`cncf-tags`](https://github.com/cncf/toc/blob/main/tags/resources/cncf-tags-github-org.md) to find out more about the intention behind the organization.

- [Github access permissions and administration](#github-access-permissions-and-administration)
  - [Adding a commit to a TAG ENV repository](#adding-a-commit-to-a-tag-env-repository)
  - [GitHub project board](#github-project-board)

### Adding a commit to a TAG ENV repository

Each contributor, including TAG leadership and CNCF personnel, does not commit directly to the `main` TAG ENV branch.
To commit to the repository, create a branch off to the `main` branch, if you have maintain or admin privileges, or a [fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) to the repository.
After changes are made to the branch or fork, the change can be proposed via a [pull request (PR)](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).

After being merged the branch will be deleted.
Next contributions shall be in another fresh branch.
This way we keep the repository clean and allows a faster acceptance as it's clear what exactly is addressed.
This highly limits the amount of branches and stops having branches around for longer then needed.

The [`CONTRIBUTING.md`](../CONTRIBUTING.md) gives more information about how to contribute to the TAG.

### GitHub project board

The TAG uses a [project board](https://github.com/orgs/cncf/projects/10) to visualize and track issues.
The project board has views for working groups or projects.

## TAG ENV social media accounts permissions and administration

General information about creation and management of TAG ENV's social media accounts can be found in [communication-channels.md](./communication-channels.md).

### YouTube channel

TAG Environmental Sustainability has a dedicated [YouTube channel](https://www.youtube.com/@CNCFEnvTAG) where we publish recordings of all the meetings, as well as recordings from the events that were organized in context of the TAG ENV, for example meetup recordings from Cloud Native Sustainability Week.

Currently TAG ENV chairs, TAG ENV tech leads and Working Group chairs have access to record the sessions and upload those to the YouTube channel, as well as administer the YouTube channel itself.

If there's a significant need for a Working Group tech lead to get access to record meetings and administer the YouTube channel, it will be evaluated on case-by-case basis. Request for access for the Working Group tech lead can be flagged to the TAG ENV leads by the respective Working Group chair, for example during the TAG/WG lead sync.
