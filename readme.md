# Leaderboard 

Allow any address on the blockchain to monetize their attention.

## Origins story
[ilemi.eth](https://twitter.com/andrewhong5297)'s Dune Analytics dashboards and Twitter threads came to my attention in November 2021 in the wake of ConstitutionDAO, for which he created an excellent dash. It occurred to me that ilemi could charge people for the quantitative analysis he provides. Leaderboard is the system I created to help people like ilemi permissionlessly monetize their attention.

## Mechanism
Leaderboard allows EVM wallets to *draw attention* to a given address. 

Example scenario:

- ilemi deploys a Leaderboard to Ethereum Mainnet. He is the contract owner. He announces that he will do a Dune Dash and Twitter thread about any address that receives 1 ETH of attention.
- I, an enthusiast of a certain NFT collection or DAO, call `payAttention(address contract)` and send 0.1 ETH in the same transaction. I encourage nine of my closest friends to do the same. I ping ilemi on twitter when it is done with the contract address I want him to look into.
- ilemi calls `retrieveAttention(address contract)` and confirms that this address *has* received 1 ETH worth of attention. As the owner, he may `withdraw()` the contract's balance to his wallet, or he may `withdrawTo(address to, uint amount)` a portion of the contract's balance to any address.

## Extra features
- Owner may `resetAttention(address contract)` 
- Owner may pause `payAttention()`
- Anyone can call `totalAttention()` to see total attention paid (ETH).

## Deploy instructions
Copy paste the contract into remix and hit deploy lol.

## Author
[@nnnnicholas](https://twitter.com/nnnnicholas)