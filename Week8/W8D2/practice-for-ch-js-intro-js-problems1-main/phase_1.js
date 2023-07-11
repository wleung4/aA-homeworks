// Phase 1
function madLib (verb, adj, noun) {
	return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`;
}

function isSubstring(string, substring) {
	return string.includes(substring);
}

//Phase 2
function fizzBuzz(array) {
	const result = [];
	for(let i = 0; i < array.length; i++) {
		if ((array[i] % 3 === 0 && array[i] % 5 !== 0) || (array[i] % 3 !== 0 && array[i] % 5 === 0)) {
			result.push(array[i]);
		}
	}
	return result;
}

function isPrime(number) {
	if (number < 2) {
		return false;
	}

	for(let i = 2; i < number; i++) {
		if (number % i === 0) {
			return false;
		}
	}
	return true;
}

function sumOfNPrimes(n) {
	const array = [];
	for(let i = 2; array.length < n; i++) {
		if (isPrime(i)) {
			array.push(i);
		}
	}

	let sum = 0;
	for(let i = 0; i < array.length; i++) {
		sum += array[i];
	}
	return sum;
}