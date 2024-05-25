include .env

run_deploy:
	forge script script/Counter.s.sol --rpc-url $(RPC_URL) --etherscan-api-key $(ETHERSCAN_KEY) --verify --broadcast -vvvv --legacy --private-key $(PRIVATE_KEY)

level00: 
	forge script script/Level00.s.sol --rpc-url $(RPC_URL) --broadcast --legacy --private-key $(PRIVATE_KEY)

level01: 
	forge script script/Level01.s.sol --rpc-url $(RPC_URL) --broadcast --legacy --private-key $(PRIVATE_KEY)

level02: 
	forge script script/Level02.s.sol --rpc-url $(RPC_URL) --broadcast --legacy --private-key $(PRIVATE_KEY)
