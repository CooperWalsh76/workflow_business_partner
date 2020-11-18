"use strict";

//------------------------------------------------------------------------------
// Rule Definition
//------------------------------------------------------------------------------

module.exports = {
	meta: {
		docs: {
			description: "Maximum characters allowed",
			category: "Possible Errors",
			recommended: true
		},

		schema: [

		]
	},

	create: function(context) {
		var sourceCode = context.getSourceCode();
		var length = String(sourceCode.getText()).length;
		return {
			Program: function() {
				if (length > 10000) {
					context.report({
						loc: {
							line: 1,
							column: 0
						},
						message: "Maximum characters allowed for JavaScripts used in workflow is 10000"
					});
				}
			}
		};
	}
};