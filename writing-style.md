# Writing style

Consistency creates clarity in communication.

If you find yourself correcting for consistency, please propose additional style
guidelines via pull request to this document. Feel free to add references to
good sources for content guidelines at the bottom of this guide.

## Common terms

* When referring to users and use cases, ensure consistency with use cases
* See [CNCF Style Guide][cncf-style] for common terms. Note that the following terms are not hyphenated and all lower case, except for capitalizing the first letter when at the beginning of a sentence:
  * open source
  * cloud native

## Additional formatting

* Headlines, page titles, subheads and similar content should follow sentence
  case, and should not include a trailing colon.
* Paragraphs do not start with leading indent.
* Wrap lines at 80 characters, except where it would break a link. No need to
  reformat the whole paragraph to make it perfect -- fewer diffs are easier
  for reviewers.

## File & directory naming conventions

* Every directory should have a README.md with useful introductory text.
* All other file and directory names should be all lower case with dashes to
  separate words.

## Pull Request Quality Checks

As part of every pull request following quality checks are being executed to ensure that submitted content is compliant with existing best practices for spelling, document formatting and link formats:

* [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2) tool is used to verify correct Markdown file formatting;
* [cSpell](http://cspell.org) is used to verify that content is compliant with established spelling rules;
* [markdown-link-check](https://github.com/tcort/markdown-link-check) is used to verify that all the links are valid and properly constructed;

In case any of the modified files in the PR violate any of the checks a "Quality Checks" build will fail.

### Running Quality Checks locally

We encourage everyone to execute quality checks locally prior to creating a pull request to ensure that you can fix as many errors as possible before going through a code review process. To run the quality checks locally you can run ```npm run qa:dev``` command from the root of the tag-env-sustainability repository - this command will trigger a [qa-checks-local.sh](./qa-checks-local.sh) script that will perform all the validations mentioned above on the files that you've modified. It will also install the tools mentioned above if those don't exist locally. If any issues will be identified by the script those will be written to the terminal session where the command has been triggered so that you can easily go through and follow up the detected errors accordingly.

> Please note that minimum version ```v18.0.0``` of ```Node.js``` is required for all the tools to run successfully. You can install latest ```Node.js``` version with ```nvm install --lts``` command or you can refer following article for more information [How to update Node.js and NPM to next version?](https://www.geeksforgeeks.org/how-to-update-node-js-and-npm-to-next-version)

### Fixing QA errors

Every tool provides quite descriptive messages regarding the location of the error and how it should be fixed, but below is a quick guide for additional help and reference.

1. **Markdown linting.** ```markdownlint-cli2``` tool is configured to automatically fix those issues that it can fix automatically, but if there are issues that can't be fixed automatically, an error with file and location will be printed out for your reference. For example, ```writing-style.md MD024/no-duplicate-heading/no-duplicate-header: Multiple headings with the same content markdownlint(MD024) [Ln 54, Col 1]``` is an error message that states that it has identified a heading of the same level on **line 54** of **writing-style.md** file, which is where you would need to update it to resolve the issue. More rules with explanations can be found [here](https://github.com/DavidAnson/markdownlint/blob/main/README.md#rules--aliases).

2. **Spelling.** ```cSpell``` tool has a configuration file called [cspell.json](./cspell.json), that is located in the root of the repo, and it defines a set of rules that the tool following during its execution. It checks the words towards a set of default dictionaries, words that we have identified to always be correct and a set of patterns that the tool shall ignore and not scan (like code blocks and Markdown/HTML specific link syntax, etc.). In addition we have created a custom TAG ENV dictionary, [tag-custom-dictionary-cspell.txt](./tag-custom-dictionary-cspell.txt), where we can add words that are correct, but are not present in default dictionaries. In case you get ```Unknown word``` error you will need to verify that the word is correctly spelled and if not, update it accordingly on the line and in the file that the tool is referring to. If the word is correct, you may add it to the TAG ENV custom dictionary mentioned above. There are common words that may not exist in known dictionaries and may be challenging to detect with filtering rules, like names, which may still be flagged by the tool. It's not needed to add this type of words to our custom TAG ENV dictionary, the easiest would be to add an ignore flag. You can add an ignore flag by defining which word to ignore: ```<!-- cSpell:ignore WORD_TO_IGNORE -->```, or by ignoring the whole next line where the word(s) are: ```<!-- cspell:disable-next-line -->```, or by ignoring a longer content block by setting ```<!-- cSpell:disable -->``` before start of the block to ignore and ```<!-- cSpell:enable -->``` after the end of the block to ignore. For additional details, please check [cSpell documentation](https://cspell.org/configuration/document-settings).

3. **Markdown links.** ```markdown-link-check``` tool has a configuration file called [link-config.json](./link-config.json), that is located in the root of the repo, and it defines a set of rules that the tool following during its execution. It checks for link patterns that it should ignore and the links that should be modified to verify their validity. A good example here is where we place the images - the location for the images is different in the source code and the deployed website, therefore we need to perform validation towards a correct path which may not be the one referenced by the Markdown files in the source code (because those use the reference path that will be valid once the website is built and deployed). If the tool flags a specific link as invalid you need to verify what the error is and modify the link accordingly, on the line and in the file that the tool is referring to. For example, ```FILE: writing-style.md  [✖] https://eco-qube.eu/ → Status: 410``` points to that the respective link in ```writing-style.md``` file is no longer valid and we can confirm it by navigating to the link in the browser. To fix that I would need to update ```https://eco-qube.eu``` with ```https://www.ecoqube.org```, which is its valid alternative. In some cases, for example in some of the Cloudflare-hosted websites, there is stricter protection against web scraping, which causes automated tools like ```markdown-link-check``` to return a ```403``` HTTP error upon accessing respective websites. The same error will also occur if respective websites are accessed via tools like ```cUrl``` or ```wget```. The alternative solution for tools like ```cUrl``` and ```wget``` is to use open source tools that fully simulate a browser, but this is not something that is currently supported by the ```markdown-link-check tool```. Therefore, **if the tool flags a URL as invalid, but you're able to access it via browser**, please add a ```<!-- markdown-link-check-disable-next-line -->``` flag right before the line with the link to disable checking of that link by the tool.

This guide is not extensive and if you're still experiencing issues that are not covered by this guide, don't hesitate to mention this as part of your pull request, reach out to the TAG ENV community on Slack or raise a GitHub issue and community members will be happy to help you out and progress with your work!😊

## Sources

<!-- cSpell:ignore Opps --->
* [OpenOpps Contribution Guide][openopps-style]
* [18F Content Guide](https://content-guide.18f.gov/)

[cncf-style]: https://github.com/cncf/foundation/blob/master/style-guide.md
[openopps-style]: https://github.com/openopps/openopps.github.io/blob/master/CONTRIBUTING.md
