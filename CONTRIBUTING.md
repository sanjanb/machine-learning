# Contributing

Thank you for contributing. Quick setup to avoid committing large notebook outputs:

- Install Python tooling:

  - `pip install pre-commit nbstripout`

- Install pre-commit hooks in your local clone:

  - `pre-commit install`

- Enable nbstripout for this repository (one-time):

  - `nbstripout --install`

- To validate everything on existing files locally:

  - `pre-commit run --all-files`

If you use other tooling (black, isort, linters) please add them to `.pre-commit-config.yaml`.

If you need help, open an issue or ping the maintainers.
