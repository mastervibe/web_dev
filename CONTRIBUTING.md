# Contribution

## Formatting your commit messages

Based on [Angular commit message formatting](https://github.com/angular/angular/blob/master/CONTRIBUTING.md)
you should commit with a message following this format:

```text
<type>(<scope>): <subject>
```

Where:

- `type` must be one of the following:
  - **build**: Any change related to jenkins or the pipeline itself
  - **feat**: A new feature (new exercise, new workshop, new example, fully
    restructure workshop...)
  - **fix**: A bug fix (broken link, typo in exercise...)
  - **refactor**: A change that neither fixes a bug nor adds a feature
    (rearrange exercises, materials)
  - **material**: Material changes only (new videos added, removed)
  - **review**: Only Material Review changes (adding new points, extending with
    answers...)
  - **style**: Changes that do not affect the meaning of the code (white-space,
    formatting, missing semi-colons, etc)
  - **test**: Adding missing tests or correcting existing tests
- `scope` should be:
  - the containing folder name as a thumbrule
  - eg. the name of the workshop/project/material/dojo you change
  - not the name of the file
  - can be omitted if the scope is the whole (eg. introducing new root level
    structure, removing a whole folder, adding an extra dash into all links
    between green and fox)
- `subject` should be the description of the change with the following rules in
  mind:
  - use the imperative, present tense: "change" not "changed" nor "changes"
  - don't capitalize the first letter
  - no dot (.) at the end
  - should include the motivation for the change

### Good Examples

- `fix(react-forms): rephrase todo to event registration`
- `material(rest-backend): add ResponseEntity and DTO material as optional`
- `feat(week-start): add expectation management about providing help on the
  weekends and nights`

### Git Hook

You can create a git hook to ensure this format of commit message, just place
this content into `.git/hooks/commit-msg` file (and make sure it has 755
accessibility)

```sh
#!/bin/sh

# regex to validate in commit msg
commit_regex='^(feat|fix|refactor|material|review|style|test)(\([[:alnum:]-]+\))?: [[:alnum:]# ]+'
error_msg="Aborting commit. Your commit message must follow this style: type(scope-optional): subject"
if ! grep -iqE "$commit_regex" "$1"; then
    echo "$error_msg" >&2
    exit 1
fi
```

## Labeling your Pull Requests

When you create a new pull request on Github in the Teaching Materials
repository, you apply the appropriate label from the list below.

### Patch changes

- Style guide fixes
- Typo fixes
- Broken links which are not leading to new materials
- Add material review points
- Add exercises
- New videos (eg. because of broken links)

### Minor changes

- Edit/Remove exercises
- Edit/Add workshop
- Edit/Add syllabus
- Edit/Remove material review points
- Edit/Add materials

### Major changes

- Folder restructure
- Change in existing syllabus structure

## Workshop folder structure

- The folder name is the title of the workshop.
- The folder should contain the material and workshop outline file
- The folder should contain the separate folders for each exercise
- The folder may contain an `assets` folder where any necessary other files can
  be placed (eg: images, sql scripts...)

### Material and workshop outline file

- It should be named as `README.md` if the materials and workshop outline is
  language independent

- It should be named as `language.md` otherwise, where the `language` is the
  specific language (eg. `java.md` or `ts.md`)

- Please use the short versions of the languages

| Language   | Short version | Long version    |
|:-----------|:--------------|:----------------|
| JavaScript | `js.md`       | `javascript.md` |
| TypeScript | `ts.md`       | `typescript.md` |
| Java       | `java.md`     | `java.md`       |
| C          | `c.md`        | `c.md`          |
| C++        | `cpp.md`      | `cplusplus.md`  |
| C#         | `cs.md`       | `csharp.md`     |
| PHP        | `php.md`      | `php.md`        |
| Python 2   | `py2.md`      | `python2.md`    |
| Python 3   | `py3.md`      | `python3.md`    |
| Python     | `py.md`       | `python.md`     |

### Exercise folders

- Each exercise in a separate folder
- The folder name is the title of the exercise
- The folder should contain the specification of the exercise
  - It should be named as `README.md` if the exercise has the same description
    independent from language
  - Otherwise
    - It can be in surrounded by a wrapper skeleton, where the exercise's
      description is in comments. It should be named aligning with the language
      styleguide: `ExerciseName.ext` (eg: `FleetOfThings.java` or
      `fleet_of_things.ts`)
    - Or it can be in a `language.md` file, where the `language` is the specific
      language (eg. `java.md` or `ts.md`)
- If the exercise can't be placed into a language specific skeleton file
  (because it needs multiple files, too long to be placed there, etc...), the
  top line of the description should be `<!-- gabriel -->`, so the generating
  tool can skip creating the skeleton
- The folder of an exercise should contain a `tests` folder

#### Tests folder for an exercise

- It can contain language dependent unit tests named aligning with the language
  styleguide eg: `TestForSomething.java` or `test_for_something.ts`
- It can contain language independent output test named `test_name.json` with
  the following content:
  - An array of different test cases named `"cases"`
  - A case should be an object, with 2 mandatory keys: `"ex_input"` and
    `"ex_output"`
    - `ex_input` will be pushed to the standard input when the test is running
    - The standard output will be captured and matched against the `ex_output`
  - Example:

    ```json
    {
      "cases": [
        {
          "ex_input": [2, 3],
          "ex_output": ["16"]
        },
        {
          "ex_input": [0, 1],
          "ex_output": ["4"]
        },
        {
          "ex_input": [1, 0],
          "ex_output": ["2"]
        }
      ]
    }
    ```

### Example format for the whole workshop structure

```text
workshop-folder
  assets
  README.md
  lang.md
  exercise-folder
    tests
    Exercise.lang
    README.md
    lang.md
```

## Styleguide

[Markdown styleguide](styleguide/markdown.md)

Docker is required to run the md linter.

The linter can run locally with:

```bash
bash stylechecker.sh
```

## Localisation

### Branch naming

`<lang>-<topic>-<programming lang>`

for example:
`hu-expression-and-controlflow-js`

### Suggested translators

#### Our dictionary

| Language  | Link |
| --------- | ---- |
| Hungarian | [link](https://docs.google.com/spreadsheets/d/13weWp0cbbdoIQg_kKUnosABa1Ej0e9g4p5Q1gx_WQKQ/edit#gid=0) |

If you don't find the word what you need,
then standard IT dictionaries should be used.

#### IT dictionaries

| Language  | Link |
| --------- | ---- |
| Hungarian | [IT dictionary](http://www.tintakiado.hu/informatikai_szotar.php) |

### Slides for recorded videos

The presentation slides should be uploaded into [this Google Drive folder](https://drive.google.com/drive/u/0/folders/10KAmj_FN-U5QEEOKEVTXiSUe2dfob5p3)

### Style of workshop exercise md file

The old way was to write the task in comments, and the extension was `.js`,
`.cpp`, etc. Now we write the exercises in md files. Please do not write the
task description between `-s, but just as you would do in a 'normal' README.md
file. <br>
[old way](workshop/file-manipulations/birthdates/births.ts) <br>
[new, good way](workshop/data-structures/appendletter/append-letter.hu.js.md)

### Code Review

Ask the whole `teaching-materials-translation` team to review your code.
Just simply type this team name at the reviewers section of your pull request.

### Name of variables, functions, methods, etc

The name of variables, functions, methods... must be **in English**.
It's required in better companies
(if they don't have really special names for particular concepts)

### Strings

String contents allowed to be translated from English to whatever language.

### Filenames

We need to use the locale shorthands (like: hu, cz, ...) in the name of the
file before its extension.

#### Example

In the case of `workshop/functions/Bubble.java`
the filename should be: `workshop/functions/bubble/bubble.hu.java.md`

The old way was to write the task in comments, and the extension was `.js`,
`.cpp`, etc. Now we write the exercises in md files. Please do not write the
task description between `-s, but just as you would do in a 'normal' README.md
file. <br>
[old way](workshop/file-manipulations/birthdates/births.ts) <br>
[new, good way](workshop/data-structures/appendletter/append-letter.hu.js.md)

#### Reason of long filenames

In Java the class name should be equal to the filename.

- So we can't use `Bubble.hu.java`.
- And we shouldn't use `BubbleHu.java`. In this case the class name should be
  `BubbleHu`, it's not a good idea...
- So the best is to not handle these exercises as java files, but put the code
  of the class into code blocks and name the class there.

### Workflow in the Localisation project

#### Working on a new task

- `1.` Pick up a task from the `Todo` column, preferably from the top, because
  the tasks are sorted by priority, on the top you can find the most urgent
  tasks.
  Here you can find the board for the [Hungarian materials.](https://github.com/green-fox-academy/teaching-materials/projects/4)
- `2.` After you assigned the issue to yourself, start working on it on a new
  branch. ([branch naming](#branch-naming)), and move the issue to the next
  column.
- `3.` Start by searching for videos in the topic that cover the material.
  - if you find videos
    - create a file for the README in the needed language (HU, CZ, ...), for
      example `todo-app.hu.md`
    - copy the content of the original README file into the new one
    - replace the video links with the ones you found.
      Dont't leave there any English video url.
    - create a draft PR. This is how you can do it:
      ![Draft PR](assets/draftPR.png)
    - assign the PR review to the `teaching-materials-translation` team
    - move the issue to the `Videos found on YouTube under review` column
    - link the PR to the issue:<br>
      ![linked PR](assets/linkedPR.png)
    - please start the title of the PR with the date when the given material is
      scheduled to. Format: `MM.DD. - title of my PR`
  - if you do not find relevant videos:
    - move the issue to the `Record videos / Write material` column
    - create a new issue on the [Materials to be recorded board](https://github.com/green-fox-academy/teaching-materials/projects/6)
    - if you want to record it, assign it to yourself, and move it to the
      `Recording / in progress` column
    - if you do not want to record it, leave it there, someone else will do it
    - when you are finished, upload your video to our YT channel's language
      specific playlist (eg.: `Hungarian Teaching Materials` playlist),link it
      to the readme (see description above), ask for review, and move it to the
      `Review in progress` column. The uploaded video must have `unlisted`
      privacy.
    - if it is approved, the reviewer will move it to the `Reviewer approved`
      column
    - you, as the assignee, move it to the `Done` column, if you saw the
      approval, and continue the process
    - make sure you close the issue (there is a button for this)
    - if you recorded a video, and it is approved, please make sure to post it
      into the given communication channel, so your team will know they can
      start the translation process (or since the process became a little more
      flexible, the translated material can be completed with the video link)
  - besides the videos, there are some great articles too, that can be
    sufficient, and no video is needed. Here the same process goes as in the
    case of videos:
    - if you find articles, put them in a draft PR, and ask for review
    - it can go together in the same draft PR with the videos of course
    - if you don't find articles, you can include those topics in the videos, or
      write the material yourself (make sure it goes to the `material` folder).
      It needs review before merging.
    - link the PR to the issue
- `4.` Translation
  - On the
    [We need Hungarian materials](https://github.com/green-fox-academy/teaching-materials/projects/4) board
    grab a task that needs to be translated.
  - if it is waiting for recorded videos, but the deadline is soon, you can
    start to translate it. Assign it to yourself, and move it to the "Waiting
    for video recording, currently translating" column.
  - if the videos are approved/recorded, move the task to the "Videos ok,
    translating the material" column. Don't forget to assign it to yourself.
  - if you need to translate something, check if it has been already translated
    in another programming language (for example the tasks for the workshop).
    With reusing these translations, you can save time.
  - make sure to check language specific expressions, and replace them if needed
    (copying from a java translation to a js task --> check the used data
    structures, if the task asks for a list, change that to array, and so on)
  - use the already approved and merged translation for the headings
    (`Materials & Resources`, etc)
  - use the already approved and merged translation for the styleguide check at
    the end of the files (they are not everywhere)
  - please pay attention to expressions that we are not translating (styleguide,
    file, repository, stacktrace, etc.).
    You can find the list [here](https://docs.google.com/spreadsheets/d/13weWp0cbbdoIQg_kKUnosABa1Ej0e9g4p5Q1gx_WQKQ/edit?ts=5f96e293#gid=864461219).
    Feel free to add suggestions to it.
- `5.` Review
  - when you are done with the translation, push all your work, then squash the
    commits. Make sure that every check passes, and rebase if it is needed.
    (Go to master branch --> `git pull` --> checkout to your feature branch -->
    `git rebase -i master`)
    Then convert your draft PR into a live one, and assign the whole teaching
    materials team again as reviewer.
  - make sure to proofread it once more, and fix spelling errors, missing
    commas, etc.
  - if changes are required, it is your responsibility to fix them
- `6.` Done
  - if the PR is approved, merge it, and immediately delete the branch (there is
    an option offered on GitHub when you merge the branch).
  - if the reviewer merges it (suggested way), check the branches in the
    repository, and make sure the merged branch is deleted.
  - make sure the issue is in the `Done` column.
  - make sure you close the issue
  - don't forget to delete the branch locally too so your workplace doesn't get
    messy :)

#### Adding a new task

- When you add a new issue, please start the issue title with the date when the
  given material is scheduled to. Format: `MM.DD. - Title of the issue`

#### Continue the work on a task that's already in the flow

- If you see a task in the flow that is not assigned to anybody, you can pick it
  up by assigning it to yourself. Pull the branch that someone worked on so far.
- What columns to check: Translations, Reviews.
- Please squash the commits into one, with a meaningful message.

##### Creating video content for the Materials to be recorded board

- Pick a task form the Todo column, assign yourself and move it to the Create
  script for the video(s) column.
- Start working on the content for your video(s). If you want to you can ask
  someone from the `teaching-materials-translation-qa` team to take a look at
  your outlines. When you're done with the scripts, move to issue to the
  Recording / in progress column.
- Proceed with the recordings and upload your work to the YT channel. When all
  the videos are done, ask a Material Tech Lead to review them. If there
  are changes requested, move the issue back to the Recording / in progress
  column.
- If there are no changes requested, unassign yourself and move the issue to
  the Reviewer approved column. Let the original issue creator know that the
  videos are ready, they should take over from here and include the links to
  the video(s) in their pull request on the We need Hungarian materials board.
- When the pull request is approved, the original issue creator should move the
  issue to the Done column.

#### If you are a reviewer

- If you approve a PR, please move the issue to the Done column, delete the
  feature branch, and close the issue
- When you merge a PR, please change the commit message into the one that is
  left after they were squashed. When you click on Merge, GitHub offers an
  opportunity to change the default commit message.

#### Standups

- We suggest to do the standups for the Localisation project in written format
  in a separated slack channel. (Hungarian localisation project standups are in
  `tananyag` slack channel!)
- Please post your status updates every morning about every task of yours
  in the channel!
- Please make sure you read your teammates' updates as well!
