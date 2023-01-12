## Coding Test

#### Setup

- Real Vision will ask the candidate to provide an Ethereum public EOA that they will use on Goerli network to implement the coding test.
We recommend that the candidate NOT provide Real Vision with any address that contains 'real' assets on mainnet.
- Real Vision will grant the candidate's address a security role in the smart contract which will in turn allow them to grant itself and other
addresses the ability to Mint tokens from the contract (in other words, the role grants the candidate the ability to add itself and other
addresses to a minting Allow List, so to speak.) Therefore the candidate will be able to authorize their own address, and any other addresses
they wish to test with, the ability to mint NFTs from the smart contract.
- Real Vision will provide the candidate with the address of the smart contract on Goerli.
- The smart contract code can be found in a sub-directory of this repo/directory.

#### What the candidate should create

- The candidate should create a simple and elegant minting page that will interact with Real Vision's test NFT smart contract.
- The minting page should also have a section that displays any NFTs that the connected wallet already owns (a mini gallery of owned
NFTs from the smart contract.)

#### Acceptance criteria

- The candidate will need to understand the smart contract at a high-level, because they will need to authorize their own address to be
able to mint NFTs from the smart contract.
- The candidate should provide Real Vision with a URL where the minting web page can be accessed.
- The web page should be able to connect to a MetaMask wallet.
- The web page should handle and display simple wallet connection states gracefully (for example, it should display when the wallet is connected/disconnected,
but it does not necessarily need to handle edge cases like the wallet being connected to the wrong network.)
- The web page should provide a mechanism for authorized EOAs to mint NFTs from the smart contract. (The mint is free - the minter
should only have to pay for gas.)
- If the wallet/account connected to the web page has already minted some NFTs from the smart contract, the page should have a section
where these NFTs are displayed.
- (OPTIONAL Item 1) The candidate may attempt to restrict each address from minting more than 3 NFTs. This is not enforced by the smart contract,
so if the candidate would like to implement this piece, they will need to use cookies or a rudimentary off-chain database. (We are not looking for
a super secure or permanent solution here; just something that would demonstrate a little bit of creative problem solving, and that would be
sufficient to trick a very-non-technical customer/minter into thinking they can't mint more than 3 NFTs; it is okay if the solution can
be bypassed by savvy minters, because they would likely bypass the page anyways and interact directly with the smart contract.)
- (OPTIONAL Item 2) The candidate may make another section in the webpage that can be used by an authorized account to add other addresses to the Allow List
(in other words, an interface that allows authorized accounts to give other accounts the minting role.)

