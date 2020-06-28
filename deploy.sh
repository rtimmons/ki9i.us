#!/usr/bin/env bash
set -eou pipefail

pushd "$(dirname "$0")" >/dev/null || exit 1
    ROOT_DIR="$(pwd)"
popd >/dev/null || exit 1

pushd "$ROOT_DIR/site"  >/dev/null || exit 1
    zola build
popd >/dev/null || exit 1

rsync -azvhP "$ROOT_DIR/site/public/" rtimmons@ki9i.us:/home/rtimmons/public_html/ki9i.us/public_html/

