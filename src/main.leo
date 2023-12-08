// The 'token_29285' program.
program token_29285.aleo {

	// Define a token struct with an owner and balance
	record Token {
		owner: address,
		balance: u32,
	}

	// Define a mint transition that takes a balance and returns a token
	transition mint(amount: u32) -> Token {
		return Token {
			owner: self.caller,
			balance: amount,
		};
	}

	transition transfer(receiver: address, amount: u32, input: Token) -> (Token, Token) {
		let sender_balance: u32 = input.balance - amount;

		let sender: Token = Token {
			owner: self.caller,
			balance: sender_balance,
		};

		let recipient: Token = Token {
			owner: receiver,
			balance: amount,
		};

		return (sender, recipient);
	}
}
