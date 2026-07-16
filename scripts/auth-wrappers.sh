#!/usr/bin/env bash

# Token pulled from pass on demand, not kept in the environment
# example:
#   gh pr list                          # uses wizzair token (default)
#   GH_ACCOUNT=personal gh pr list      # uses personal token for this invocation
#   export GH_ACCOUNT=personal          # flip default for the shell
gh() {
    local key="github/${GH_ACCOUNT:-wizzair}"
    GH_TOKEN="$(pass show "$key")" command gh "$@"
}

# Shortcut: `copilot ...` == `gh copilot ...`, inherits the gh() wrapper's auth.
# copilot() { gh copilot "$@"; }

oc() {
    OPENCODE_AUTH_CONTENT="$(pass show github/opencode-auth)" command opencode "$@"
}
