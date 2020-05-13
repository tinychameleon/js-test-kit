import sum from '../src/index';

describe('sum', function() {
    it('should work', function() {
	assert.equal(sum(1, 4), 5);
    });
});
