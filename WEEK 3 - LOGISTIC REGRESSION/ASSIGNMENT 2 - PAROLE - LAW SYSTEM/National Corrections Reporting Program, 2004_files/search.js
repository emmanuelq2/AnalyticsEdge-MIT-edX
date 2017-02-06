	function resetSearch() {
		radioButtons = document.getElementsByClassName("toggle-search");
		radioButtons[0].checked = "checked";
	}
	
	function swapSearch(visibleForm) {
		userTerm = "";
		searchForms = document.getElementsByClassName("search-option");
		for (var i = 0; i < searchForms.length; i++) {
			if(searchForms[i].style.display != "none") {
				//alert(searchForms[i].id);
	  			var inputs = searchForms[i].getElementsByTagName ('input');
	  			if (inputs) {
	   				for (var j = 0; j < inputs.length; j++) {
	      				if (inputs[j].type == 'text' && inputs[j].value != "") {
	      					userTerm = inputs[j].value;
	      					//alert(userTerm);
	      				}
	      			}
	      		}
	      	searchForms[i].style.display = "none";	
	      	}
		}
		
		activeSearch = document.getElementById(visibleForm);
		activeSearch.style.display = "block";
		var fields = activeSearch.getElementsByTagName ('input');
	  			if (fields) {
	   				for (var l = 0; l < fields.length; l++) {
	      				if (fields[l].type == 'text') {
	      					fields[l].value = userTerm;
	      				}
	      			}
	      		}
	}