 
var app = {
	
	initialize : function () {	
		// set up listeners
		$('form').on('submit', app.validateForm);
		$('form').on('keydown', '.has-error', app.removeError);
	},

	validateForm: function (e) {
		var form = $(this), // form instance 
			inputs = form.find('input'), // get input fields
			isValid = true; // valid by default
		
		inputs.tooltip('destroy');

		$.each(inputs, function(index, val) {
			var input = $(val),
				val = input.val(), // get inputted value
				formGroup = input.parents('.form-group'), // parent div
				label = formGroup.find('label').text().toLowerCase(), // text label
				textError = 'Input ' + label;

			if (val.length === 0) {
				formGroup.addClass('has-error').removeClass('has-success');	// switch classes
				
				input.tooltip({ // set up tooltips
					trigger: 'manual',
					placement: 'right',
					title: textError
				}).tooltip('show');		
				
				isValid = false;
			} else {
				formGroup.removeClass('has-error').addClass('has-success');
				input.tooltip('hide');
			}	
		});

		return isValid; // if false then reloading will be prevented
	},

	removeError: function() {
		$(this).removeClass('has-error').find('input').tooltip('destroy');
	}
}

$(document).ready(app.initialize);