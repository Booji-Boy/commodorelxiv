#!/bin/bash

set -euo pipefail
<<<<<<< HEAD
tools/bootstrap/python -m dm_annotator "$@"
=======
tools/bootstrap/python tools/ci/annotate_dm.py "$@"
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
