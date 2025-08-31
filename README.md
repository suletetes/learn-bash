# Learn Bash  Shell scripting examples and provisioning samples

A collection of shell scripting examples, small projects, and provisioning configurations intended for learning and demonstration purposes. The scripts assume a POSIX/Linux environment and the Bash shell.

## Top-level layout

- `shell-scripting-tutorial/` — Bash and shell scripting exercises and example projects (user/account management, parsing, data transformation, networking scripts).
  - `03 user and account creation/localUsers/` — basic examples for creating local users.
  - `4 password generation project/` — examples showing password creation and user setup.
  - `5 linux programming conventions project 3/` — utilities such as `add-newer-local-user.sh` that create users with generated passwords.
  - `6 parsing commandline options/` — examples demonstrating option parsing.
  - `7 transforming data/` — text-processing examples.
  - `8 networking scripting/` — simple scripts for network-related tasks.

- `vagrant-examples/` — Vagrant and environment provisioning examples.

- `provisioning-examples/` — Infrastructure and provisioning examples (Dockerfile, Vagrantfile).

## Quick notes and conventions

- All scripts use a Bash shebang (`#!/bin/bash`). Run them on a Linux system with Bash installed.
- Many scripts must be run with elevated privileges (`sudo` or root) when they interact with system users, groups, or network configuration.
- File and directory names should use kebab-case for consistency and readability.

## Example: add-newer-local-user.sh

**Location:**

shell-scripting-tutorial/5 linux programming conventions project 3/add-newer-local-user.sh

**Purpose:**

Create a new local user with a generated password, force password change on first login, and display the username, password, and host.

**Usage:**

sudo ./add-newer-local-user.sh USER_NAME [COMMENT]

**Behavior and portability notes:**

- The script requires root privileges to run account management commands.
- It generates a password using `date` + `sha256sum` and sets the password using a distribution-specific `passwd` invocation. Some systems (for example, many Red Hat-based distros) accept `passwd --stdin`; others (Debian/Ubuntu) do not.
- If `passwd --stdin` is unsupported on your system, replace the password-setting section with an alternative such as:

  `echo "\${USER_NAME}:\${PASSWORD}" | chpasswd`

- The script forces password expiry (`passwd -e`) so the user must change their password at first login.
- Always review scripts that modify system users before running them on production or shared systems.

