Insert Title
================
Author: Holiday Tang  
[LinkeDin](https://www.linkedin.com/in/holiday-t/) |
[GitHub](https://github.com/holiday007) | [Kaggle
Novice](https://www.kaggle.com/holibae007)
| Date: 2019-12-29

  - [Shared Options:](#shared-options)

Use includes option to include extra content, for example

    includes:
      in_header: header.md
      before_body: doc_prefix.md
      after_body: something.md

Markdown Extension:

  - By default R Markdown is defined as all pandoc markdown extensions
    with the following tweaks for backward compatibility with the
    markdown package:

<!-- end list -->

    +autolink_bare_uris
    +ascii_identifier
    +tex_math_single_backslash

  - You can enable or disable markdown extensions using the
    md\_extensions option (you preface an option with - to disable and +
    to enable it). For example:

<!-- end list -->

    ---
    title: "Habits"
    output:
      github_document:
        md_extensions: -autolink_bare_uris+hard_line_breaks
    ---

  - also allows integration of pandoc features through option,
    pandoc\_args:

## Shared Options:

If you want to specify a set of default options to be shared by multiple
documents within a directory you can include a file named \_output.yaml
within the directory. Note that no YAML delimiters or enclosing output
object are used in this file. For example:

\_output.yaml

    github_document:
      fig_width: 5
      fig_height: 5
