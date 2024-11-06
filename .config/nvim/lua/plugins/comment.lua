return {
	-- "gc" to comment visual regions/lines
	'numToStr/Comment.nvim',
	config = function()
		local comment = require('Comment')
		local ft = require('Comment.ft')
		ft({ 'move' }, ft.get('c'))
		comment.setup()
	end,
}
