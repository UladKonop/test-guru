document.addEventListener('turbolinks:load', function() {
	var formFields = document.getElementById('new_user')
    if (formFields) { passwordMatching() }	
})

function passwordMatching() {
	var password = document.getElementById('user_password')
	var passwordConfirmation = document.getElementById('user_password_confirmation')

	password.addEventListener('input', function() { passwordsCompare(password, passwordConfirmation) })
	passwordConfirmation.addEventListener('input', function() { passwordsCompare(password, passwordConfirmation) })
}

function passwordsCompare(password, passwordConfirmation) {
    password.classList.remove('border-danger')
    passwordConfirmation.classList.remove('border-danger')

	if (passwordConfirmation.value) {
        if (password.value == passwordConfirmation.value) {
            password.classList.add('border-success', 'border-2')
            passwordConfirmation.classList.add('border-success', 'border-2')
        } else {
            password.classList.remove('border-success')
            passwordConfirmation.classList.remove('border-success')
            
            password.classList.add('border-danger', 'border-2')
            passwordConfirmation.classList.add('border-danger', 'border-2')
        }
	}
	
}