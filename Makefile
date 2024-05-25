include .env

run_deploy:
	forge script script/Counter.s.sol --rpc-url $(RPC_URL) --etherscan-api-key $(ETHERSCAN_KEY) --verify --broadcast -vvvv --legacy --private-key $(PRIVATE_KEY)

level00: 
	forge script script/Level00.s.sol --rpc-url $(RPC_URL) --broadcast --legacy --private-key $(PRIVATE_KEY)

level01: 
	forge script script/Level01.s.sol --rpc-url $(RPC_URL) --broadcast --legacy --private-key $(PRIVATE_KEY)

level02: 
	forge script script/Level02.s.sol --rpc-url $(RPC_URL) --broadcast --legacy --private-key $(PRIVATE_KEY)

level03: 
	forge script script/Level03.s.sol --tc CoinFlipScript --rpc-url $(RPC_URL) --broadcast --legacy --private-key $(PRIVATE_KEY)

level04: 
	forge script script/Level04.s.sol --tc TelephoneScript --rpc-url $(RPC_URL) --broadcast --legacy --private-key $(PRIVATE_KEY)

level05: 
	forge script script/Level05.s.sol --rpc-url $(RPC_URL) --broadcast --legacy --private-key $(PRIVATE_KEY)
