console.log("Welcome to the test javascript space!");



// ==================================================================
// Print the day of the week
// ==================================================================
var currentDate = new Date();
// TODO: fix getDayOfWeek so this works
//var dayOfWeek = getDayOfWeek(currentDate);
//console.log("The current day of the week is: " + getDayOfWeek(currentDate));


// ==================================================================
// Print two strings with a colon
// ==================================================================
var firstString = "I love"
var secondString = "Dosa and curry"
var combinedString = combineStringsWithColon(firstString, secondString);

console.log("The first string is: " + firstString);
console.log("The second string is: " + secondString);
console.log("The combined string: " + combinedString);

// ==================================================================
// Print the numbers 25 - 37
// ==================================================================
console.log("Printing all the whole numbers starting from 25 and ending at 37");
// call the printNumbers functions and pass two integers into it


// ==================================================================
// Check to see if the first number is greater than the second number.  print true or false
// ==================================================================
console.log("Is 245 greater than 19?");



// ==================================================================
// helper functions
// ==================================================================

function getDayOfWeek (date) {
	// TODO: the below line does not work when we run the code.  Need to fix it
	// var days = ["Sunday","Monday"];
	return days[date.getDay()];
}

function combineStringsWithColon (first, second) {
  // return a string that combines the two parameters with a colon.  Example -  Benjamin: Green
}

function printNumbers (startNumber, endNumber){
	// use a for loop
}

function compareNumbers (firstNum, secondNum){
	// return true if first number is bigger than second numbers
	// return false otherwise
}


