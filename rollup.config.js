import babel from '@rollup/plugin-babel';

export default {
  input: 'test/index.js',
  output: {
    dir: 'build/test',
    format: 'iife',
    globals: {
      'chai': 'chai'
    }
  },
  external: ['chai'],
  plugins: [
    babel({ babelHelpers: 'bundled' })
  ]
};
