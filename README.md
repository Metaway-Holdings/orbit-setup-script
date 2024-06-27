# orbit-setup-script

These scripts will help you fund newly generated batch-poster and validator addresses, configure an Orbit chain, and deploy bridge contracts on both L2 and L3 chains.

## Instructions deploy first node

Once you’ve downloaded both config files from the [Orbit Deployment UI](https://orbit.arbitrum.io/), please follow the steps below to complete local deployment of your Orbit chain. For more details and step-by-step instructions, check out the [documentation](https://developer.arbitrum.io/launch-orbit-chain/orbit-quickstart).

1. Clone the https://github.com/Metaway-Holdings/orbit-setup-script.git repository, and run `yarn install`. Then, move both the `nodeConfig.json` and `orbitSetupScriptConfig.json` files into the `config` directory within the cloned repository
2. Launch Docker, and in the base directory, run `docker-compose up -d`. This will launch the node with a public RPC reachable at http://localhost:8449/  and a corresponding BlockScout explorer instance, viewable at http://localhost/
3. Then, add the private key for the wallet you used to deploy the rollup contracts earlier in the following command, and run it: `PRIVATE_KEY="0xYourPrivateKey" L2_RPC_URL="<https://sepolia-rollup.arbitrum.io/rpc>" L3_RPC_URL="http://localhost:8449" yarn run setup`
4. The Orbit chain is now up. You can find all information about the newly deployed chain in the `outputInfo.json` file which is created in the main directory of script folder
5. Optionally, to track logs, run the following command within the base directory: `docker-compose logs -f nitro`


## Instructions deploy more node

### 1. Clone 
https://github.com/Metaway-Holdings/orbit-setup-script.git

### 2. Install
```shell
yarn install
```
### 3. 
```shell
docker compose -f docker-compose.node.yaml  up -d
```


```shell
docker run -d \
--name hyra_node \
  -p 8547:8547 \
  -p 8548:8548 \
  -p 9642:9642 \
  offchainlabs/nitro-node:v3.0.2-9efbc16-validator \
--parent-chain.connection.url='https://sepolia-rollup.arbitrum.io/rpc' \
--chain.info-json="[{\"chain-id\":12489497903,\"parent-chain-id\":421614,\"parent-chain-is-arbitrum\":true,\"chain-name\":\"Hyperas Chain Testnet\",\"chain-config\":{\"homesteadBlock\":0,\"daoForkBlock\":null,\"daoForkSupport\":true,\"eip150Block\":0,\"eip150Hash\":\"0x0000000000000000000000000000000000000000000000000000000000000000\",\"eip155Block\":0,\"eip158Block\":0,\"byzantiumBlock\":0,\"constantinopleBlock\":0,\"petersburgBlock\":0,\"istanbulBlock\":0,\"muirGlacierBlock\":0,\"berlinBlock\":0,\"londonBlock\":0,\"clique\":{\"period\":0,\"epoch\":0},\"arbitrum\":{\"EnableArbOS\":true,\"AllowDebugPrecompiles\":false,\"DataAvailabilityCommittee\":true,\"InitialArbOSVersion\":11,\"GenesisBlockNum\":0,\"MaxCodeSize\":24576,\"MaxInitCodeSize\":49152,\"InitialChainOwner\":\"0x6a77cc455bA677435C4a334bD5e6E9801722FbF9\"},\"chainId\":12489497903},\"rollup\":{\"bridge\":\"0xa3886969e8399bE96b34444EaAB5289C70614530\",\"inbox\":\"0xa22Ab2716c21DB473DDB0fd9d3435BF19eFFBC79\",\"sequencer-inbox\":\"0x12831e8AE02327BAb1c67dE359ce4d4923569407\",\"rollup\":\"0xAD2f28F06CBAb1831b6d529e45D1752b4FdCF199\",\"validator-utils\":\"0xB11EB62DD2B352886A4530A9106fE427844D515f\",\"validator-wallet-creator\":\"0xEb9885B6c0e117D339F47585cC06a2765AaE2E0b\",\"deployed-at\":58166021}}]" \
--chain.name='Hyperas Chain Testnet' \
--execution.forwarding-target=null \
--node.data-availability.enable \
--node.data-availability.rest-aggregator.urls='[https://das-orbit.hyperaschain.com]'

```

```shell
docker run --rm -it -p 0.0.0.0:8547:8547 -p 0.0.0.0:8548:8548 offchainlabs/nitro-node:v2.3.4-b4cc111 --parent-chain.connection.url=https://sepolia-rollup.arbitrum.io/rpc --chain.id=12489497903 --chain.name='Hyperas Chain Testnet' --http.api=net,web3,eth --http.corsdomain=* --http.addr=0.0.0.0 --http.vhosts=* --chain.info-json="[{\"chain-id\":12489497903,\"parent-chain-id\":421614,\"parent-chain-is-arbitrum\":true,\"chain-name\":\"Hyperas Chain Testnet\",\"chain-config\":{\"homesteadBlock\":0,\"daoForkBlock\":null,\"daoForkSupport\":true,\"eip150Block\":0,\"eip150Hash\":\"0x0000000000000000000000000000000000000000000000000000000000000000\",\"eip155Block\":0,\"eip158Block\":0,\"byzantiumBlock\":0,\"constantinopleBlock\":0,\"petersburgBlock\":0,\"istanbulBlock\":0,\"muirGlacierBlock\":0,\"berlinBlock\":0,\"londonBlock\":0,\"clique\":{\"period\":0,\"epoch\":0},\"arbitrum\":{\"EnableArbOS\":true,\"AllowDebugPrecompiles\":false,\"DataAvailabilityCommittee\":true,\"InitialArbOSVersion\":11,\"GenesisBlockNum\":0,\"MaxCodeSize\":24576,\"MaxInitCodeSize\":49152,\"InitialChainOwner\":\"0x6a77cc455bA677435C4a334bD5e6E9801722FbF9\"},\"chainId\":12489497903},\"rollup\":{\"bridge\":\"0xa3886969e8399bE96b34444EaAB5289C70614530\",\"inbox\":\"0xa22Ab2716c21DB473DDB0fd9d3435BF19eFFBC79\",\"sequencer-inbox\":\"0x12831e8AE02327BAb1c67dE359ce4d4923569407\",\"rollup\":\"0xAD2f28F06CBAb1831b6d529e45D1752b4FdCF199\",\"validator-utils\":\"0xB11EB62DD2B352886A4530A9106fE427844D515f\",\"validator-wallet-creator\":\"0xEb9885B6c0e117D339F47585cC06a2765AaE2E0b\",\"deployed-at\":58166021}}]" --execution.forwarding-target=null --node.data-availability.enable --node.data-availability.rest-aggregator.urls=['https://das-orbit.hyperaschain.com']



```

docker run --rm -it -p 0.0.0.0:8547:8547 -p 0.0.0.0:8548:8548 offchainlabs/nitro-node:v3.0.2-9efbc16-validator --parent-chain.connection.url=https://sepolia-rollup.arbitrum.io/rpc --chain.id=12489497903 --chain.name='Hyperas Chain Testnet' --http.api=net,web3,eth --http.corsdomain=* --http.addr=0.0.0.0 --http.vhosts=* --chain.info-json="[{\"chain-id\":12489497903,\"parent-chain-id\":421614,\"parent-chain-is-arbitrum\":true,\"chain-name\":\"Hyperas Chain Testnet\",\"chain-config\":{\"homesteadBlock\":0,\"daoForkBlock\":null,\"daoForkSupport\":true,\"eip150Block\":0,\"eip150Hash\":\"0x0000000000000000000000000000000000000000000000000000000000000000\",\"eip155Block\":0,\"eip158Block\":0,\"byzantiumBlock\":0,\"constantinopleBlock\":0,\"petersburgBlock\":0,\"istanbulBlock\":0,\"muirGlacierBlock\":0,\"berlinBlock\":0,\"londonBlock\":0,\"clique\":{\"period\":0,\"epoch\":0},\"arbitrum\":{\"EnableArbOS\":true,\"AllowDebugPrecompiles\":false,\"DataAvailabilityCommittee\":true,\"InitialArbOSVersion\":11,\"GenesisBlockNum\":0,\"MaxCodeSize\":24576,\"MaxInitCodeSize\":49152,\"InitialChainOwner\":\"0x6a77cc455bA677435C4a334bD5e6E9801722FbF9\"},\"chainId\":12489497903},\"rollup\":{\"bridge\":\"0xa3886969e8399bE96b34444EaAB5289C70614530\",\"inbox\":\"0xa22Ab2716c21DB473DDB0fd9d3435BF19eFFBC79\",\"sequencer-inbox\":\"0x12831e8AE02327BAb1c67dE359ce4d4923569407\",\"rollup\":\"0xAD2f28F06CBAb1831b6d529e45D1752b4FdCF199\",\"validator-utils\":\"0xB11EB62DD2B352886A4530A9106fE427844D515f\",\"validator-wallet-creator\":\"0xEb9885B6c0e117D339F47585cC06a2765AaE2E0b\",\"deployed-at\":58166021}}]" --execution.forwarding-target=null --node.data-availability.enable --node.data-availability.rpc-aggregator.enable --node.data-availability.rest-aggregator.enable --node.data-availability.rest-aggregator.urls='[https://das-orbit.hyperaschain.com]'  --node.batch-poster.enable --node.batch-poster.parent-chain-wallet.private-key=cfee27460029a09c927ecde286b93b127a1d154595c83bb8f63927d60ee38c16


--node.batch-poster.parent-chain-wallet.only-create-key 

hyratothemoon@2024

0x28178057f3Efc87E721522784e08fE7809F0ADfF