pragma solidity ^0.4.13

contract MyToken {

	/* Helps clients keep track of activitios happening in the contract
	...they should start with a Capital Letter */ 
	event Transfer(address indexed from, address indexed to, uint256 value);

	/* Public variables of the token */
	string public name;                                        // This was not in error b/f I added solidify version
	string public symbol;
	uint8 public decimals;

	/* This creates an array with all balances */
	mapping (address => uint256) public balanceOf;

	/* Initializes contract with initial supply tokens to
	the creator of the contract */
	function MyToken(uint256 initialSupply, string tokenName, 
		uint8 decimalUnits, string tokenSymbol) {
		balanceOf[msg.sender] = initialSupply;					// Give the creator all coins
		name = tokenName;										// Set the name for display purposes
		symbol = tokenSymbol; 									// Set the symbol for display purposes
		decimals = decimalUnits;								// Amount of decimals for display purposes


	}

	/* Send coins */
	function transfer(address _to, uint256 _value) {
		if (balanceOf[msg.sender] < _value) throw;				// Check if the sender has enough
		if (balanceOf[_to] + _value < balanceOf[_to]) throw;	// Check for overflows
		balanceOf[msg.sender] -= _value;						// Subtract from the sender
		balanceOf[_to] += _value;								// Add the same to the recipient
	
		Transfer(msg.sender, _to, _value);						// Notify anyone listening about this transfer

	}

	/* This is now 'my code' for creating specialized 
	functionality in this contract / token. 
	Flips: I want to simulate a coin toss wager of a specified amount
		Variables: 
		- participant #1 address and an arbitrary number he inputs
		- participant #2 address and an arbitrary number he inputs
		- amount to be wagered */

	function flips_function(
		address _first_participant, 
		uint8 _user_generated_num_first_part,
		address _second_participant, 
		uint8 _user_generated_num_second_part,
		uint256 _value) {

		/* Do not need to do the same checks as 'transfer'
		because the function will pass the transfer 
		function through it. */

		/* Need to simulate randomness */
		bytes32 rand_of_first_part = sha3(_user_generated_num_first_part, _first_participant);
		bytes32 rand_of_second_part = sha3(_user_generated_num_second_part, _second_participant);

		/* Find a winner by seeing how has the greatest value and do the transfer */
		if (rand_of_first_part > rand_of_second_part) {
			// 'transfer' function above won't work because it does not have included both participants addresses
			None; 
		} else if (rand_of_second_part > rand_of_first_part) {
			// same as above
			None;
		} else /* Want to return some error message here and then 'throw' */ {None;
		}



	}

}




	









