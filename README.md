# js-test-kit
A starter-kit for testing front-end Javascript.

## System Requirements
The kit in this repository relies on Docker and the Docker Compose tools.

## Getting Started
The tooling in this repository all runs inside Docker containers, so to get running:

- Copy the files in this repository wherever your front-end code is going to live
- Edit some of the files, like `package.json` and `test_runner.html` to reference your own project
- Run `make test`

Remember, this is a starter-kit, so it's expected that you will tweak some of the configuration options to better suite your individual needs.

## Technical Details
This project uses Babel, Rollup, Livereload, Mocha, and Chai to provide a reactive, in-browser test environment for Javascript code.
A running test environment launches three containers, two of which are based on an LTS version of node: rollup, livereload, and nginx.
Each of these containers volume mounts a shared node_modules folder which lives inside a defined Docker volume.

The container responsibilities are:
- **rollup**: uses babel to compile ES6 code and bundle code into a single file to avoid modifying `test_runner.html`
- **livereload**: watches the generated test bundle for changes and reloads the browser window
- **nginx**: provides easy serving of `test_runner.html` and js/css from under the `node_modules` Docker volume

The in-browser test page is opened automatically by default, and can easily be changed by removing the lines referencing `$(OPEN_BIN)` in the `Makefile`.

If you want to use webpack or typescript instead, changes only need to be made to the `test-compiler` npm script, as well as adding your configuration for bundling and compilation.
